# Design Level Up

The next tier above the brand-wide design language. Private work-in-progress.

This repo holds:

- **`PRINCIPLES.md`** — the canonical reference for design depth.
  Asymmetric layout, typographic depth, layout detail, imagery with
  intent, material, voice in copy, custom detail, and the 8-point
  Specificity Test.
- **`docs/images.md`** — the image brief for the Yard & Larder
  reference: what to look for when sourcing a real photo for each
  of the 10 image slots in the demo.
- **`reference/`** — five full HTML/CSS/JS pages that prove the
  principles in different niches, with different vibes. Plain
  HTML, no framework, no build step. Open `index.html` in a
  browser.

## The five reference sites

| # | Demo | Niche | City | Vibe | Palette |
|---|---|---|---|---|---|
| 1 | [Yard & Larder](reference/yard-and-larder/) | General store | Nashville, TN | Refined, bourbon-country, editorial | warm cream + ink + oxblood |
| 2 | [Driftwood Coffee](reference/driftwood-coffee/) | Coffee roastery | Asheville, NC | Morning warmth, hand-lettered, intimate | warm beige + brown + amber |
| 3 | [Petal & Stem](reference/petal-and-stem/) | Florist | Brooklyn, NY | Alive, green, organic | paper white + sage + blush |
| 4 | [Lighthouse Books](reference/lighthouse-books/) | Bookshop | Portland, ME | Intellectual, calm, considered | paper white + navy + gold |
| 5 | [Wax & Groove](reference/wax-and-groove/) | Record store | Detroit, MI | Dark, analog, moody | charcoal + cream + burnt orange |

Five niches, five vibes, one set of depth principles. Each demo
is fully self-contained: open the index.html, no build, no server.

## Why five

The brand-wide design language is a floor. This repo is the ceiling.
Five references prove the ceiling is reachable in different
verticals, with different palettes, with different voices — not
just in one merchant's register. If the principles can be hit
in five very different contexts, they are real. If they only
work in one, they were probably accidental.

## How to read it

- **10 minutes:** Read `PRINCIPLES.md` §1–§7 (the seven depth
  moves). Skim §8 (the Specificity Test).
- **30 minutes:** Read §10 (the AI tells table — what makes a
  design look generated). Then open one or two of the references
  in a browser and walk through the page.
- **An hour:** Open all five references. Compare the same section
  across the five (the hero, the "about" prose, the visit info,
  the footer). The depth principles are the same; the vibe
  changes per palette, per voice, per layout choice.

## How to use it

When designing a new tenant or a new page:

1. Read `PRINCIPLES.md` end-to-end. Load the brand-wide design
   language from the wiki as well — this repo is *on top of* the
   brand-wide language, not a replacement for it.
2. Run the Specificity Test (§8) on the new work. Hit at least
   six of eight. Hit all eight before calling it A+.
3. Pick a reference from the five that is closest to the
   tenant's vibe. Use it as the structural template; swap the
   palette, the voice, the content, the imagery.
4. Don't fork the references. Read the principles, design the
   new work against the principles, write fresh code.

## What is NOT here

- No build tooling. The references are plain HTML/CSS/JS. Open
  the file.
- No framework. No React, no Vue, no Tailwind. The principles
  are framework-agnostic; the proofs are intentionally
  framework-free.
- No source repositories modified. This repo pulls from
  `~/Desktop/oak-ember-smokehouse/`, the wiki design language
  pages, and the merchant-sites templates — but does not
  modify any of them.

## Status

- **PRINCIPLES.md** — first draft, ratified.
- **docs/images.md** — first draft.
- **Yard & Larder** — refined with Nashville address, real
  Google Maps embed, image placeholders, "more fun" elements
  (stickers, "loving this week" section, P.S. notes, the
  "we don't" rail, maker pull-quote).
- **Driftwood Coffee, Petal & Stem, Lighthouse Books, Wax & Groove**
  — first drafts. Each proves the depth principles in a
  different niche, with a different vibe. Each has a real
  Google Maps embed. Image slots are SVG placeholders — to be
  replaced with real photography in a follow-up pass.

## Related

- Brand-wide design language:
  `wiki/clusters/cross-cluster/concepts/design-language/`
  (loaded by the wiki auto-loader)
- The previous bar (Oak & Ember): `~/Desktop/oak-ember-smokehouse/`
- Merchant-sites templates (downstream consumers):
  `C:\Users\brand\work\food-truck-template\`,
  `C:\Users\brand\work\merchant-site-template\`
