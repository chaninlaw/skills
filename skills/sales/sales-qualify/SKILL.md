---
name: sales-qualify
description: "Decide whether a software deal is worth pursuing: bid / no-bid on a TOR or RFP, requirement fit (STRONG / PARTIAL / GAP), and deal red flags graded by evidence (Verified / Assumed / Unknown). Use after discovery, when a TOR arrives, or when a deal goes quiet."
---

# Sales qualify

Decide with evidence, not hope. Read `docs/sales/README.md`, `deal.md`, `01-discovery.md`, `clients/<client>/profile.md`, `inputs/`, `notes/`, and the proof points in `seller.md`. Output goes to `02-qualify.md` (internal).

## 1. Qualification checklist

Grade each item on evidence, never on warmth: **0 Unknown**, **1 Assumed** (seller believes it), **2 Stated** (client said it; quote it), **3 Validated** (client did something: sent a number, made an intro, committed a date; name the file).

- **Pain, costed**: the client named what not solving it costs.
- **Success metric**: the number is the client's, not the seller's.
- **Owner / champion**: proven by an act (shared criteria, arranged the decider meeting, forwarded the summary). Two deferrals means a coach, not a champion. A title alone is weak evidence.
- **Who decides, who pays, who can veto**: "who approved the last purchase like this?" For an SME owner, check the co-decider (partner, family, accountant, investor).
- **Budget**: the budget owner's own range or funding path.
- **Compelling event**: dated and client-owned, or honestly none.
- **Decision process**: only when there are approval steps (board, procurement, a public-sector TOR).
- **Alternative**: including doing nothing, a spreadsheet, a packaged product, an in-house hire.

Champion at 1 or below, or decider at 0, caps the verdict at **under-qualified**, whatever else scores well.

## 2. TOR / RFP fit (when requirements exist)

Keep the buyer's IDs, wording and order. Tag each requirement **MANDATORY** (must, shall, required), **WEIGHTED** (should, scored), or **NICE** (may, preferred). Grade fit **STRONG** (a verifiable proof in `seller.md` covers it), **PARTIAL**, or **GAP**. A GAP gets no persuasive prose: list it for the human to close, partner around, or no-bid. Check disqualifiers first (registration, certifications, VAT, data residency, bid bond).

## 3. Bid / no-bid

Set the rule before reading the requirements, then apply it:

1. A MANDATORY GAP that cannot be closed before submission: **no-bid** or **partner-bid**. A good score never overrides it.
2. Two or more of: late entry with no prior contact; strong incumbent with no named reason to switch; no warm contact; under half the criteria aligned; four or more competitors: **no-bid**.
3. Most MANDATORY items STRONG, a warm contact, and either early entry or a named reason the incumbent loses: **bid**.
4. Otherwise: ask the buyer clarifying questions first. Being unable to ask is itself a signal.

## 4. Red flags

For each flag, look first for the evidence that clears it (no one-way ratchet). Severity (high / medium / low) is judged for this deal's size; evidence is graded separately: **Verified** (first-hand client quote), **Assumed** (seller inference or hearsay, quoted), **Unknown** (notes silent: one diagnostic question, never shown as red). Common flags: decider never met; budget unverified; no compelling event; timeline owned by the seller; "just send a proposal" before any process talk; no dated next step; happy ears (enthusiasm without the client committing time, data, people, or a date); doing nothing never discussed. Disqualify on one named unrecoverable flag, never on a count.

## 5. Record and hand off

Write the checklist, fit matrix, decision with reasons, and flags into `02-qualify.md`. The next action is one client-visible test the client either performs or refuses (an intro, a number, a date), never the seller's homework. Update `deal.md` (`stage: qualify`, or `no-bid` with the reason). Bid: point at `sales-solution`.
