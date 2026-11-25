---
name: setup-egm
description: "Install, update or remove Google's EGM (Elephant-Goldfish Model) plugin across Claude Code, Codex and Antigravity, and wire a repo so EGM's Goldfish review works beside Matt Pocock's engineering skills."
disable-model-invocation: true
---

# Setup EGM

EGM ships as a **plugin**, not a skill: its skills read the reviewer personas in `agents/` and the standards in `resources/` at run time, so a skills-only install breaks it. This skill installs the upstream plugin untouched and keeps every local choice on the **repo side** (an instruction-file block and one doc). Nothing of EGM is copied, so an update is a plugin update and can never conflict with the wiring.

Two jobs, independent of each other. Run the one the user asked for; on a bare `/setup-egm`, do both in order.

## 1. Machine: the plugin

`scripts/egm.sh <install|update|uninstall|status>` drives each CLI's own plugin commands and checks the end state after every action. `install.sh`, `update.sh` and `uninstall.sh` are one-line wrappers around it.

1. Run `scripts/egm.sh status` and show the result.
2. **Claude Code config dirs.** The plugin installs per config dir, and the script's default is `$CLAUDE_CONFIG_DIR`, else `~/.claude`. List the `~/.claude*` directories that hold a `settings.json`, name the one this session runs under, and ask which to target. Pass each chosen dir as `--claude-config-dir <dir>`. A machine that separates work and personal configs must not get the plugin in the wrong one.
3. Run the action with `--dry-run` first when the user wants to see the commands, then for real. Limit providers with `--provider claude|codex|agy` (repeatable); with none, every supported CLI on `PATH` is used.
4. Report each provider's line from the script. A non-zero exit means a provider did not reach the intended state: show its output and stop.

Per-CLI facts the script encodes:

- **Claude Code** updates in place (`marketplace update`, then `plugin update`); a restart applies it. Commands are namespaced: `/egm:egm-review` (also in Antigravity; Codex uses its skill picker).
- **Codex** has no plugin update, so `update` refreshes the marketplace snapshot and reinstalls. `CODEX_HOME` selects another Codex config.
- **Antigravity (`agy`)** has no plugin update either, so `update` uninstalls and reinstalls from the repository. It has one global plugin directory.

Done when `scripts/egm.sh status` prints the intended state for every targeted provider and config dir.

## 2. Repo: the wiring

Skip this job on `uninstall`; instead offer to remove what it wrote (the `### EGM` sub-block, the `EGM artifact directory:` line, `docs/agents/egm.md`, the `.gitignore` entry). The scripts never touch a repo.

1. **Explore.** Which of `CLAUDE.md` / `AGENTS.md` exists at the repo root, and does it already hold an `## Agent skills` block or an `EGM artifact directory:` line? Does `docs/agents/egm.md` exist? Is `docs/agents/issue-tracker.md` there (a sign `setup-matt-pocock-skills` ran)? Where do the glossary and ADRs live (`GLOSSARY.md`, `docs/adr/`)? Is there a `docs/designs/` or another home for approved specs?
2. **Ask, one question at a time, recommended answer first.**
   - Artifact directory for briefs, drafts and review reports. Recommend `.dev/docs`, git-ignored: a review leaves several report files that are scratch once the spec is approved.
   - Home of approved specs. Recommend `docs/designs/`, committed.
3. **Write**, patching in place and leaving the user's other text alone:
   - Edit `CLAUDE.md` if it exists, else `AGENTS.md`; if neither exists, ask which to create. When one is a symlink to the other, edit the real file.
   - Put `EGM artifact directory: <path>` on its own line in that file. EGM reads this line from the instruction file itself, so a pointer to another doc does not work.
   - Add an `### EGM` sub-block under `## Agent skills` (create the block if absent): one line naming the two directories, then `See docs/agents/egm.md`.
   - Write `docs/agents/egm.md` from [egm-workflow.md](references/egm-workflow.md), filling the paths and dropping the sections for skills that are not installed.
   - Add the artifact directory to `.gitignore` when the user chose to ignore it.
4. **Report** the files written and point at `/egm:egm-review <file>` (Claude Code and Antigravity; the skill picker in Codex) as the first thing to try.

Done when the instruction file carries the `EGM artifact directory:` line, `docs/agents/egm.md` exists with real paths, and re-running this job changes nothing.
