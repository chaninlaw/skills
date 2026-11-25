# EGM in this repo

Seed for `docs/agents/egm.md`. Replace `<artifact-dir>` and `<specs-dir>`, and drop any section whose skills are not installed.

EGM (Elephant-Goldfish Model) is installed as a plugin and used here for one thing the other skills lack: a **Goldfish review**, where fresh reviewers read a written plan without the conversation that produced it. Thinking, speccing and building stay with the skills already in use.

## Where files go

- Briefs, drafts and review reports: `<artifact-dir>` (scratch; set by the `EGM artifact directory:` line in the instruction file).
- Approved specs: `<specs-dir>`, committed.

Antigravity may write to its own artifact directory instead of honoring that line. Name the folder in the prompt there.

## Which skill for which step

| Step | Use | Not |
| --- | --- | --- |
| Sharpen the problem | `grilling`, `grill-with-docs` | `egm-brainstorm` |
| Write the spec | `to-spec` | `egm-draft` |
| Review the written plan | `egm-review`, then `egm-resolve` | |
| Build | `tdd`, `implement-spec` | `egm-lite` |
| Check docs against code | `egm-drift-report` | |

The EGM skills in the right-hand column still work; they are left out so one conversation follows one method.

## From spec to review

1. `to-spec` publishes the spec to the issue tracker. `egm-review` needs a local file, so save the same text to `<artifact-dir>/<topic>.md` first.
2. Run `egm-review` on that file. When it asks for extra context, give the glossary and the ADRs for the area. These are the facts a reviewer may assume; everything else must be in the spec.
3. The last review stage (implementation readiness) runs only on a section headed `## Implementation Plan`. A spec without one gets the four design stages.
4. Run `egm-resolve` on the findings. The human decides each one: a review is feedback, not proof.
5. Move the approved spec to `<specs-dir>` and update the tracker issue to match.

Command forms differ per harness (`/egm:egm-review` in Claude Code and Antigravity, the skill picker in Codex). EGM's own `docs/harnesses.md` is the reference.

## Switching providers

The Elephant is whichever thread holds the background. Everything a later thread needs is in the files above plus the glossary and ADRs, so a new thread on another provider starts by reading them rather than relying on a transferred transcript.

A Goldfish on a provider other than the Elephant's gives a more independent read. `egm-review` spawns reviewers on the harness it runs in, so to get that, run the review from a thread on the other provider.

Codex and Antigravity reviewers also receive the project instruction file. Keep opinions about the design under review out of it.
