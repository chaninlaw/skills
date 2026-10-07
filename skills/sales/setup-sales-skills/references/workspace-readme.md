# Sales workspace

Shared conventions for the sales skills (`ask-sales`, `sales-*`). Every sales skill reads this file before it writes anything here. Edit it freely: it is yours, not the skills'.

## Layout

```
docs/sales/
  README.md                 this file
  seller.md                 who is selling: identity, legal/tax, defaults, rate card, proof points
  storage.md                where delivered documents go (local folder or cloud) and the tool that reaches it
  brand/
    brand.md                colors, fonts, logo paths (the CI)
    document-template.html  branded print template, filled by sales-document
    <logo files>
  clients/<client>/
    profile.md              company research, every fact sourced or marked inferred
    <client logo, optional>
  deals/<client>-<project>/
    deal.md                 stage, status, key facts, next action, log
    inputs/                 originals from the client (TOR, RFP, their emails, signed documents); never edited
    notes/                  seller-written material (meeting notes, site surveys, call transcripts); dated
    01-discovery.md
    02-qualify.md           internal
    03-solution.md
    04-pricing.md           internal: cost, margin, floor, walk-away
    05-proposal.md
    05-quotation.md
    06-negotiation.md       internal
    07-contract.md
    08-handoff.md
    drafts/                 rendered previews, overwritten freely
    sent/                   exactly what the client receives: <source name>-v<N>-<yyyy-mm-dd>.<ext>
```

Slugs are lowercase kebab-case. Internal files are written in the working language from `seller.md`; client-facing ones in its document language. One client can hold many deals (`acme-phase1`, `acme-ma-2027`). A file marked **internal** never leaves this folder and is never pasted into a client-facing document.

## deal.md

```markdown
---
client: <client slug>
project: <one line>
stage: research | discovery | qualify | solution | proposal | negotiate | contract | won | lost | no-bid
value_estimate: <number or range>
currency: <from seller.md>
decision_date: <yyyy-mm-dd or unknown>
next_action: <one concrete action>
next_action_date: <yyyy-mm-dd>
updated: <yyyy-mm-dd>
---

## Log
- yyyy-mm-dd: <what happened, who, where the evidence is>
```

`stage` is the stage whose work is in progress: a skill sets it to its own stage when it starts that stage's file, and updates `next_action`, `updated`, and the log as it goes. Whether the previous stage's exit criteria actually passed is graded from evidence (`ask-sales`), not from this field. `lost` and `no-bid` carry a one-line reason in the log.

## Stages and exit criteria

A stage is the **buyer's** position, not the seller's activity. An exit criterion passes only when it is:

1. **Buyer-sourced**: something the client did, said, or agreed to, not something the seller did to them.
2. **Recorded**: the evidence is a file or a quoted line in this deal folder (an email in `inputs/`, a dated note in `notes/` naming who said it, a signed document in `inputs/`).

Grade each criterion **green** (evidence in the folder), **yellow** (the seller believes it, evidence pending), or **red** (absent or contradicted). Only all-green advances. "Proposal sent" or "good relationship" are seller activity and never pass.

| Stage | Skill | Exit criteria (all green to advance) |
|---|---|---|
| research | `sales-research` | `clients/<client>/profile.md` exists with sources; client agreed to a first conversation (logged) |
| discovery | `sales-discovery` | client stated the problem and what it costs them, in their words (quoted, dated, named speaker); recap sent and not corrected by the client |
| qualify | `sales-qualify` | client named who decides and who pays; client gave a budget range or accepted a ballpark; client named a date or event driving the decision; bid / no-bid recorded with reasons |
| solution | `sales-solution` | client wrote or approved the requirements or scope outline (email or comment logged); open questions closed or turned into written assumptions |
| proposal | `sales-pricing`, `sales-proposal`, `sales-document` | proposal and quotation are in `sent/`; client confirmed receipt and a walkthrough happened or a decision date was confirmed |
| negotiate | `sales-negotiate` | client accepted scope and price in writing (email, PO, or signed quotation in `inputs/`) |
| contract | `sales-contract` | contract signed by both sides; deposit invoiced; `08-handoff.md` lists every commitment and exclusion made during the sale |

## Client-facing document frontmatter

Every file that `sales-document` renders starts with:

```yaml
---
title: <document title, tied to the client's goal>
subtitle: <optional one line>
doc_no: <numbering pattern from seller.md>
date: <issue date, written in the document language's format>
valid_until: <date, or "-" when not applicable>
client_name: <client legal name>
footer_note: <optional, e.g. confidentiality line>
client_logo: <optional path relative to the rendered file>
---
```

## When no one is there to answer

When a skill would ask the user and no user is present (a scheduled or delegated run), take the recommended default, mark the value `[default, confirm]`, and list every such value in the final report. Facts are never defaulted: an unknown fact stays `[not captured]` or `Unknown`.

## Writing rules for every sales document

- Facts about the client come from `clients/<client>/profile.md`, `inputs/` or `notes/`, quoted with their source. A claim with no source is written as an assumption or a question, never as fact.
- Proof points come only from `seller.md`. Invent no numbers, case studies, or client names.
- Client-facing documents use the language, currency, and tax settings in `seller.md`.
- Re-pricing or re-scoping creates a new version (`v2`); a sent version is never edited.
- Delivering a file anywhere outside this workspace follows `storage.md`, and only after the user confirms that version is going to the client.
