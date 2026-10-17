# Technical Sources and Research Strategies

Use these high-trust primary and secondary sources to explore architectural patterns when resolving unknown or contentious design decisions.

## High-Trust Engineering Blogs

### Real-Time, Collaboration, and Sync
- Figma Engineering: Canvas state, multiplayer synchronization, WebAssembly pipelines.
- Linear Method and Engineering: Offline-first sync engine, local SQLite persistence, optimistic UI updates.
- Discord Engineering: High-throughput message queuing, Elixir/Rust state orchestration, ScyllaDB migration lessons.
- Slack Engineering: Real-time messaging pipelines, client caching layers, state machine patterns.

### Distributed Systems and Infrastructure
- Stripe Engineering: Idempotency keys, transactional outbox pattern, payment state machines, zero-downtime schema migrations.
- Netflix Technology Blog: Chaos engineering, circuit breakers, cache architectures, service mesh lessons.
- Cloudflare Blog: Edge state, Durable Objects, serverless databases, WebSockets at scale.
- Uber Engineering: Microservice deprecation, distributed tracing, domain-oriented microservice architecture (DOMA).

### Architectural Authorities and Foundations
- Martin Fowler (martinfowler.com): Core software design vocabulary (Event Sourcing, CQRS, Strangler Fig, Deep Modules).
- Martin Kleppmann (Designing Data-Intensive Applications): Transaction isolation levels, CRDTs, replication hazards.
- ByteByteGo / Alex Xu: Clear system design decompositions and tradeoffs.
- InfoQ Architecture Track: Conference presentations from principal architects on real-world migrations.

## Community Debates and Production Retrospectives

- Hacker News: Search for "Why we switched from X to Y" or "Ask HN: How do you handle [problem] in production?".
- Reddit r/softwarearchitecture: Discussions on boundary placement, DDD, modular monoliths vs microservices.
- GitHub Architecture Discussions: Inspect PRs and architecture proposals in high-profile open-source projects.

## Search Query Formulation Tactics

When researching an architectural dilemma, do not merely search for "how to implement X". Search for how it fails in production:
1. `"[Pattern A] vs [Pattern B] trade-offs in production"`
2. `"Why we moved away from [Pattern or Technology]"`
3. `"[Company] engineering [specific problem] architecture"`
4. `"[Pattern] failure modes OR postmortem"`

## Screening Research Findings

- Discard hyper-scale overkill: If an approach was built by Google or Meta to solve a 100-million user problem, evaluate whether it introduces accidental complexity for a smaller team.
- Prefer solutions that match current team velocity and operational constraints.
- Value postmortems and migration regrets higher than launch announcements.
