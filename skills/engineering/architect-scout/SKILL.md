---
name: architect-scout
description: "Explore and research architecture patterns from tech blogs and industry case studies, sketch candidate code shapes, and resolve hard architecture decisions for Wayfinder tickets."
disable-model-invocation: true
---

Resolve hard architectural decisions where the team lacks domain familiarity. Instead of grilling the user for decisions they cannot yet make, freeze the question, explore proven patterns from high-trust engineering blogs, sketch multiple code shapes, and synthesize a structured decision package back into Wayfinder.

## Overview

When working through a Wayfinder decision map, architectural choices often stall because neither the human nor the agent has immediate domain-specific experience in that area. 

This skill provides an empirical, research-backed bridge:
1. Freeze the dilemma without forcing premature answers.
2. Scout real-world technical blogs and engineering retrospectives.
3. Apply the pstack architect discipline: "Design it twice" with types and signatures.
4. Screen against design red flags and interface depth.
5. Deliver a structured trade-off package for the user to decide with confidence.

## Phase 1: Freeze and Ground

1. Inspect the Wayfinder ticket or current architectural blocker.
2. Extract the core technical tension (for example: Event Sourcing vs CRUD with Change Data Capture, Centralized State vs CRDTs, Long-polling vs WebSockets vs SSE).
3. Record the hard project constraints:
   - Language and runtime environment (e.g., TypeScript/Node, Go, Python).
   - Current scale and team size.
   - Latency, consistency, and uptime requirements.
   - Operational budget (managed services vs self-hosted).
4. Do not interrogate the user about technical details they already stated they are unsure of. Ground the inquiry on what is known about the application's domain.

## Phase 2: Explore and Research

Scout established engineering solutions from industry precedents:

1. Consult `references/tech-sources.md` to identify relevant engineering blogs (e.g., Figma for canvas/sync, Linear for offline-first, Stripe for payments/idempotency, Netflix/Cloudflare for distributed state).
2. Formulate targeted search queries focusing on production lessons and failure modes, not just promotional tutorials:
   - Search for `"<pattern A> vs <pattern B> in production"`
   - Search for `"why we moved away from <technology/pattern>"`
   - Search for `"<pattern> failure modes OR postmortem"`
3. Collect 2 to 3 distinct approaches proven in production, noting what each approach sacrificed to achieve its primary benefit.

## Phase 3: Sketch Candidates (Design It Twice)

Never evaluate architectures purely as abstract prose. Ground each viable candidate in code using the pstack architect methodology:

1. Produce at least two structurally distinct candidate designs.
2. For each candidate:
   - **Write caller usage first**: Show how a client or consumer invokes the feature under this architecture.
   - **Define module boundaries and types**: Sketch interfaces, signatures, and data contracts.
   - Use `// not implemented` or pseudocode for method bodies. Focus exclusively on the public interface and boundaries.

## Phase 4: Screen and Filter

Screen every candidate sketch against `references/design-red-flags.md`:

1. **Evaluate interface depth**: Does this design hide substantial complexity behind a simple, high-leverage interface, or is it a shallow wrapper?
2. **Check for information leakage**: Are database schemas or transport mechanisms leaking through public contracts?
3. **Check for split ownership**: Does state have a single clear owner, or are multiple subsystems attempting dual writes?
4. **Prune accidental complexity**: Discard solutions designed for hyper-scale enterprises if they introduce unneeded operational overhead for the current team.

## Phase 5: Handback to Wayfinder

Format the findings using `references/decision-template.md`:

1. **Summary of Dilemma**: The core question and why it matters.
2. **Industry Evidence**: What established engineering teams discovered when deploying these patterns.
3. **Side-by-side Sketches**: The caller usage and type definitions for Candidate A and Candidate B.
4. **Trade-off Matrix**: Explicit comparison of implementation cost, operational maintenance, failure modes, and scalability limits.
5. **Pragmatic Recommendation**: Provide a justified recommendation based on the project's current maturity, while leaving the final judgment to the human driver.

Post the completed decision package into the Wayfinder ticket resolution comment, update the map index, and unblock the frontier.
