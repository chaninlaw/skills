---
name: sales-negotiate
description: "Plan a software deal negotiation before the call: gives and gets ranked by cost to us vs value to them, walk-away, package trades, and diagnosed objection responses (too expensive, cheaper vendor, in-house, need to think). Use when a client pushes back on price, scope or terms."
---

# Sales negotiate

Plan in writing before the conversation; concede nothing live that is not on the plan. Read `docs/sales/README.md`, `seller.md` (floors, discount envelope), `04-pricing.md` (walk-away), `05-*`, `02-qualify.md`, and the client's pushback in `inputs/`, `notes/`, or the user's message. Output goes to `06-negotiation.md` (internal).

## 1. Diagnose first

Quote the objection verbatim, then classify it: **reflex** (a first-contact brush-off), **smokescreen** (hides another reason), **real** (value, budget, capability, timing, risk), **indecision** (the client fears choosing wrong), or **disqualifying** (a valid end: write the exit line, the condition to re-open, a follow-up date). Draft one diagnostic question to ask before answering anything ("is it that it doesn't fit the budget, or that you're not sure it's worth it?").

## 2. Responses

Per objection: what it likely means, the diagnostic question, a 2-5 sentence spoken response with one proof point from `seller.md`, a question that hands the turn back, and what to do if it comes again.

- **Too expensive, value gap**: re-anchor on their own stated cost and goal from `01-discovery.md` and the business case.
- **Too expensive, budget**: change the shape, not the price, in this order: smaller first phase, reduced scope, later start, help the owner sell it internally, then walk.
- **Cheaper vendor**: ask for the quote in writing; compare scope line by line; price the difference; never match the number.
- **We can do it in-house**: ask how in-house handles the specific problem today; compare full cost (hire, ramp-up, ongoing maintenance); never run down the alternative.
- **Need to think**: indecision. One confident recommendation, stop adding information, lower the risk with a paid first phase.
- **Scope uncertain**: a fixed-price discovery phase with a go / no-go, later phases as ranges.

Answer capability objections honestly; no invented urgency or proof.

## 3. Gives and gets

List gives, each with **cost to us** in magnitudes (near zero / an hour / a week / an ongoing obligation), value to them, the precedent it sets, and whether it can be reversed. Order by value-to-cost ratio, not by cheapness. Usually cheap and valued: start date, payment timing, a named support contact, extra handover or training hours, a time-boxed support window. Last resort: headline discount, MA price lock, broad liability, termination for convenience.

Every give is paired with a get, phrased get-first: "if you can sign by <date>, we can start in <week>". Gets worth asking for: a committed signing date, a larger deposit, a longer MA term, a larger first phase, a reference or case study (capped), a referral.

Price comes down only when scope comes out. A discount, when it happens, is traded, in shrinking steps, and written into the contract; a verbal concession does not exist.

## 4. Packages and walk-away

Offer 2-3 packages of equal value to us but different shape (lower price with a 1-year MA vs the same margin with a 3-year MA; deposit-heavy vs milestone-heavy); which one they pick shows what they value. The walk-away comes from the seller's next-best use of the time; when the client's limit and ours do not overlap, walk.

## 5. Record

`06-negotiation.md`: objections, responses, give/get ledger, packages, walk-away, and after the call what was agreed. Update `deal.md` (`stage: negotiate`, next action, log line). Exit criterion: the client accepted scope and price in writing (email, PO or signed quotation in `inputs/`). Then `sales-contract`.
