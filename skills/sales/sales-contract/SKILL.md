---
name: sales-contract
description: "Draft a software development and maintenance contract from the accepted deal (scope, acceptance, change requests, IP, warranty, payment milestones, MA terms, liability), check the client's paper for landmines, and write the delivery handoff on signing. Not legal advice. Use when a client accepts or sends their own contract."
---

# Sales contract

The contract fixes what the deal already agreed; it is not a place to renegotiate. Read `docs/sales/README.md`, `seller.md` (jurisdiction, tax, defaults), `deal.md`, `03-solution.md`, `05-*` as sent, `06-negotiation.md` (what was agreed), `inputs/`, `notes/`. Output goes to `07-contract.md`; set `deal.md` to `stage: contract` when you start it.

This is a drafting aid, not legal advice. Say so once in the reply, and recommend a lawyer read anything above the user's comfort size or with a landmine below.

## 1. Our paper or theirs

- **Our paper**: draft from [clause-checklist.md](references/clause-checklist.md), every value taken from the accepted scope, quotation and negotiation record. Jurisdiction-specific clauses follow `seller.md`; for Thailand, apply [thailand.md](references/thailand.md).
- **Their paper**: read it against the checklist and list, per clause, what it says, the risk, and counter-wording.

Landmines to flag either way: uncapped liability or indemnity; IP that takes our pre-existing code or reusable components; acceptance with no deadline or "to the client's satisfaction"; payment later than ~45 days or not tied to milestones; auto-renewal notice over 30 days on MA; long non-solicit or exclusivity with no payment; personal data processed with no data-processing terms; unlimited revisions; penalties for delays the client caused.

## 2. Consistency check

Every number, deliverable, phase, MA term, revision count and date in the contract matches the sent quotation and proposal, or the written agreement in `06-negotiation.md` that changed it. Concessions agreed verbally are not in the contract; ask the user to confirm them in writing first.

## 3. Signing

Exit criteria: both sides signed (file in `inputs/` or `sent/`), deposit invoiced. Update `deal.md` to `stage: won`.

## 4. Handoff

Write `08-handoff.md` the day it is signed, for delivery (often the same person in a different mode): what was bought and **what was excluded** (especially anything demoed or discussed but not bought); value, term, start and renewal dates, payment schedule; the client's goal and their own definition of success; decider and day-to-day contact; every commitment made during the sale (support hours, training, response times, future-phase promises) with where it was made; open risks. A promise found after signing that is not in this file is the classic failure: check `01` to `06` and the sent emails for one.

Kickoff with the client within a week or two, confirming the scope baseline and the first phase's plan.
