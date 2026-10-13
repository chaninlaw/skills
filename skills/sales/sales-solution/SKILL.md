---
name: sales-solution
description: "Turn a qualified software deal's confirmed problem into a scoped solution: assess it from the client's asks and the seller's expert view, merge both into a roadmap toward shared goals, then deliverables, phases, effort estimate ranges, assumptions, out-of-scope, and an optional paid discovery or POC. Use after qualification, before pricing."
---

# Sales solution

Shape what will be built before anyone prices it. Read `docs/sales/README.md`, `deal.md`, `01-discovery.md`, `02-qualify.md`, `inputs/`, `notes/`. Output goes to `03-solution.md`.

## 1. Two lenses

Assess the deal twice before scoping anything; what the client asks for and what solves their problem are not always the same list.

- **Client lens** (what they asked): each client need with its source (a quote in `01-discovery.md`, or a requirement ID carried from the fit matrix in `02-qualify.md`), its priority (must / should / nice, in the client's terms), and how it is met: **Full**, **Partial**, **Planned** (later phase), or **Gap**. A Planned item is never written as Full. Ladder "why?" from each ask until it reaches an outcome the client owns; those outcomes feed the shared goals.
- **Seller lens** (what solves it): from the root cause, impact, and what they already tried in `01-discovery.md`, what the problem actually needs, including what the client did not ask for: prerequisites (data cleanup, access, a process change), risks (a fragile system to integrate, no one to run it after launch), sequencing (what must exist before what), and asks that would not move their number. Each item cites the discovery quote it answers, or is marked as the seller's recommendation.

Diagnose with the client, not for them: each seller finding is tested with the client (a question for the next call, or a point in step 7) before it shapes scope. Then check every seller item: is this what the problem needs, or the seller's usual stack, habit, or an upsell? It stays only if it traces to a shared goal and an impact the client stated. Tag what stays **must-have** (the goal fails without it: proposed as a prerequisite, with the reason), **improves**, or **delighter** (the client chooses).

## 2. Shared goals and roadmap

Write 2-4 **shared goals**: outcomes both sides want, anchored on the client's success in their own words and the impact figure from `01-discovery.md` (for example "quote turnaround from 2 days to same day"), each with how it will be measured and the obstacles that could stop it (each obstacle becomes a roadmap item, an assumption, or a risk). A goal the client would not recognise as theirs is cut.

Merge both lenses into one **roadmap** toward those goals: each item names the goal it serves and the lens it came from (client, seller, or both), in the order that reaches the first goal soonest. Where the lenses disagree, write it plainly: the client asked for X, the seller recommends Y because Z, where Z is evidence or a standard the client can check, not the seller's preference; the client decides, with the date, in step 7. An item that serves no shared goal and has no source goes to Optional.

## 3. Scope

- **Deliverables**: numbered, concrete enough that both sides can agree whether each was delivered ("admin screen to edit price tiers for up to 5 tiers", not "admin panel"). Quantify everything: counts, environments, platforms, data volumes, training sessions.
- **Out of scope**: an explicit list, including what the client may assume is included (data migration, content entry, hosting costs, integrations not named, support after warranty).
- **Optional**: priced separately later.
- **Client responsibilities**: what they provide and by when (decision maker, data samples, access, UAT testers, content). Each one is a dependency of the timeline.
- **Assumptions**: numbered; each one wrong means a change request.

## 4. Technical approach

The source for the proposal's technical part and for the technical review. Decisions, not buzzwords:

- **Architecture**: components and data flow; a diagram file in the deal folder when more than three components.
- **Technology and hosting**: stack and where it runs, and why it fits their constraints (existing systems, who maintains it, budget).
- **Integration**: each system touched, direction (read / write), method, and what its owner must provide. Read-only integration is the default where it meets the need: it keeps the client's current system safe.
- **Security and data**: access control, backups, data location, personal data handled and under which law.
- **Operations**: environments, deployment, monitoring, failure handling, and what MA will cover.

Every unknown here is an assumption in step 3 or a question for the client.

## 5. Phases and estimate

Cut the roadmap into phases that each deliver something usable toward a shared goal and can be bought on their own, so the client can start small. For each phase: deliverables, an effort **range** (best / likely / worst in days), the drivers of the spread, and the exit check that proves it done, including a reading of the goal metric. Each phase end is a re-plan point: re-check the shared goals with the client and reorder the rest of the roadmap, so the plan is not fixed by the first merge. Keep a 10-20% buffer and say where it sits. Maintenance (MA) after go-live is its own line, never folded into a phase.

## 6. Too foggy to estimate?

When the spread is wider than about 2x, or key data is unseen, propose a **paid discovery or POC** instead of guessing: 3-5 agreed success criteria (specific, measurable, written, time-boxed), a fixed price, at most a few weeks, an explicit go / no-go at the end. Worth running only with a named owner, a decision date that depends on it, and budget in motion. Red flags: "free trial" with no commitment, no decider involved, a competitor already chosen.

## 7. Confirm with the client

Turn `03-solution.md` into a short scope outline the client can review (shared goals, roadmap with each open disagreement as a choice for them, deliverables, phases, out of scope, their responsibilities; no estimate yet if pricing is not ready). Their written approval or comments go into `inputs/`.

Update `deal.md` (`stage: solution`, next action, log line). Exit criteria: the client approved the shared goals and scope outline in writing, every lens disagreement is decided, and open questions are closed or written as assumptions. Then `sales-pricing`.
