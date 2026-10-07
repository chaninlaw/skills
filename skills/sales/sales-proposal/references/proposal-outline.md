# Proposal outline

Three parts, one per reader. Each part must work when read alone by its reader: the owner or executive reads Part 1, the IT lead or technical advisor reads Part 2, procurement and finance read Part 3. Cut any section that does not apply; never pad one to fill it. On a small deal a part may be a single page.

## Cover

Rendered by `sales-document`: a title tied to the client's goal, prepared for, prepared by, document number, date, valid until.

## Part 1. Business (owner / executive)

1. **Executive summary** (one page at most): the client's situation, the challenge and what it costs them to leave it, the recommended solution in two sentences, 3-4 outcomes they can measure, the investment, one recommendation. The client's name in the first paragraph.
2. **Our understanding** (2-3 short paragraphs): the problem in their words, current state vs desired outcome, their numbers, the people we spoke with.
3. **Proposed solution** (1-2 paragraphs): what and why, each part tied back to a stated problem ("because orders are re-keyed twice a day, we...").
4. **Business value**: the business case from `04-pricing.md` (payback, conservative first, inputs labelled by source). Skip it when there is no client-stated number to build on.
5. **Why us**: 2-3 sentences + 1-2 proof points from `seller.md`, from a relevant domain.

## Part 2. Technical (IT lead / technical advisor)

From the technical approach in `03-solution.md`; nothing here that the solution file does not support.

6. **Architecture**: components and how data flows between them, as a diagram image in the deal folder (referenced with `<img>`) or a component table.
7. **Technology**: stack and hosting, and why it fits their constraints (existing systems, skills, budget), in plain words.
8. **Integration**: each system we connect to, direction (read / write), method, and what we need from its owner.
9. **Security and data**: access control, backups, where data lives, personal-data handling under the client's data-protection law. Certifications only if `seller.md` lists them.
10. **Operations**: environments, deployment, monitoring, what happens when something breaks.

## Part 3. Scope and commercials (procurement / finance)

11. **Scope and deliverables**: numbered, concrete, quantified. Then **Not included in this scope**, with a line that these can be quoted separately. Client responsibilities and assumptions.
12. **Timeline**: a phase table (phase, duration, deliverables, what the client provides). If there is a fixed deadline, plan backwards from it. State what the dates assume. Switch to a Gantt chart (as an image) only when the work has parallel tracks (a helper or another vendor working alongside), waits on a third party mid-project, runs longer than about six months, or the client requires one (a public-sector TOR, a PMO); otherwise sequential phases read more clearly as the table.
13. **Investment**: the options with the recommended one marked and why; payment schedule tied to deliverables; tax lines.
14. **Maintenance and SLA**: MA by term as its own line; response and fix times by severity; included hours; what MA excludes; service hours.
15. **Terms summary** in plain words: acceptance, revision rounds and the rate beyond, change requests, ownership on full payment, warranty, validity. Reference the contract for the rest.
16. **Next step**: one action and its date ("approve option B and return the signed quotation by <date>; we invoice the deposit and start the following week").

## Walkthrough deck (optional)

For a presentation meeting: 8-12 slides cut from the same three parts (problem in their words, outcome, solution, architecture picture, phases, investment, next step). Same numbers and wording as the proposal; a deck never says anything the document does not. Render with a slides or pptx skill if one is installed.

## Tone

Confident, specific, brief, human, honest about limits. Match the client's register: an SME owner gets plain speech, a corporate buyer gets formal structure. Mirror their words from discovery. Part 2 is explained so the owner could follow it too.

## Anti-patterns

Jargon and "we are passionate about"; a company history; price buried or apologised for; "up to" and "starting from" weasel words; promised outcomes outside our control; three different calls to action; an "and other tasks as required" scope; undefined deliverables ("documentation"); acceptance "when the client is satisfied"; all obligations on the seller and none on the client; a technical part that lists buzzwords instead of decisions.
