# Wayfinder Architecture Decision Package Template

Use this template when posting a resolution comment or presenting architectural options back to a Wayfinder ticket.

```markdown
## Architectural Decision: <Decision Title>

### 1. Problem and Dilemma
- Context: <Brief summary of what feature/system needs this decision>
- Core Dilemma: <e.g., Centralized Server Authority vs Autonomous Client CRDTs>
- Constraints: <Language/runtime, expected volume, team capacity, operational limits>

### 2. Industry Precedents (Tech Blogs and Case Studies)
- <Source 1>: <What they did and what trade-offs they observed in production>
- <Source 2>: <What they did and what trade-offs they observed in production>

### 3. Candidate Architectural Sketches (Design It Twice)

#### Candidate A: <Name of Pattern A>
- Concept: <1-2 lines on the architectural idea>
- Caller Usage:
```<language>
// How a consumer/caller uses this interface
```
- Module Boundary and Types:
```<language>
// Types, signatures, and interfaces with not implemented bodies
```

#### Candidate B: <Name of Pattern B>
- Concept: <1-2 lines on the architectural idea>
- Caller Usage:
```<language>
// How a consumer/caller uses this interface
```
- Module Boundary and Types:
```<language>
// Types, signatures, and interfaces with not implemented bodies
```

### 4. Trade-off Matrix

| Criterion | Candidate A (<Name>) | Candidate B (<Name>) |
| :--- | :--- | :--- |
| Implementation Complexity | <Low / Medium / High> | <Low / Medium / High> |
| Operational Maintenance | <Low / Medium / High> | <Low / Medium / High> |
| Known Failure Modes | <What breaks when things go wrong> | <What breaks when things go wrong> |
| Interface Depth | <High (hides complexity) / Shallow> | <High (hides complexity) / Shallow> |
| Scalability Ceiling | <Limits before redesign is required> | <Limits before redesign is required> |

### 5. Recommendation
- Recommended Choice: <Candidate A or B>
- Why for This Project: <Justification based on current constraints and avoiding premature optimization>
- Open Question for Human: <Specific prompt for the user to make the final call>
```
