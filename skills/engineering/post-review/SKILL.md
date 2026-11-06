---
name: post-review
description: Turn code-review findings into consistent, well-formatted GitHub PR review comments and post them as one review (inline comments + short summary) after the user approves a preview. Use right after a code review (such as /code-review), or whenever the user wants to "comment on the PR", "post the review", "ส่ง comment ขึ้น PR", "เอา report ไปคอมเมนต์", or turn review notes/findings into PR comments, even if they don't name this skill. Not for replying to comments on your own PR (that's responding, not reviewing).
---

# Post Review

Takes review findings (usually a `/code-review` report split into standards and spec findings, but any list of findings works) and posts them to a GitHub PR as **one** review with inline comments. The goal is consistency: every comment looks the same, so PR authors can scan severity at a glance and reviews don't read differently depending on who (or which session) wrote them.

## 1. Pin the PR and the findings

- PR: use the number/URL the user gave; otherwise `gh pr view --json number,url,headRefOid,baseRefName` on the current branch. If there's no PR, stop and say so.
- Findings: use the report already in the conversation. If there isn't one, ask whether to run `/code-review` first.
- Get `commit_id` from `headRefOid` (the PR head), not local `HEAD`, since the local checkout may be stale.

## 2. Verify each finding before writing it

AI reviews produce false positives; a wrong comment on someone else's PR costs trust. For each finding:

- Open the actual lines (`sed -n '<a>,<b>p' <file>` on the PR head) and confirm the issue is real.
- Confirm the line is inside the PR diff (`gh pr diff <PR>`). GitHub rejects inline comments on lines outside the diff, so move those findings into the review body instead.
- Drop findings you can't confirm, and tell the user which you dropped and why.

## 3. Classify severity

Map each finding to exactly one label. The label tells the author what they must do, which is the most useful single piece of information in a review comment.

| Label | Use for | Typical `/code-review` source |
|---|---|---|
| **Blocking** | Bugs, security holes, data loss, spec requirement missing or wrong | Spec requirement missing or implemented wrong; hard violations of a documented standard that cause real risk |
| **Should fix** | Clear violation of a documented repo standard, missing error handling, logic smell with concrete risk | Documented-standard violations |
| **Suggestion** | Judgement calls: code smells, naming, structure | Baseline smells (always judgement calls) |
| **Question** | You need context to judge; scope creep you want explained | Spec requirement unclear or only partly covered; scope creep |

Skip nits a linter or formatter would catch. Don't post comments that only praise code.

## 4. Write each comment in the house format

```
<label> <one-line what's wrong>

<why it matters, 1–2 sentences. Cite the source: `CONTRIBUTING.md` rule, spec line (quoted), or smell name.>

<concrete proposal, or a ```suggestion block for a 1–5 line fix>
```

Tone rules, with reasons:
- **Suggestion** and **Question** are phrased as questions ("Would extracting … make this easier to test?"). They're judgement calls, and questions invite the author's context instead of demanding compliance.
- **Blocking** and **Should fix** state the issue directly and cite the rule or spec line, so the author can verify it without trusting the reviewer.
- Talk about the code, not the person ("this function …", not "you …").
- Language: match the PR's existing discussion/description language; if unclear, use English. Keep labels in the format above regardless of language so they stay scannable.

**Suggestion blocks** replace exactly lines `start_line`..`line`. Before using one, re-read those lines, apply the change mentally, and check you're not duplicating a neighbouring line or deleting one you didn't mean to. If you can't confirm, write prose instead.

### Example

Finding from `/code-review`: *"possible Duplicated Code: `formatAmount` in `src/invoice.ts:40-48` repeats `src/receipt.ts:12-20`"*

```
**Suggestion** `formatAmount` duplicates the logic in `src/receipt.ts:12-20`

Two copies of the same formatting rule tend to drift (Duplicated Code smell).

Would it make sense to extract a shared `formatAmount` into `src/money.ts` and call it from both?
```

## 5. Assemble the review

Pick the event from the highest severity present:
- any **Blocking** → `REQUEST_CHANGES`
- **Should fix** / **Suggestion** / **Question** only → `COMMENT`
- nothing left after verification → `APPROVE` with a one-line body, no inline comments (ask the user first; approving is a stronger statement than commenting)

Review body: short. Counts by label, then the one or two most important points. Details belong in the inline comments.

```
Review: 1 Blocking · 2 Should fix · 3 Suggestion

Main concern: <the blocking issue in one line>.
<Note if the spec axis was skipped: "No spec found, reviewed against standards only.">
```

Write the payload to a file (avoids shell-quoting bugs with backticks and quotes in comment bodies):

```json
{
  "commit_id": "<headRefOid>",
  "event": "COMMENT",
  "body": "<review body>",
  "comments": [
    { "path": "src/invoice.ts", "line": 48, "start_line": 40, "side": "RIGHT", "body": "<comment>" }
  ]
}
```

`side`: `RIGHT` for added/unchanged lines in the new version, `LEFT` for deleted lines. Omit `start_line` for single-line comments.

## 6. Preview, then post

Posting to someone else's PR is visible and notifies them, so always show the full preview first: event, body, and each comment as `path:line` + text. Ask the user to approve, edit, or drop items. Only after explicit approval:

```bash
gh api -X POST repos/{owner}/{repo}/pulls/<PR>/reviews --input <tmp-dir>/review-<PR>.json
```

If GitHub returns 422 (usually a line outside the diff), move that comment into the body and retry. Report the review URL at the end.
