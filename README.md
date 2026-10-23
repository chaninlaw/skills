# Skills

chaninlaw's agent skills.

## Installation

Installs editable skill files into your project through [skills.sh](https://skills.sh):

```bash
npx skills add chaninlaw/skills
```

Pick the skills you want, and which coding agents to install them on. To install one skill:

```bash
npx skills add chaninlaw/skills --skill architect-scout
```

The installer collects anonymous usage data. Set `DISABLE_TELEMETRY=1` or `DO_NOT_TRACK=1` to turn it off.

## Skills

### Engineering

User-invoked (reachable only when you type them):

- **[architect-scout](./skills/engineering/architect-scout/SKILL.md)**: Explore and research architecture patterns from tech blogs and industry case studies, sketch candidate code shapes, and resolve hard architecture decisions for Wayfinder tickets.
- **[create-verification-skill](./skills/engineering/create-verification-skill/SKILL.md)**: Generate a project-local verification skill that drives your app the way a user does, with a feature map of user-facing behavior.
- **[maintain-verification-skill](./skills/engineering/maintain-verification-skill/SKILL.md)**: Periodic pass that keeps a verification skill and its feature map honest, shipping at most one PR of proven corrections.

Other buckets ([sales](./skills/sales/README.md), [writing](./skills/writing/README.md), [productivity](./skills/productivity/README.md), [misc](./skills/misc/README.md), [in-progress](./skills/in-progress/README.md)) are not promoted yet or empty.

## Credits

`create-verification-skill` and `maintain-verification-skill` are copied from [pstack](https://github.com/cursor/plugins/tree/main/pstack) by Lauren Tan (MIT), taken at commit `4e5b1cf` (pstack 0.15.10). Changes from the original: the hard-coded `.cursor/skills/verify-<app>/` output location is replaced by a `<skills-dir>` step that picks the skills directory of whichever agent environment is running (Claude Code, Cursor, or others).

`architect-scout` is adapted from the `architect` skill in [pstack](https://github.com/cursor/plugins/tree/main/pstack) by Lauren Tan (MIT) and designed to bridge architecture decision tickets in `wayfinder` by Matt Pocock ([mattpocock/skills](https://github.com/mattpocock/skills), MIT). It combines tech blog research with candidate code sketches and trade-off matrices.

The [sales](./skills/sales/README.md) bucket is rewritten from these MIT-licensed sources, each skill folder carrying a `LICENSE` with the original copyright lines:

- [mattpocock/skills](https://github.com/mattpocock/skills) at `f3fc563` (Matt Pocock): `ask-matt` and `setup-matt-pocock-skills` shape `ask-sales` and `setup-sales-skills`.
- [alirezarezvani/claude-skills](https://github.com/alirezarezvani/claude-skills) at `19392f7` (Alireza Rezvani): `sales-engineer`, `rfp-responder`, `pricing-strategist`, `deal-desk`, `contract-and-proposal-writer`, `dossier`, `brand-guidelines`.
- [mbfinotti/sales-skills](https://github.com/mbfinotti/sales-skills) at `1ef6888` and [mbfinotti/revops-skills](https://github.com/mbfinotti/revops-skills) at `2dedb39` (Nativa Labs): `sales-discovery-questions`, `sales-meeting-recap`, `deal-red-flags`, `meddpicc-scorecard`, `deal-champion-mapping`, `deal-value-calc`, `negotiation-concession-planner`, `sales-objection-handling`, `sales-kickoff`, `pipeline-stage-definition-audit`, `sales-to-cs-handoff`.
- [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) at `5e721d7` (Corey Haines): `prospecting`, `product-marketing`, `pricing`, `offers`, `sales-enablement`.
- [jezweb/claude-skills](https://github.com/jezweb/claude-skills) at `64965d9` (Jeremy Dawes): `proposal-writer`.

Changes from the originals: condensed to one solo-seller flow over a shared `docs/sales/` workspace whose stage exit criteria are buyer acts recorded as files; enterprise team mechanics (approval chains, quotas, scoring scripts) dropped; Thailand drafting pointers and a branded print template added. `sales-document` and the template are original.

`writing-beats` in the [writing](./skills/writing/README.md) bucket is adapted from `writing-beats` in [mattpocock/skills](https://github.com/mattpocock/skills) at `f3fc563` (Matt Pocock, MIT). Changes from the original: reads a `docs/writing/` workspace and the author's `voice.md`, defaults to Thai, and names each candidate beat by a story pattern from its own `references/story-patterns.md`. `writing-harvest` (with its session extractor) and `writing-edit` are original.

`grilling-pain` in the [in-progress](./skills/in-progress/README.md) bucket extends `grilling` from [mattpocock/skills](https://github.com/mattpocock/skills) at `5beb35b` (Matt Pocock, MIT) the way his `grill-me` and `grill-with-docs` do: it loads `grilling` through the Skill tool and layers its own rules on top, so `grilling` must be installed alongside it. What it adds: it treats an "I want..." request (including Thai "อยาก...") as a fix the person has already picked rather than the problem itself. Before asking why, it builds rapport with short rounds of open questions about their situation and plays that situation back for them to confirm. It then works through specific past events until the problem has a concrete example, a root cause, what they already tried, and what it costs. Recommended answers return only at the end, to test the request against that problem. Its question format replaces grilling's: each question is tagged with a colored circle for how much thought it takes, a type (Tell, Confirm or Decide), and whose point of view to answer from, and each round runs from the quickest question to the hardest.

## License

MIT. See [LICENSE](./LICENSE). Skills derived from other projects carry their own `LICENSE` inside the skill folder, keeping the original copyright line.
