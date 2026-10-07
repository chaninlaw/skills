---
name: sales-discovery
description: "Prepare a discovery call for a software project (question plan ordered pain, root cause, impact, urgency) and turn the call notes into a discovery record plus a recap message the client confirms. Use before or after a first or follow-up client meeting."
---

# Sales discovery

Two modes: **prepare** before a call, **record** after it. Read `docs/sales/README.md`, the deal's `deal.md`, `clients/<client>/profile.md`, `inputs/` and `notes/` first. If the README is missing, point at `/setup-sales-skills`.

## Prepare

Write a question plan into `01-discovery.md` under `## Plan`, a handful of questions per stage, each one able to change what the seller does next (otherwise it is theatre). Research answers the situation; the call is for what research cannot know.

| Stage | Done when |
|---|---|
| Frame | purpose, time, and possible outcomes agreed in one line |
| Situation (1-2 questions) | their current process, in their words |
| Pain | a named problem plus a recent, specific example |
| Root cause | cause separated from symptom; what they already tried (spreadsheet, packaged software, a previous developer) and why it fell short |
| Impact | one figure in their own number (hours, errors, lost sales) and who else it touches |
| Urgency | a dated, client-owned event (new branch, audit, season, contract end) or a recorded "none" |
| Decision | who else has a say or a veto; who runs the system after launch |
| Close | summary in their words, then a dated next step |

Question craft: open before closed; one idea per question; past events over hypotheticals ("when did it last break?"); ladder a vague answer 2-3 times (example, how often, cost); let the client say the number. Budget and timeline come after impact. No solution talk until the gap is established. If the owner is in the room, halve the list and lead with a point of view. Asked for a price mid-call: give an honest range from `seller.md`, then trade it for the next stage's answers.

## Record

From the user's notes (or a transcript in `notes/`), write `01-discovery.md` under `## Record`:

- Attendees with roles, date.
- Pain, root cause, impact, urgency, decision context: each as a **quote with its speaker**, or `Unknown` with the question that would answer it. Paraphrase is marked as paraphrase; a missing answer stays missing.
- Success in the client's words: what they would need to see to call the project worked.
- Open gaps for the next call.

Then draft the **recap** for the client in the seller's document language: subject about the next step; next steps first as owner, deliverable, date (client items visible); the pain restated in their words and numbers; ends with "anything I missed?". Under 200 words, plain text. Anything not explicitly agreed is marked "proposed, confirm before sending". Draft only; the user sends it.

Update `deal.md`: `stage: discovery`, next action, a log line.

## Hand off

Exit criteria: the client's problem and its cost are quoted with speaker and date, and the recap was sent and not corrected. Then `sales-qualify`.
