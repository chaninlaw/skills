#!/usr/bin/env bash
# Install, update, uninstall or report the EGM plugin across agent CLIs.
# Usage: egm.sh <install|update|uninstall|status> [--provider claude|codex|agy]...
#               [--claude-config-dir DIR]... [--dry-run]
# No --provider: every supported CLI on PATH. No --claude-config-dir: $CLAUDE_CONFIG_DIR, else ~/.claude.
set -uo pipefail

REPO="google/elephant-goldfish-model"
REPO_URL="https://github.com/${REPO}"
PLUGIN="egm"
MARKETPLACE="egm"

action="${1:-}"
[ $# -gt 0 ] && shift
providers=""
claude_dirs=()
dry_run=0

usage() {
  sed -n '2,5p' "$0" | sed 's/^# \{0,1\}//'
  exit "${1:-0}"
}

while [ $# -gt 0 ]; do
  case "$1" in
    --provider) providers="$providers ${2:?--provider needs a value}"; shift 2 ;;
    --claude-config-dir) claude_dirs+=("${2:?--claude-config-dir needs a value}"); shift 2 ;;
    --dry-run) dry_run=1; shift ;;
    -h|--help) usage 0 ;;
    *) echo "Unknown argument: $1" >&2; usage 2 ;;
  esac
done

case "$action" in
  install|update|uninstall|status) ;;
  *) usage 2 ;;
esac

if [ -z "$providers" ]; then
  for cli in claude codex agy; do
    command -v "$cli" >/dev/null 2>&1 && providers="$providers $cli"
  done
fi
if [ ${#claude_dirs[@]} -eq 0 ]; then
  claude_dirs=("${CLAUDE_CONFIG_DIR:-$HOME/.claude}")
fi

failures=0
fail() {
  echo "  FAILED: $1" >&2
  failures=$((failures + 1))
}

# run <label> <command...>: print the command, run it unless --dry-run, count a failure.
run() {
  local label="$1"; shift
  echo "  \$ $*"
  [ "$dry_run" -eq 1 ] && return 0
  "$@" || { fail "$label"; return 1; }
}

# attempt <command...>: like run, but the command may already be in its end state
# (a marketplace that exists or is gone). expect_state judges the outcome instead.
attempt() {
  echo "  \$ $*"
  [ "$dry_run" -eq 1 ] && return 0
  "$@" >/dev/null 2>&1 || true
}

# expect_state <installed|absent> <has-command...>: count a failure when the plugin
# did not end up where the action meant to leave it.
expect_state() {
  local want="$1"; shift
  [ "$dry_run" -eq 1 ] && return 0
  if "$@"; then
    [ "$want" = installed ] || fail "plugin is still installed"
  else
    [ "$want" = absent ] || fail "plugin is not installed after the command"
  fi
}

# Each *_has reads the CLI's JSON listing of installed plugins only.
claude_has() {
  CLAUDE_CONFIG_DIR="$1" claude plugin list --json 2>/dev/null |
    grep -Eq "\"id\": *\"${PLUGIN}@${MARKETPLACE}\""
}
codex_has() {
  codex plugin list --json 2>/dev/null | tr -d '\n ' |
    grep -Eq "\"(id|name)\":\"${PLUGIN}(@${MARKETPLACE})?\"[^}]*\"installed\":true|\"installed\":true[^}]*\"(id|name)\":\"${PLUGIN}(@${MARKETPLACE})?\""
}
agy_has() {
  agy plugin list --json 2>/dev/null | grep -Eq "\"name\": *\"${PLUGIN}\""
}

do_claude() {
  local dir
  for dir in "${claude_dirs[@]}"; do
    dir="${dir/#\~/$HOME}"
    echo "Claude Code ($dir)"
    if [ ! -d "$dir" ]; then
      fail "config dir does not exist"
      continue
    fi
    case "$action" in
      status)
        if claude_has "$dir"; then echo "  installed"; else echo "  not installed"; fi ;;
      install)
        if claude_has "$dir"; then echo "  already installed"; continue; fi
        attempt env CLAUDE_CONFIG_DIR="$dir" claude plugin marketplace add "$REPO"
        run "claude install" env CLAUDE_CONFIG_DIR="$dir" claude plugin install "${PLUGIN}@${MARKETPLACE}" --scope user
        expect_state installed claude_has "$dir" ;;
      update)
        if ! claude_has "$dir"; then echo "  not installed: run install first"; continue; fi
        run "claude marketplace update" env CLAUDE_CONFIG_DIR="$dir" claude plugin marketplace update "$MARKETPLACE"
        run "claude update" env CLAUDE_CONFIG_DIR="$dir" claude plugin update "${PLUGIN}@${MARKETPLACE}"
        expect_state installed claude_has "$dir" ;;
      uninstall)
        if claude_has "$dir"; then
          run "claude uninstall" env CLAUDE_CONFIG_DIR="$dir" claude plugin uninstall "${PLUGIN}@${MARKETPLACE}"
        else
          echo "  plugin not installed"
        fi
        attempt env CLAUDE_CONFIG_DIR="$dir" claude plugin marketplace remove "$MARKETPLACE"
        expect_state absent claude_has "$dir" ;;
    esac
  done
}

do_codex() {
  echo "Codex CLI"
  case "$action" in
    status)
      if codex_has; then echo "  installed"; else echo "  not installed"; fi ;;
    install)
      if codex_has; then echo "  already installed"; return; fi
      attempt codex plugin marketplace add "$REPO"
      run "codex install" codex plugin add "${PLUGIN}@${MARKETPLACE}"
      expect_state installed codex_has ;;
    update)
      if ! codex_has; then echo "  not installed: run install first"; return; fi
      # Codex has no plugin update: refresh the marketplace snapshot, then reinstall from it.
      run "codex marketplace upgrade" codex plugin marketplace upgrade "$MARKETPLACE"
      attempt codex plugin remove "${PLUGIN}@${MARKETPLACE}"
      run "codex reinstall" codex plugin add "${PLUGIN}@${MARKETPLACE}"
      expect_state installed codex_has ;;
    uninstall)
      attempt codex plugin remove "${PLUGIN}@${MARKETPLACE}"
      attempt codex plugin marketplace remove "$MARKETPLACE"
      expect_state absent codex_has ;;
  esac
}

do_agy() {
  echo "Antigravity (agy)"
  case "$action" in
    status)
      if agy_has; then echo "  installed"; else echo "  not installed"; fi ;;
    install)
      if agy_has; then echo "  already installed"; return; fi
      run "agy install" agy plugin install "$REPO_URL"
      expect_state installed agy_has ;;
    update)
      if ! agy_has; then echo "  not installed: run install first"; return; fi
      # agy has no plugin update: reinstall from the repository.
      run "agy uninstall" agy plugin uninstall "$PLUGIN"
      run "agy reinstall" agy plugin install "$REPO_URL"
      expect_state installed agy_has ;;
    uninstall)
      if agy_has; then run "agy uninstall" agy plugin uninstall "$PLUGIN"; else echo "  plugin not installed"; fi
      expect_state absent agy_has ;;
  esac
}

[ -z "$providers" ] && echo "No supported CLI found (claude, codex, agy)."

for provider in $providers; do
  if ! command -v "$provider" >/dev/null 2>&1; then
    echo "$provider: CLI not found on PATH, skipped"
    continue
  fi
  case "$provider" in
    claude) do_claude ;;
    codex) do_codex ;;
    agy) do_agy ;;
    *) echo "Unknown provider: $provider" >&2; failures=$((failures + 1)) ;;
  esac
done

[ "$dry_run" -eq 1 ] && echo "Dry run: nothing was changed."
[ "$failures" -eq 0 ] || { echo "$failures step(s) failed." >&2; exit 1; }
exit 0
