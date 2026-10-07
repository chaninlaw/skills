# Story patterns

Shapes a post can take. Each names its steps so a candidate beat can say which step it serves. Pick by what the pile holds, not by taste: a story with no wrong turns cannot carry "The wrong turn".

The names credit where each shape comes from; the descriptions here are this repo's own.

## The wrong turn

**Shape**: confident first theory -> evidence it fails -> second theory -> ... -> the clue that was there all along -> the real cause -> what it taught.

**Fits**: debugging stories with at least two discarded hypotheses in the pile. The most natural shape for a session, because sessions are full of wrong turns that summaries erase.

**Open with**: the first theory stated as the author believed it then, not with hindsight.

**Fails when**: the wrong turns are skipped or told as obviously wrong. The reader should have believed them too.

## In medias res

**Shape**: drop into the worst moment -> step back to how it got there -> return to the moment -> resolve.

**Fits**: a vivid symptom (a production error, a customer's message, a number that made no sense).

**Open with**: one concrete line from the pile's Fragments: the error, the message, the number.

**Fails when**: the flashback runs longer than the payoff, or the opening moment is never returned to.

## And, But, Therefore (Randy Olson)

**Shape**: setup with "and" (here is the situation and this is how it worked) -> "but" (the problem) -> "therefore" (what was done), repeated per section if the post is long.

**Fits**: short posts, intros, or a post whose point is a decision rather than a discovery.

**Open with**: the setup in two sentences, then the "but" in the third.

**Fails when**: there is no real "but", only "and then, and then".

## Situation, Complication, Resolution (Barbara Minto)

**Shape**: the stable situation the reader recognises -> the complication that broke it -> the resolution, stated early -> evidence for it.

**Fits**: posts for busy readers who want the answer first: a postmortem, a migration write-up, a "how we chose X".

**Open with**: the situation the reader shares, so they see themselves in it.

**Fails when**: the resolution is held back for suspense; this pattern puts it up front.

## What is, what could be (Nancy Duarte)

**Shape**: alternate between how things are now and how they could be, widening the gap, ending on a call to the new way.

**Fits**: arguing for a practice, a tool or an architecture the reader does not use yet.

**Open with**: the current pain, in the reader's daily terms.

**Fails when**: "what is" is a strawman; the reader stops trusting the "could be".

## Before, After, Bridge

**Shape**: before (the old state, with a cost) -> after (the new state, with a number) -> the bridge (how to get there, step by step).

**Fits**: tutorials and how-tos where the pile has a measurable before/after.

**Open with**: the before, costed: time lost, errors per week, lines of code.

**Fails when**: the after has no proof in the pile. Without a number, use a different pattern.

## Protagonist arc (after Joseph Campbell, simplified by Dan Harmon's story circle)

**Shape**: a person in a comfortable place -> wants something -> enters an unfamiliar situation -> adapts -> gets it, at a cost -> returns changed.

**Fits**: personal posts: learning a stack, a side project, the first time doing something. The protagonist is the author, or a user of the software.

**Open with**: the comfortable place, briefly, so the change has somewhere to start from.

**Fails when**: the author has no cost or change; then it is a changelog, not an arc.

## Ki-sho-ten-ketsu

**Shape**: introduce (ki) -> develop (sho) -> an unexpected turn that reframes it, without conflict (ten) -> reconcile the two (ketsu).

**Fits**: posts with no villain: an insight, a pattern noticed, two ideas that turn out to be one. A useful default when the story has no struggle in it.

**Open with**: the first idea, plainly, with no hint of the turn.

**Fails when**: the "ten" is signposted in advance.

## Choosing

| The pile has | Try |
| --- | --- |
| 2+ discarded hypotheses | The wrong turn |
| One vivid moment | In medias res |
| A decision between options | SCR, or And-But-Therefore |
| A before/after number | Before, After, Bridge |
| An idea to sell | What is, what could be |
| A personal change | Protagonist arc |
| An insight, no struggle | Ki-sho-ten-ketsu |

Patterns combine: an In medias res opening often hands over to The wrong turn for the body.
