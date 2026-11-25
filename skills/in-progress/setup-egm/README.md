# setup-egm

Installs Google's [EGM](https://egm.dev/guide/) (Elephant-Goldfish Model) plugin across Claude Code, Codex and Antigravity, keeps it up to date, and wires a repo so EGM's review works beside [Matt Pocock's engineering skills](https://github.com/mattpocock/skills).

EGM in one line: the **Elephant** is the thread that holds the background and writes the plan; the **Goldfish** are fresh reviewers that read only the written plan and the code, never the conversation behind it.

## Why a setup skill

EGM is a plugin, not a skill. Its skills read reviewer personas and document standards from the plugin folder at run time, so `npx skills add google/elephant-goldfish-model` installs something that cannot run a review. Each CLI also has its own plugin commands, and Claude Code installs per config directory. This skill puts all of that behind one script.

Nothing of EGM is copied here. The plugin stays upstream and untouched; the choices that are yours (where files go, which skill handles which step) live in your repo. An EGM update is a plugin update and cannot conflict with them.

## Install this skill

```bash
npx skills add chaninlaw/skills --skill setup-egm
```

## Use it from an agent

Type `/setup-egm`. It does two jobs:

1. **Machine**: shows where the plugin is installed, asks which Claude Code config directories to target, then installs, updates or removes it.
2. **Repo**: asks where EGM's drafts and reports go and where approved specs live, adds an `EGM artifact directory:` line and an `### EGM` entry to your `CLAUDE.md` or `AGENTS.md`, and writes `docs/agents/egm.md` with the workflow below.

Ask for one job only when that is all you want: "run setup-egm, update only", "run setup-egm for this repo".

## Use the script directly

`scripts/egm.sh <install|update|uninstall|status>`; `install.sh`, `update.sh` and `uninstall.sh` are shortcuts for the first three.

```bash
scripts/egm.sh status                       # where is it installed?
scripts/install.sh                          # every supported CLI on PATH
scripts/install.sh --dry-run                # print the commands, change nothing
scripts/update.sh                           # pull the latest EGM everywhere
scripts/uninstall.sh --provider codex       # one provider only
```

| Flag | Meaning |
| --- | --- |
| `--provider claude\|codex\|agy` | Limit to a provider. Repeatable. Default: every supported CLI on `PATH`. |
| `--claude-config-dir DIR` | A Claude Code config directory. Repeatable. Default: `$CLAUDE_CONFIG_DIR`, else `~/.claude`. |
| `--dry-run` | Print the commands without running them. |

Several Claude Code configs on one machine each need the plugin:

```bash
scripts/install.sh --provider claude \
  --claude-config-dir ~/.claude --claude-config-dir ~/.claude-personal
```

The script checks the plugin's state after every action and exits non-zero when a provider did not end up where the action meant to leave it. Restart the CLI after an install or update.

How `update` works per provider:

- **Claude Code**: refreshes the marketplace, then updates the plugin in place.
- **Codex**: has no plugin update, so the marketplace snapshot is refreshed and the plugin reinstalled. Set `CODEX_HOME` to target another Codex config.
- **Antigravity (`agy`)**: has no plugin update, so the plugin is uninstalled and reinstalled. It has one plugin directory for the whole machine.

`uninstall` removes the plugin and its marketplace entry. It never touches a repo: delete the `EGM artifact directory:` line, the `### EGM` entry and `docs/agents/egm.md` yourself, or ask `/setup-egm` to.

## Running EGM

| Harness | How to start a review |
| --- | --- |
| Claude Code | `/egm:egm-review <file>` |
| Antigravity (`agy`) | `/egm:egm-review <file>` |
| Codex | pick the `egm-review` skill from the skill picker, then name the file |

EGM's [harness notes](https://github.com/google/elephant-goldfish-model/blob/main/docs/harnesses.md) are the reference when a command form changes.

A full review runs five stages and around fifteen reviewer agents, so it uses a lot of your model allowance. Pick "Feature spec only" for a design that has no implementation plan yet.

## Working with Matt Pocock's skills

EGM overlaps those skills in brainstorming, drafting and building. The wiring keeps one method per step:

| Step | Use |
| --- | --- |
| Sharpen the problem | `grilling`, `grill-with-docs` |
| Write the spec | `to-spec` |
| Review the written plan | `egm-review`, then `egm-resolve` |
| Build | `tdd`, `implement-spec` |
| Check docs against code | `egm-drift-report` |

From spec to review:

1. `to-spec` publishes to the issue tracker; `egm-review` needs a file. Save the spec text into the EGM artifact directory first.
2. Run `egm-review` on that file. When it asks for extra context, give the glossary and the ADRs for the area.
3. The last stage (implementation readiness) runs only on a section headed `## Implementation Plan`. Without one you get the four design stages.
4. Run `egm-resolve`. You decide each finding: a review is feedback, not proof.
5. Move the approved spec to its committed home and update the tracker issue.

EGM's skills never fire on their own (`disable-model-invocation: true`), so they do not compete with model-invoked skills.

## Switching providers

Keep the state in files (the spec, the review reports, the glossary, the ADRs). A thread on another provider then starts by reading them and does not depend on a transferred transcript.

For a more independent read, run the review from a thread on a different provider than the one that wrote the plan: `egm-review` spawns its reviewers on the harness it runs in.

Codex and Antigravity reviewers also receive the project instruction file (`AGENTS.md`), so keep opinions about the design under review out of it. Claude Code reviewers do not.

## Tested

Install, status, update and uninstall were run end to end on Claude Code and Codex in throwaway configs, and install on Antigravity. Antigravity's update and uninstall paths have only been dry-run.
