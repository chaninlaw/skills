# Design Red Flags

Screen every candidate architecture sketch against these criteria before presenting options to the user. A red flag is a reason to revise, refine, or discard an architectural candidate.

## 1. Shallow Module
A shallow module exposes a large, complex interface while hiding very little operational complexity.
- Symptoms:
  - Callers must coordinate multiple methods in a strict order to achieve one logical goal.
  - Public configuration exposes internal stages or leaky implementation details.
  - The caller must understand the internals of the module to use it safely.
- Remedy: Aim for interface depth. Hide substantial internal orchestration behind a concise, expressive public surface.

## 2. Information Leakage and Leaky Abstractions
Multiple modules depend on the same internal implementation detail or data representation.
- Symptoms:
  - Re-exporting transport or database models directly to callers.
  - Changing an internal storage detail requires changing several other unrelated files.
- Remedy: Map external data and transport details into private domain models behind the module boundary.

## 3. Split Ownership and Dual Writers
More than one module or system claims ownership or writes to the same state.
- Symptoms:
  - Two different services or classes update the same database table independently.
  - Distributed race conditions requiring optimistic concurrency hacks or ad-hoc distributed locks.
- Remedy: Enforce a single authoritative owner for any piece of state. Other modules must read through or request mutations via the owner.

## 4. Premature Distributed Complexity
Introducing distributed systems overhead for a single-team problem.
- Symptoms:
  - Complex event choreography or multi-step sagas when an in-memory queue or modular monolith suffices.
  - Debugging a single user action requires correlating distributed logs across multiple uncoordinated boundaries.
- Remedy: Default to modular monoliths or in-process message dispatchers until organizational boundaries or physical scale demand distribution.

## 5. Temporal Decomposition
Organizing code strictly by execution sequence rather than domain knowledge.
- Symptoms:
  - Separate Step1Validator, Step2Transformer, Step3Saver classes passing an untyped blob around.
- Remedy: Group by domain entities and boundaries, keeping invariants and validation co-located with the state.

## 6. Type Escape Hatches
Relying on type evasions to make an awkward design compile.
- Symptoms:
  - Frequent any, type casts, forced non-null assertions, or massive optional property bags where fields are only valid under specific runtime modes.
- Remedy: If types cannot represent the data flow naturally, the architectural boundary is flawed. Redesign the types.
