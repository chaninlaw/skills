Skills are organized into bucket folders under `skills/`:

- `engineering/`: daily code work
- `productivity/`: daily non-code workflow tools
- `misc/`: kept around but rarely used, not promoted
- `in-progress/`: beta, public on purpose, not shipped in the plugin
- `sales/`: the sales skill set (lead to signed contract), public but not promoted until tested on real deals; treated like `in-progress/` for `plugin.json` and the top-level `README.md`
- `deprecated/`: no longer used

Every skill in `engineering/` or `productivity/` (the **promoted** buckets) must have a reference in the top-level `README.md`, a line in its bucket `README.md`, and an entry in `.claude-plugin/plugin.json`'s `skills` array (the Claude Code plugin ships exactly the promoted set). Skills in `misc/`, `in-progress/`, `sales/` (until promoted), and `deprecated/` must not appear in `plugin.json` or the top-level `README.md`.

Each skill lives in its own folder containing `SKILL.md`. Frontmatter needs both `name` and `description`, or skills.sh will not discover it. Keep every skill at most 3 levels below the repo root so the `npx skills` installer finds it (`skills/<bucket>/<skill>/SKILL.md` is exactly 3).

Each bucket folder has a `README.md` listing every skill in the bucket with a one-line description, the skill name linked to its `SKILL.md`. Promoted buckets group entries into **User-invoked** (`disable-model-invocation: true`) and **Model-invoked**.

When a skill is derived from someone else's work, say so in the top-level `README.md` under Credits, put a `LICENSE` file inside the skill folder that keeps their copyright line above yours, and record the source repo and commit. The root `LICENSE` covers only your own work.

No emoji anywhere in this repo.

Not set up yet (add when the repo needs them): `docs/` pages per skill, `.changeset/` and `CHANGELOG.md`, `.agents/` ADRs, `scripts/link-skills.sh`, `.claude-plugin/marketplace.json`.
