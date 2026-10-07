# Writing

Skills for turning agent sessions into blog posts and tech write-ups: harvest a session into a redacted pile of raw material, assemble it into a story beat by beat, then edit. Work happens in a `docs/writing/` workspace in the repo where the author keeps their writing. Not promoted yet: not shipped in the Claude Code plugin and not listed in the top-level `README.md` until used on real posts.

Flow: `/writing-harvest` -> `/writing-beats` -> `/writing-edit`.

## User-invoked

Reachable only when you type them (Claude Code: `disable-model-invocation: true`).

- **[writing-harvest](./writing-harvest/SKILL.md)**: Turn a Claude Code session or other transcript into a redacted `raw.md`: the story's facts, verbatim fragments and 2-3 candidate angles.
- **[writing-beats](./writing-beats/SKILL.md)**: Assemble the raw material into a post one beat at a time, each candidate beat named by the story pattern it follows.
- **[writing-edit](./writing-edit/SKILL.md)**: Final pass: concept order, Thai and English AI-slop removal in the author's voice, and a redaction re-check.

## Model-invoked

None yet.
