---
name: writing-harvest
description: Turn a Claude Code session (or any agent transcript) into a redacted pile of raw material for a blog post, with the story's facts, verbatim fragments and 2-3 candidate angles. Use when the user wants to write a post, devlog or tech blog from a session they worked through.
disable-model-invocation: true
---

# Writing harvest

A session is a bad article and a good quarry. This skill digs the quarry: it reads the transcript, keeps what a reader would care about, strips what must not leave the machine, and writes `raw.md`. It does not write the article; `writing-beats` does that from `raw.md`.

## Workspace

Everything lives under `docs/writing/` in the repo where the user keeps their writing (ask once if unclear, then remember):

```
docs/writing/
  redact.md            # what must never appear in a post (gitignored)
  voice.md             # optional: audience, language, 2-3 sample paragraphs of the author's own writing
  posts/<slug>/
    transcript.md      # extractor output, unredacted (gitignored)
    raw.md             # this skill's output, redacted (gitignored)
    article.md         # written later by writing-beats
```

On first run, create what is missing. If the repo has a public remote (`git remote -v`), add `docs/writing/redact.md`, `docs/writing/posts/*/transcript.md` and `docs/writing/posts/*/raw.md` to `.gitignore` before writing them, and say so. Never overwrite a `redact.md` or `voice.md` the user has edited.

## 1. Pick the session

The user may pass a `.jsonl` path, a session id, a pasted transcript, or a vague description ("the one where the CSV quoting broke"). For a Claude Code session, transcripts live in `<config-dir>/projects/<project-path-with-dashes>/<session-id>.jsonl`. The config dir is `$CLAUDE_CONFIG_DIR` when set, else `~/.claude`; if neither has the project, glob `~/.claude*/projects/<project-path-with-dashes>/` and take the match. The project path is the absolute path of the project with every `/` (and `.`) replaced by `-`. List candidates with (the script sits in this skill's own folder):

```bash
python3 -I <this-skill-dir>/scripts/extract_session.py --list <project-dir> --limit 20
```

Confirm the pick with the user by title and first prompt. A pasted transcript or another agent's log skips step 2: save it as `transcript.md` as-is.

## 2. Extract

```bash
python3 -I <this-skill-dir>/scripts/extract_session.py <session.jsonl> > docs/writing/posts/<slug>/transcript.md
```

It follows `continued-in` to later sessions, drops harness noise and subagent sidechains, and cuts tool results to 600 chars (`--result-chars N` for more). `--thinking` adds assistant reasoning when it was stored, which is rare but valuable: it is where the wrong turns live.

Read `transcript.md` end to end before writing anything. For a very long one, read it in chunks and keep notes; do not skim.

## 3. Mine the story

A post needs a shape the reader can follow, and a session hides it under tool calls. Find, with evidence from the transcript for each:

- **Want**: what the person set out to do, in their words.
- **Obstacle**: the symptom that got in the way, as first observed (the error text, the wrong number, the confused user).
- **Wrong turns**: each hypothesis tried and why it was dropped. These are the most valuable material and the first thing a summary throws away. Keep them.
- **Turn**: the moment understanding changed. Quote the line that shows it.
- **Root cause and fix**: what was actually wrong, and the change that fixed it.
- **Proof**: how it was verified (the test, the before/after number).
- **Lesson**: what the person would do differently, or what generalises beyond this codebase.
- **Stakes**: why it mattered to someone (a customer, a deadline, money).

Mark anything not shown in the transcript as `[inferred]`. Never invent a number, a quote or an outcome.

## 4. Redact

Read `docs/writing/redact.md`. If it does not exist, scan the transcript and draft one: customer and company names, people other than the author, prices and contract terms, hostnames, IPs, internal URLs, file paths that reveal a client, credentials, emails, phone numbers, and anything a contract or law forbids publishing. Show the draft, let the user edit, then save it. Its format:

```markdown
## Replace
- Acme Pharmacy -> a pharmacy wholesaler
- 10.147.0.12 -> the store's server

## Remove
- any MA price or contract amount
- customer passwords, API keys, tokens

## Keep (looks sensitive, is fine)
- Bun, Hono, Drizzle
```

Apply it to everything that goes into `raw.md`. Then grep `raw.md` for the patterns a list misses: anything shaped like a key or token, an IP, an email, a phone number, a long hex or base64 string, a path under a home directory. List every replacement and removal in the hand-off message so the user can check it, and add any new term the user flags to `redact.md`.

## 5. Write raw.md

```markdown
# <working title>

Source: <session id(s)>, <date range>. Redacted per docs/writing/redact.md.

## Story
- Want: ...
- Obstacle: ...
- Wrong turns:
  1. <hypothesis> -> <why dropped> (evidence: "<quote>")
- Turn: ...
- Root cause / fix: ...
- Proof: ...
- Lesson: ...
- Stakes: ...

## Fragments
Verbatim lines worth keeping: the person's own phrasing, a sharp error message, a number, a one-line diff. One per bullet, unedited apart from redaction.

## Technical details
Commands, code snippets and config a technical reader would want, already redacted.

## Candidate angles
2-3 ways into the story, each one line: the hook, who it is for, and the narrative pattern it fits (see writing-beats' story patterns). Example: "The bug was in the data, not the code -- for devs inheriting legacy exports -- the wrong turn."
```

Leave more than the article needs; the article picks from it.

## 6. Hand off

Report: the path of `raw.md`, the redaction list, the candidate angles, and the next command: `/writing-beats docs/writing/posts/<slug>/raw.md`.
