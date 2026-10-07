---
name: writing-beats
description: Assemble a raw-material pile (usually from writing-harvest) into a blog post one beat at a time, offering 2-3 candidate beats at each step, each named by the story pattern it follows, and grounding every concept before a beat leans on it.
disable-model-invocation: true
---

# Writing beats

The user has passed (or will pass) a markdown file of raw material, usually `docs/writing/posts/<slug>/raw.md` from `writing-harvest`. The exploring is done and the pile is fixed. Commit to a path through it and mine the pile to fill each beat. Do not edit the pile.

Save the article next to the pile as `article.md` unless the user says otherwise. Read `docs/writing/voice.md` if it exists: it sets the audience, the language and the author's voice. With no `voice.md`, write in Thai with technical terms kept in English, and ask once who the reader is.

## The loop

1. **Establish the prerequisites.** Settle with the user what the reader already knows walking in: the concepts that are **grounded** from the start. Everything else must be grounded by a beat before a later beat can lean on it. See [Grounding](#grounding).
2. **Pick the pattern and the opening.** Offer 2-3 candidate **starting beats**, drawn from the pile (start from its candidate angles). Each is a different entry point and follows a different pattern from [story-patterns.md](references/story-patterns.md). For each, show the beat itself, the pattern name, what it grounds, and a one-line preview of where that path goes. The user picks one, or asks for a hybrid.
3. **Write only that beat** to the article file. A beat may be one sentence or several paragraphs, whatever that beat naturally is. Stop there.
4. **Re-read the article file from disk.** Then offer 2-3 candidate **next beats**: different directions the story could take from where it now stands. Each must be reachable from the current grounded set; note what each grounds and which step of the chosen pattern it serves. One option may break the pattern on purpose; say so when it does.
5. Loop steps 3-4 until the story reaches a natural end. Then offer `writing-edit` for the final pass.

## Grounding

Every **concept** has to be **grounded** before a beat can lean on it: the reader either walked in knowing it or met it in an earlier beat. A beat that reaches for an ungrounded concept loses the reader; that is the one move the story can't make. The unit is the concept, not the word for it: a beat can lean on an idea the reader lacks even with no jargon in sight. Where a concept has a name (a **term**), grounding it means landing the idea and the term together.

A concept gets grounded one of two ways:

- **Prerequisite**: grounded before the first beat. The reader brings it. Fixed at the start.
- **Introduced**: a beat establishes it, and from then on it's grounded for every later beat.

Each beat does two jobs: it **requires** concepts that are already grounded, and it **grounds** new ones. Keep a running list of what's grounded so far and update it each time a beat lands.

The big lever is what you make a prerequisite versus what you ground inside the piece. Demand too much up front and you shut out readers who don't have it; ground too much inside and the early beats drown in definitions. Revisit it whenever a tempting beat turns out to need a concept nothing has grounded yet: the fix is either a grounding beat before it, or promoting the concept to a prerequisite.

## What is a beat

A beat is one move. It does one thing: sets a scene, lands a point, asks a question, drops an aside, twists the angle. Then it stops, leaving the reader at a place where the next beat can pivot.

- A single sentence if that's all the move is ("แล้วก็ไม่มีอะไรเกิดขึ้นอีกเลยสามอาทิตย์").
- A short paragraph if the move needs setup.
- Several paragraphs if the beat is a self-contained vignette, argument or example.

A "beat" that needs five paragraphs and three subheadings is two beats glued together. Split it.

## Pulling from the pile

The pile is a quarry: paraphrase, split, recombine or quote. Prefer the pile's **Fragments** where they fit; the author's own phrasing beats a paraphrase. The wrong turns are usually the best material in a debugging story; do not compress them into one line unless the user asks.

Never add a fact, number, quote or outcome the pile does not hold. If a beat needs one, ask the user, or mark the gap `[TODO: ...]` in the article and say so.

## Ending

The story ends when the journey is complete, not when the pile is empty. Leftover fragments are expected.

## Writing rhythm

- Append one beat at a time. Never write ahead.
- Re-read the article file from disk before every write. Preserve user edits absolutely.
- If the user edits a previous beat substantially, let it change what comes next.
- "Rewrite that beat" or "try a different beat 3": edit in place, leave the rest alone.
