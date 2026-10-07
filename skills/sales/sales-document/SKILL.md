---
name: sales-document
description: "Render a sales Markdown file from docs/sales (proposal, quotation, SOW, contract, one-pager) into an on-brand HTML and A4 PDF using the workspace's CI template, as a draft preview or a versioned sent copy delivered to the storage target (local folder or Google Drive). Use when a sales document is ready to preview or send."
---

# Sales document

Turn a finished Markdown document into what the client receives. Read `docs/sales/README.md` (frontmatter keys, folder rules), `docs/sales/brand/brand.md`, and the source file. No `docs/sales/brand/document-template.html`? Point at `/setup-sales-skills`.

## 1. Draft or send

- **Draft** (default): output goes to the deal's `drafts/`, overwritten freely.
- **Send**: output goes to `sent/` only when the user says this version is going to the client. That approval is recorded on the source: `verified: { by: human:<seller slug>, at: <now> }` and `status: stable`. If `deal.md` is earlier than `stage: proposal`, say so first: a document ahead of its stage usually means a skipped step. A sent version is never overwritten.

Output name: the source file's name plus version and date, e.g. `05-proposal-v2-2026-10-07.html` / `.pdf`, where `v<N>` is one more than the highest version in `sent/`.

## 2. Fill and convert

The source needs the frontmatter keys listed in the README (`type`, `title`, `doc_no`, `date`, `client_name`, ...); add any that are missing from `deal.md` and `seller.md` before rendering. If `brand.md` changed since setup, re-sync the template's `:root` tokens and font link from it first.

```bash
node <this skill>/scripts/render.mjs docs/sales/brand/document-template.html <source.md> <out.html>
```

It converts the Markdown, right-aligns columns whose every cell is a number or amount, styles a row whose first cell is wholly bold as the total, passes raw HTML blocks through (signature blocks: `<div class="signatures">`), strips footnote markers and definitions (sources stay in the frontmatter, not the client's copy), and fails listing any slot left unfilled. A column mixing numbers and text ("to be estimated") stays left-aligned: that is intended.

## 3. PDF

Absolute paths; the page needs network for its web font, and the time budget lets it load:

```bash
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless --disable-gpu \
  --no-pdf-header-footer --virtual-time-budget=10000 \
  --print-to-pdf="$PWD/<dir>/<name>.pdf" "file://$PWD/<dir>/<name>.html"
```

On Linux use `google-chrome` or `chromium`. No browser: leave the HTML and tell the user to print it to PDF (A4, headers and footers off). Client wants Word: hand the Markdown to a docx skill if one is installed, applying the same colors and fonts.

## 4. Look at it

Look at every page (read the PDF, or render a screenshot with the same Chrome command using `--screenshot` when PDF pages cannot be viewed): cover shows the logo or wordmark and correct client name, non-Latin text in the brand font, no table split mid-row, no half-empty pages before a table, totals right-aligned. Fix the source or the template and re-render until clean.

## 5. Deliver

For a `sent/` version only. Read `docs/sales/storage.md` and follow its target exactly: run its access check first (a failed check stops here with the login step for the user); find the deal's folder in its index, or create `<client>/<deal>/` there and record it; upload or copy the PDF (and `.docx` if the format says so). Delivery puts the file where the user sends it from; the agent never shares it, emails it, or changes permissions.

Log the file in `deal.md`: "rendered" for a draft; for a sent version, the local path plus the delivered location (path, or Drive file link).
