---
name: grilling-pain
description: "Grilling extension that digs past an \"I want...\" request to the problem behind it, building rapport before probing for pain. Use when the user wants the real problem behind a request found before anything gets built, or asks to grill for pain."
---

Call the Skill tool with "grilling" and run its rounds, frontier, and fact-finding as written. If it isn't installed, tell the user to run `npx skills add mattpocock/skills --skill grilling`. This skill changes grilling in two ways: the question format below replaces grilling's, and the interview moves through the four steps below in order.

People ask for solutions, not problems. "I want a dashboard" names a fix someone has already picked; the **pain** is whatever made them reach for it. Treat every request as a possible XY problem: they asked for Y, and your job is to find X. Run the interview in the user's language.

## Question format

Tag every question three ways, so the user can see at a glance how much thought it takes, what kind of answer it wants, and whose point of view to answer from.

**Effort** is a colored circle emoji in front of the question, rated by how much thinking it takes the person answering:

- green circle (U+1F7E2): answerable off the top of their head, such as a fact they know or a yes to a guess.
- yellow circle (U+1F7E1): needs a moment to recall or look up, such as a recent example, a rough number, or a file to check.
- red circle (U+1F534): needs real thought, such as weighing trade-offs or making a judgment call.

**Type** sets how the question ends:

- **Tell**: a fact or story only they know (how things work, what happened). Ends with a **Guess** line: your hypothesis, for them to correct.
- **Confirm**: checks a guess or a playback. Word it so "yes" accepts it; it needs no closing line.
- **Decide**: a choice between options listed in the body. Ends with a **Recommended** line: the option you'd pick and why, worded so "yes" accepts it.

Steps 2 and 3 use only Tell and Confirm; Decide questions start in step 4.

**Perspective** names whose point of view the answer should come from, and whose need the question serves. When that is someone other than the user, the user answers as that person as best they can. A question only that person can answer skips the round and goes straight onto the open questions (step 1).

Order each round green first and red last, so the user warms up on quick answers and saves their best thinking for the hard ones. Open the first round with a one-line legend for the colors, and write every label in the user's language. In Thai, use: เล่าให้ฟัง (Tell), ยืนยันคำตอบ (Confirm), ต้องตัดสินใจ (Decide), ตอบในมุมของ (Answer as), ใครต้องการ (For), เดาไว้ว่า (Guess), แนะนำ (Recommended), and for the legend ตอบได้ทันที (green), ต้องนึกหรือเปิดดูก่อน (yellow), ต้องคิดจริงจัง (red). Format a round like this:

```
<effort circle> **Q1 · <type>: <question title>**
Answer as: <whose point of view> · For: <whose need it serves>

<question body>

<closing line for the type, if any>

---

<effort circle> **Q2 · <type>: <question title>**
Answer as: <whose point of view> · For: <whose need it serves>

<question body>

<closing line for the type, if any>
```

## 1. Pin down the request

Find where the request starts: "I want", "I need", "it'd be great if", or in Thai "อยาก", "อยากได้", "อยากให้", "ต้องการ". Read from there to the end of the sentence and break it into:

- **Who** wants it: the user, or someone they're asking on behalf of (a client, a manager, a teammate).
- **What** they asked for, quoted word for word.
- **Suspected pain**: your first guess at the problem it's meant to solve. A hunch, not a finding.

If there's no such phrase, the request itself is the starting point ("can you build X", "ช่วยทำ X หน่อย"). If the user invoked the skill with nothing after it, use the latest request in the conversation; if there isn't one, ask what they want in a single line.

Done when your first round opens with the request restated in one line: who, what, and the exact quote.

When the user is asking on someone else's behalf, they answer what they can. Anything only that person knows goes on a list of **open questions** for the user to take back to them.

## 2. Context: build rapport

Earn the right to ask "why" by first showing you understand their world. In this phase, ask about their situation, not their reasons:

- Where the request comes from: their role, the work, who else is involved.
- How things work today without it: the current process, tools, routine.
- Why now: what happened that made them ask today.

Cap each round at three questions instead of grilling's whole frontier, so it feels like a conversation and not a form. Echo their own words back. Here a Guess is a quick read of their situation that shows you've done your homework.

Done when you play their situation back in a short paragraph, in their words, as a Confirm question, and they say you've got it. If they correct you, run another context round.

## 3. Pain: find the real problem

Now ask why. Stick to specific things that already happened, not hypotheticals or predictions (the Mom Test): "What did you do the last time this came up?" beats "Would X help?". When an answer is vague, **ladder** down two or three times: ask for an example, how often it happens, what it cost.

You have the pain only when you can state all four:

- the problem in their words, with a recent, concrete example (when it happened and what went wrong);
- the root cause, as distinct from the symptom;
- what they've already tried, and why it didn't work;
- the cost: time, money, errors, stress, or who else gets hit.

Agreeing with your Guess proves nothing; a real story does. If the pain turns out to differ from the one you suspected in step 1, say so plainly: that gap is the finding.

When the user is answering for someone else, mark each of the four as either the user's account (secondhand) or `Unknown`. Turn each `Unknown` into the open question that would answer it, and run step 4 on what you have, labelling the verdict provisional.

## 4. Test the request against the pain

Check the original request against the confirmed pain with Decide questions. Does it fix the root cause, just a symptom, or something else entirely? Would a cheaper or different fix solve the problem just as well?

Done when the frontier is empty and you've written up:

- **Request**: the original sentence, word for word.
- **Context**: the playback they confirmed.
- **Pain**: the four parts from step 3.
- **Verdict**: whether the request solves the pain, and what you'd recommend instead or alongside it.
- **Open questions**, if any.
