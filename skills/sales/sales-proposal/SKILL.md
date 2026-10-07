---
name: sales-proposal
description: "Write the client-facing proposal, quotation and SOW for a software project and its maintenance, from the deal's discovery, scope and pricing files, then plan the follow-up. Use when a proposal, quotation (ใบเสนอราคา), or statement of work is needed."
---

# Sales proposal

A proposal wins by proving you listened, showing a clear plan, and making the decision easy. Read `docs/sales/README.md`, `seller.md`, `deal.md`, `01-discovery.md`, `03-solution.md`, `04-pricing.md`, `clients/<client>/profile.md`. Missing discovery or scope? Say which stage is skipped and what it costs before writing.

Client-facing text is in the document language from `seller.md`. Nothing from the internal files (`02`, `04` floors and walk-away, `06`) appears in it.

## 1. Proposal

Write `05-proposal.md` in **three parts, one per reader**, following [proposal-outline.md](references/proposal-outline.md) and starting with the client-facing frontmatter from `docs/sales/README.md`: Part 1 Business (owner or executive), Part 2 Technical (IT lead or advisor), Part 3 Scope and commercials (procurement and finance). Each part must stand alone for its reader. Size it to the deal: a few pages for a small job, rarely more than ten.

- **Understanding** carries Part 1: the client's problem in their words, quoting `01-discovery.md` ("as you mentioned..."), current state vs the outcome they want, their numbers. A sentence that fits any company is cut.
- **Part 2** comes from the technical approach in `03-solution.md`; a component, integration or security claim it does not contain is a question for the user, not a sentence in the proposal.
- **Investment** follows scope and timeline in Part 3, stated confidently, as the options from `04-pricing.md` with the recommended one marked, then MA and its SLA. No hedging, no invented statistics; a value claim cites its source in the business case.
- **One next step**, with a date.

## 2. Quotation and SOW

- `05-quotation.md` per [quotation-outline.md](references/quotation-outline.md), with the same frontmatter: numbered per `seller.md`, line items, tax lines, validity, payment terms. Line items invite line-item negotiation: group them by phase unless the client asked for detail.
- An SOW section (or file) when the deal is larger or the client asks for one: precise where the proposal persuades. Deliverables matrix, client responsibilities, assumptions, out of scope, acceptance (written sign-off, or deemed accepted after N business days), change requests (written request, impact on scope, time and cost within a few days, approved before work starts).

## 3. Review before sending

Three reviews, one lens each, before anything is rendered for the client. A solo seller runs each as a separate pass; record findings and fixes under `## Review` in `05-proposal.md` (removed before rendering).

- **Technical**: the architecture and integrations are buildable as described; deliverables and timeline match `03-solution.md`, with its buffer intact; every client responsibility the plan depends on is written in Part 3.
- **Commercial**: price at or above the floor in `04-pricing.md`; the payment schedule does not leave the seller funding the work (deposit and milestones keep cash ahead of effort); every number matches the quotation; tax arithmetic adds up; the validity date is set.
- **Legal and promises**: IP, confidentiality, warranty, acceptance, penalties and SLA match what `seller.md` and the contract checklist allow and what can actually be delivered; nothing promised that MA does not cover; every claim about the client traces to `profile.md`, `inputs/`, `notes/` or a discovery quote; every proof point traces to `seller.md`.

Then run the `sales-document` skill to render both as drafts for the user to review; once they approve, render again into `sent/`. For a presentation meeting, add the walkthrough deck from the outline, cut from the same three parts.

## 4. Follow-up plan

Add to `deal.md`: same day, confirm receipt and offer a 30-minute walkthrough with the decision maker; around day 2, something useful (a relevant example, a timeline clarification), never "just checking in"; around day 5, ask what is unclear and when they decide; then confirm the decision date. Quiet after two weeks: one "is this still a priority?" message, then close the loop politely.

Update `deal.md` (`stage: proposal`, next action, log). Exit criteria: proposal and quotation are in `sent/`, and the client confirmed receipt plus a walkthrough or a decision date. Then `sales-negotiate`.
