---
name: ask-sales
description: Ask which sales skill fits your situation, or where a deal stands and what to do next. A router over the sales skills.
disable-model-invocation: true
---

# Ask sales

You don't remember every sales skill, so ask. Two ways in:

- **A situation** ("a TOR just arrived", "they asked for a price on the first call"): name the skill or sequence that fits and where the human decisions sit.
- **A deal** (a name, or "where are we with X"): read `docs/sales/deals/<deal>/`, grade the current stage's exit criteria from `docs/sales/README.md` green / yellow / red, and report what exists, what is missing, and the one next action.

Recommend and stop. Name the next thing to type; leave the typing and the doing to the user. Before stating what a skill does or that a step can be skipped, read that skill's SKILL.md: the summaries here are for orientation only.

No `docs/sales/README.md` yet? The answer is **`/setup-sales-skills`**, whatever the question.

## The main flow: lead to signed

1. **`sales-research`** opens the client and the deal folder: public research with sources, a place for the client's own documents.
2. **`sales-discovery`** prepares the questions, then turns call notes into a discovery record and a recap the client confirms.
3. **`sales-qualify`** decides whether to pursue: bid / no-bid, red flags graded by evidence, who decides and who pays. A no-bid ends the flow here, with its reason logged.
4. **`sales-solution`** turns the confirmed problem into scope, phases, estimate and assumptions. A paid discovery or POC is a branch here when scope is too foggy to price.
5. **`sales-pricing`** builds cost floor, options and the business case (internal), then **`sales-proposal`** writes the proposal and quotation, and **`sales-document`** renders them on-brand into `sent/`.
6. **`sales-negotiate`** plans gives and gets before the client pushes back.
7. **`sales-contract`** drafts the contract and closes with the handoff note that carries every promise into delivery.

Stages advance on **evidence**: a buyer act recorded in the folder. A seller activity ("proposal sent") never moves a deal; say so when the user asks to skip ahead.

## On-ramps

- **A TOR / RFP arrives** → `sales-research` (if the client is new), then straight to `sales-qualify` on the requirements before any writing. Discovery happens as clarification questions to the buyer.
- **Existing client, new phase or MA renewal** → open a new deal with `sales-research` (it reuses the client profile), then a short `sales-discovery` on what changed.
- **Price asked before discovery** → `sales-pricing` for an honest range only, then back to `sales-discovery`.
- **Deal gone quiet** → `sales-qualify` on the notes: red flags first, then one client-visible test as the next action.

## Standalone

- **`sales-document`** renders any Markdown in the workspace on-brand (a one-pager, a recap, a revised quotation).
- **`/setup-sales-skills`** again, when the seller profile, CI, rate card or storage target changes.

## Deal report shape

For the deal way in, answer in this order, citing file paths:

1. Stage (from `deal.md`) and whether the evidence agrees with it.
2. Exit criteria for that stage, each green / yellow / red with the file or quote behind it.
3. Missing files for this and earlier stages, and files that cannot be relied on yet: `status: draft`, past `stale_after`, or client-facing with no `verified`.
4. One next action, the skill that does it, and its date. When `deal.md` says something the folder does not support, flag the mismatch rather than trusting the field.
