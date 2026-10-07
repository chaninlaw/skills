---
name: setup-sales-skills
description: "Scaffold the docs/sales/ workspace the sales skills assume: seller profile, brand (CI) and branded document template, document storage target, then open the first client. Run once per workspace; re-run to fill gaps."
disable-model-invocation: true
---

# Setup sales skills

Scaffold the per-workspace files every sales skill reads: the conventions (`docs/sales/README.md`), who is selling (`seller.md`), how documents look (`brand/`). Then hand the first client to `sales-research`.

This is a prompt-driven setup, not a script: explore, draft, confirm, write. With no user present, follow the "When no one is there to answer" rule in [workspace-readme.md](references/workspace-readme.md). It is **idempotent**: it creates what is missing and patches gaps, and it never overwrites a file the user has edited.

## 1. Explore

Read before asking; every fact the environment holds is a question the user never answers.

- Does `docs/sales/` exist? Which of `README.md`, `seller.md`, `brand/brand.md`, `brand/document-template.html` are present? Existing files mean a **warm start**: summarise them in five lines and only fill `[not captured]` fields or what the user asks to change. A file missing OKF frontmatter (`type`, `title`, `description`, `generated`; see Knowledge format in [workspace-readme.md](references/workspace-readme.md)) is a gap: add the frontmatter, leave the body as the user wrote it.
- Sources for a draft: the repo's README, website or `package.json` author, any logo or brand file already in the repo, git user name and email, an existing `AGENTS.md`/`CLAUDE.md` language rule.
- Who can read this repo? A public remote, or a **delivery repo** for a client (source handed over at the end, or the client has access), both expose `docs/sales/`. Check `git remote -v`, the README and contracts for a handover clause, and ask if unclear.

## 2. Interview the gaps

One section per message, recommended answer first so the user can accept it in a word. Draft from what exploration found and ask "what needs correcting?" rather than asking from blank.

1. **Seller type**: freelance or company. This decides which identity, tax and signatory fields apply.
2. **Identity and tax**: legal name, tax ID, address, signatory, VAT status, withholding tax, jurisdiction, and a seller slug (a short id from the git user name, written `human:<slug>` when the user approves a file).
3. **Commercial defaults**: document language and working language, currency, bank details, payment terms, quotation validity, numbering, included revision rounds.
4. **Rate card and floors**: rate, MA model, margin floor, discount envelope. Internal only.
5. **Proof points**: past work the user can show or name. Write only what they give; a profile with no proof is honest, a profile with invented proof is not.
6. **Brand (CI)**: colors (hex), fonts that cover the document language's script, logo files. Freelance with no CI: offer the neutral defaults. When the user supplies a logo, copy it into `docs/sales/brand/`; when they name only colors, check `primary` against white for 4.5:1 contrast and say if it fails.
7. **Storage**: where delivered documents go. Detect first: is `gws` installed and logged in (`gws drive about get --params '{"fields":"user(emailAddress)"}'`)? Recommend Google Drive when it is, else a local folder outside the repo. For Drive, ask for the root folder link (the id is the part after `/folders/`); if the login expired, ask the user to run `gws auth login` and continue with the rest meanwhile. Any other platform: record what the user describes.
8. **Visibility**: if the repo is client-visible or public, recommend keeping `docs/sales/` out of git (add it to `.gitignore`) or moving the workspace to a private repo. Pricing floors and negotiation notes must not reach the client. Record the answer at the top of `docs/sales/README.md`.

## 3. Write

Show the drafts, let the user edit, then write only what is missing:

- `docs/sales/README.md` from [workspace-readme.md](references/workspace-readme.md), plus the visibility line.
- `docs/sales/index.md`: frontmatter `okf_version: "0.2"` only, then a `# Workspace` section with a line per file written here (`* [Seller profile](seller.md) - <its description>`), and empty `# Clients` and `# Deals` sections for `sales-research` to fill.
- `docs/sales/seller.md` from [seller-template.md](references/seller-template.md). Every file written here gets `generated: { by: <actor>, at: <now> }`; on a warm start, patch fields, refresh `generated`, bump `version`, prepend a changelog line.
- `docs/sales/brand/brand.md` from [brand-template.md](references/brand-template.md).
- `docs/sales/storage.md` from [storage-template.md](references/storage-template.md), keeping only the chosen target's section. Run its access check once and report the result.
- `docs/sales/brand/document-template.html` from [document-template.html](references/document-template.html). Fill its setup-time slots once: `:root` tokens and `{{font_url}}` from `brand.md`; `{{lang}}`; `{{seller_name}}`; `{{seller_logo_html}}` as `<img src="<logo path relative to the deal's drafts/ and sent/ folders>" alt="<name>">` when a logo exists, else `<span class="wordmark">{{seller_name}}</span>`; the `{{label_*}}` cover labels in the document language. Leave the per-document slots for `sales-document`.

Create `clients/` and `deals/` only when the first client is opened.

## 4. First client

Ask whether there is a client to open now. If yes, run the `sales-research` skill for them: it creates `clients/<client>/profile.md` and the deal folder.

## 5. Done

Report the files written, the storage target and whether its access check passed, the visibility decision, and point the user at `/ask-sales` as the way in from now on.
