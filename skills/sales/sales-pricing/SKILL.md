---
name: sales-pricing
description: "Price a software project and its maintenance (MA): cost floor from the estimate, value ceiling, 2-3 phase or term options, payment structure, and a conservative business case for the client. Use after the scope is approved, or for an honest range when a price is asked early."
---

# Sales pricing

Recommend a structure and a range; the user sets the final number. Read `docs/sales/README.md`, `seller.md` (rate card, floors, discount envelope, payment defaults, VAT and withholding), `03-solution.md`, `01-discovery.md`. Output goes to `04-pricing.md` (internal).

## 1. Floor and ceiling

- **Floor** (cost-plus): effort range from `03-solution.md` x rate, plus infrastructure, third-party licences, the buffer, and the seller's margin floor. Below the floor is a no.
- **Ceiling** (value): what the next-best alternative costs the client (another vendor, an in-house hire, the cost of doing nothing from `01-discovery.md`). Value pricing needs a measurable value driver the client stated; without one, price at cost-plus and say so.
- Price between them. When in doubt, higher: a low price signals risk and leaves no room to trade.

## 2. Options

Two or three options, the recommended one in the middle and presented after the larger one:

- **Project**: phase variants (first phase only / phases 1-2 / full), never feature-dumped. Each step up has one named reason to choose it. Anything in all three is base scope, not a differentiator.
- **MA**: priced separately from development, anchored by **term** (e.g. 1 / 2 / 3 years, lower monthly rate for longer commitment), with included hours or response times and the rate beyond them.
- **Payment structure** is itself a lever: deposit, milestone split tied to deliverables (not dates), upfront discount only if traded for something.

Totals show tax the way `seller.md` says: price before VAT, VAT if registered, and the withholding the client deducts, so the client's accountant sees the same numbers.

## 3. Business case (for the client)

The seller builds the equation; the client supplies the numbers. Each input has a source: **client-said** (quote), **benchmark** (named source), or **seller-assumed** (visibly labelled; if it moves the result, say so in the headline, not a footnote). Missing input: `[NEEDED: ...]`, never a guess.

- 2-4 drivers, one formula each: staff time (hours x volume x cost, then a 60-70% realisation haircut), costs retired (tools, licences), errors and rework, revenue (on margin, never top line).
- Total cost of ownership: fee + MA + infrastructure + the client's own hours.
- Payback months = 12 x year-one investment / annual hard value; ROI over a stated horizon. Show conservative first (seller-assumed inputs cut hardest), then expected; name the one or two inputs the result swings on.
- Small deal: a payback line is enough. Soft value (morale, image) is listed apart and never in the headline.

## 4. Record

Write floor, ceiling, options, payment structure, business case, and the **walk-away** (from the seller's next-best use of the time, not just the floor) into `04-pricing.md`. Update `deal.md` (`stage: proposal`, next action, log line). Then `sales-proposal`.
