---
name: writing-edit
description: "Final pass on a drafted blog post: fix the order so every concept lands before it is used, cut AI-sounding prose in Thai and English while keeping the author's voice, and re-check redaction before publishing. Use when an article draft is done and needs editing."
disable-model-invocation: true
---

# Writing edit

The draft says the right things; this pass makes it read like a person wrote it and makes sure nothing private leaks. Edit `article.md` in place, one section at a time, and show each change before moving on. Never change a fact, number or quote; if one looks wrong, ask.

Read `docs/writing/voice.md` first if it exists. The author's sample paragraphs are the target: match their sentence length, their register, how much English they mix in. When a rule below fights the author's voice, the voice wins.

## 1. Order

Split the article by headings. For each section, list the concepts it leans on and the ones it introduces. If a section leans on something introduced later, reorder or add a grounding line. Confirm the section order with the user before rewriting anything.

## 2. Prose

Per section, in this order:

1. **Cut**: throat-clearing intros, paragraphs that restate the previous one, a closing summary that repeats the post.
2. **Concrete**: replace every claim that has a specific behind it in the pile (`raw.md`) with the specific: the error text, the number, the command.
3. **Slop**: remove the patterns in [thai-slop.md](references/thai-slop.md) (Thai) and [english-slop.md](references/english-slop.md) (English). Fix the sentence, do not just delete the phrase.
4. **Rhythm**: vary sentence length. One short sentence after a long one carries weight.

Keep a paragraph to one idea. Keep the author's jokes, asides and opinions; they are the voice, not the noise.

## 3. Redaction check

Re-read `docs/writing/redact.md` and search the whole article for every entry, plus the patterns a list misses: tokens, keys, IPs, emails, phone numbers, hostnames, client names in file paths and screenshots' alt text. Edits can bring back what harvest removed. Report each hit; do not publish-ready a post with one open.

## 4. Hand back

Give the user: a short list of what changed per section, any `[TODO]` or `[inferred]` markers still in the text, and the redaction check result. Suggest a title and a one-line description built from the article's own opening, not new claims.
