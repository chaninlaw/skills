# Skills

chaninlaw's agent skills.

## Installation

Installs editable skill files into your project through [skills.sh](https://skills.sh):

```bash
npx skills add chaninlaw/skills
```

Pick the skills you want, and which coding agents to install them on. To install one skill:

```bash
npx skills add chaninlaw/skills --skill create-verification-skill
```

The installer collects anonymous usage data. Set `DISABLE_TELEMETRY=1` or `DO_NOT_TRACK=1` to turn it off.

## Skills

### Engineering

User-invoked (reachable only when you type them):

- **[create-verification-skill](./skills/engineering/create-verification-skill/SKILL.md)**: Generate a project-local verification skill that drives your app the way a user does, with a feature map of user-facing behavior.
- **[maintain-verification-skill](./skills/engineering/maintain-verification-skill/SKILL.md)**: Periodic pass that keeps a verification skill and its feature map honest, shipping at most one PR of proven corrections.

Other buckets ([productivity](./skills/productivity/README.md), [misc](./skills/misc/README.md), [in-progress](./skills/in-progress/README.md)) are empty for now.

## Credits

`create-verification-skill` and `maintain-verification-skill` are copied from [pstack](https://github.com/cursor/plugins/tree/main/pstack) by Lauren Tan (MIT), taken at commit `4e5b1cf` (pstack 0.15.10). Changes from the original: the hard-coded `.cursor/skills/verify-<app>/` output location is replaced by a `<skills-dir>` step that picks the skills directory of whichever agent environment is running (Claude Code, Cursor, or others).

## License

MIT. See [LICENSE](./LICENSE). Skills derived from other projects carry their own `LICENSE` inside the skill folder, keeping the original copyright line.
