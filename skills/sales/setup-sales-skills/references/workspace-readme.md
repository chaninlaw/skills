---
type: Playbook
title: Sales workspace
description: Shared conventions every sales skill reads before it writes in docs/sales/.
---

# Sales workspace

Shared conventions for the sales skills (`ask-sales`, `sales-*`). Every sales skill reads this file before it writes anything here. Edit it freely: it is yours, not the skills'.

## Layout

```
docs/sales/
  index.md                  OKF bundle entry: okf_version and a listing of what is here
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

Slugs are lowercase kebab-case. Never name a file `index.md` or `log.md` anywhere but where this layout puts them: both names are reserved (see Knowledge format). Internal files are written in the working language from `seller.md`; client-facing ones in its document language. One client can hold many deals (`acme-phase1`, `acme-ma-2027`). A file marked **internal** never leaves this folder and is never pasted into a client-facing document.

## Knowledge format (OKF)

`docs/sales/` is an [Open Knowledge Format](https://github.com/GoogleCloudPlatform/knowledge-catalog/blob/cd6fb05c0697be794513883b11682dd10d4ef924/okf/SPEC.md) v0.2 bundle (Google Cloud, Apache-2.0): plain Markdown with YAML frontmatter that any agent or tool can read without these skills. The subset used here:

- **Every `.md` a skill writes starts with frontmatter carrying `type`** (required), plus `title` and a one-sentence `description`. Quote any free-text value that contains `: ` or starts with a YAML-special character (`title: "Acme - POS: phase 1"`), or the frontmatter stops parsing. Other keys in this README (`stage`, `doc_no`, ...) sit beside them.
- **Reserved names**: `index.md` is a listing, not a document; only the root one exists here, with `okf_version: "0.2"` as its only frontmatter, and a line per file or folder (`* [Title](path) - description`). A skill that adds a client, deal, or top-level file adds its line. `log.md` is not used: a deal's history stays in `deal.md`'s `## Log`.
- **Links** between files are Markdown links, bundle-relative from `docs/sales/` (`[profile](/clients/acme/profile.md)`), so the folder reads as a graph: `deal.md` links its client profile, a stage file links the stage files and notes it builds on.
- **Who wrote it**: `generated: { by: <actor>, at: <ISO 8601 datetime with offset> }`, refreshed on every meaningful change. Actors: `<agent>/<model>` for an agent (e.g. `claude-code/claude-opus-5-5`), `human:<seller slug>` for the user.
- **Who checked it**: when the user approves a file (a recap, a scope outline, a version going to the client), add `verified: { by: human:<seller slug>, at: <datetime> }`. No `verified` means not reviewed by a person.
- **Lifecycle**: `status: draft` while the file holds `[default, confirm]` values or is unreviewed; `stable` once verified; `deprecated` for a superseded file kept for history.
- **Where facts came from**: `sources`, a list of `{ id, resource, title }` (`resource` is a URL or a bundle path such as `/deals/acme-pos/notes/2026-10-01-call.md`; optional `author` and `last_modified` when known). A claim cites its source with a footnote keyed to the id: `...three branches.[^dbd]` and `[^dbd]: Department of Business Development record`. Record signals, not verdicts: a confidence grade belongs beside the fact in the body, not on the source.
- **Freshness**: `stale_after: <datetime>` where a file goes out of date (a client profile after about six months). Past it, refresh before relying on it.
- **Tags**: internal files carry `tags: [internal]`, so a check for leaks is one search.
- **Exception**: `inputs/` holds client originals unchanged, so a Markdown file the client sent has no frontmatter. Everything a skill writes conforms.

| File | `type` |
|---|---|
| `README.md` | Playbook |
| `seller.md` | Seller Profile |
| `storage.md` | Storage Target |
| `brand/brand.md` | Brand |
| `clients/<client>/profile.md` | Client Profile |
| `deals/<deal>/deal.md` | Deal |
| `notes/<yyyy-mm-dd>-<topic>.md` | Meeting Notes |
| `01-discovery.md` | Discovery Record |
| `02-qualify.md` | Qualification |
| `03-solution.md` | Solution |
| `04-pricing.md` | Pricing |
| `05-proposal.md` | Proposal |
| `05-quotation.md` | Quotation |
| `06-negotiation.md` | Negotiation Plan |
| `07-contract.md` | Contract |
| `08-handoff.md` | Handoff |
| any other document `sales-document` renders | Sales Document |

## deal.md

```markdown
---
type: Deal
title: <client name> - <project>
description: <project in one line>
client: <client slug>
project: <one line>
stage: research | discovery | qualify | solution | proposal | negotiate | contract | won | lost | no-bid
value_estimate: <number or range>
currency: <from seller.md>
decision_date: <yyyy-mm-dd or unknown>
next_action: <one concrete action>
next_action_date: <yyyy-mm-dd>
generated: { by: <actor>, at: <ISO 8601 datetime> }
---

Client: [<client name>](/clients/<client>/profile.md)

## Log
- yyyy-mm-dd: <what happened, who, where the evidence is>
```

`stage` is the stage whose work is in progress: a skill sets it to its own stage when it starts that stage's file, and updates `next_action`, `generated`, and the log as it goes. Whether the previous stage's exit criteria actually passed is graded from evidence (`ask-sales`), not from this field. `lost` and `no-bid` carry a one-line reason in the log.

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

Every file that `sales-document` renders starts with the OKF keys above (`type`, `description`, `generated`, `status`, `verified`, `sources`) plus:

```yaml
---
type: <Proposal | Quotation | Contract | Sales Document>
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

`date` is the display date the client reads, in the document language's format; machine timestamps live in `generated`. The client-facing body cites with plain prose ("as you mentioned on 1 October"); footnotes are for internal files, and `sales-document` strips any that slip through.

## When no one is there to answer

When a skill would ask the user and no user is present (a scheduled or delegated run), take the recommended default, mark the value `[default, confirm]`, and list every such value in the final report. Facts are never defaulted: an unknown fact stays `[not captured]` or `Unknown`.

## Writing rules for every sales document

- Facts about the client come from `clients/<client>/profile.md`, `inputs/` or `notes/`, quoted with their source. A claim with no source is written as an assumption or a question, never as fact.
- Proof points come only from `seller.md`. Invent no numbers, case studies, or client names.
- Client-facing documents use the language, currency, and tax settings in `seller.md`.
- Re-pricing or re-scoping creates a new version (`v2`); a sent version is never edited.
- Delivering a file anywhere outside this workspace follows `storage.md`, and only after the user confirms that version is going to the client.
