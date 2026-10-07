---
name: sales-solution
description: "Turn a qualified software deal's confirmed problem into a scoped solution: deliverables, phases, effort estimate ranges, assumptions, out-of-scope, and an optional paid discovery or POC. Use after qualification, before pricing."
---

# Sales solution

Shape what will be built before anyone prices it. Read `docs/sales/README.md`, `deal.md`, `01-discovery.md`, `02-qualify.md`, `inputs/`, `notes/`. Output goes to `03-solution.md`.

## 1. Requirements map

List each client need with its source (a quote in `01-discovery.md` or a requirement ID in `inputs/`), its priority (must / should / nice, in the client's terms), and how it is met: **Full**, **Partial**, **Planned** (later phase), or **Gap**. A Planned item is never written as Full. A need with no source is the seller's idea: move it to Optional.

## 2. Scope

- **Deliverables**: numbered, concrete enough that both sides can agree whether each was delivered ("admin screen to edit price tiers for up to 5 tiers", not "admin panel"). Quantify everything: counts, environments, platforms, data volumes, training sessions.
- **Out of scope**: an explicit list, including what the client may assume is included (data migration, content entry, hosting costs, integrations not named, support after warranty).
- **Optional**: priced separately later.
- **Client responsibilities**: what they provide and by when (decision maker, data samples, access, UAT testers, content). Each one is a dependency of the timeline.
- **Assumptions**: numbered; each one wrong means a change request.

## 3. Technical approach

The source for the proposal's technical part and for the technical review. Decisions, not buzzwords:

- **Architecture**: components and data flow; a diagram file in the deal folder when more than three components.
- **Technology and hosting**: stack and where it runs, and why it fits their constraints (existing systems, who maintains it, budget).
- **Integration**: each system touched, direction (read / write), method, and what its owner must provide. Read-only integration is the default where it meets the need: it keeps the client's current system safe.
- **Security and data**: access control, backups, data location, personal data handled and under which law.
- **Operations**: environments, deployment, monitoring, failure handling, and what MA will cover.

Every unknown here is an assumption in step 2 or a question for the client.

## 4. Phases and estimate

Cut the work into phases that each deliver something usable and can be bought on their own, so the client can start small. For each phase: deliverables, an effort **range** (best / likely / worst in days), the drivers of the spread, and the exit check that proves it done. Keep a 10-20% buffer and say where it sits. Maintenance (MA) after go-live is its own line, never folded into a phase.

## 5. Too foggy to estimate?

When the spread is wider than about 2x, or key data is unseen, propose a **paid discovery or POC** instead of guessing: 3-5 agreed success criteria (specific, measurable, written, time-boxed), a fixed price, at most a few weeks, an explicit go / no-go at the end. Worth running only with a named owner, a decision date that depends on it, and budget in motion. Red flags: "free trial" with no commitment, no decider involved, a competitor already chosen.

## 6. Confirm with the client

Turn `03-solution.md` into a short scope outline the client can review (deliverables, phases, out of scope, their responsibilities; no estimate yet if pricing is not ready). Their written approval or comments go into `inputs/`.

Update `deal.md` (`stage: solution`, next action, log line). Exit criteria: the client approved the scope outline in writing, and open questions are closed or written as assumptions. Then `sales-pricing`.
