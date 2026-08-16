# Design Level Up

The next tier above the brand-wide design language.

This repo is a private work-in-progress. It holds:

- **`PRINCIPLES.md`** — the canonical reference for design depth. Asymmetric
  layout, typographic depth, layout detail, imagery with intent, material,
  voice in copy, custom detail, and the Specificity Test.
- **`reference/`** — one full HTML/CSS/JS page (Yard & Larder, a fictional
  general store in Bardstown, Kentucky) that proves the principles can be
  hit. Open `reference/index.html` in a browser; no build step.

## Why this exists

The brand-wide design language in the wiki captures *restraint*: one
accent, lean motion, section grammar, font pair. Restraint is the floor.
It is not the ceiling.

This repo is the ceiling. The principles here are about *composition* —
not just "don't do bad things" but "do these specific things that signal
a person made them."

## How to read it

If you have ten minutes, read `PRINCIPLES.md` §1–§7 (the principles)
and skim the eight-point Specificity Test (§8).

If you have an hour, also open `reference/index.html` in a browser. The
page is a real-feeling merchant landing page that demonstrates every
principle in `PRINCIPLES.md`. Walk through the markup, the styles, the
small JS file. The principles become concrete.

## How to use it

When designing a new tenant or a new page, before shipping:

1. Read `PRINCIPLES.md` end-to-end. Load the brand-wide design language
   from the wiki as well — this repo is *on top of* the brand-wide
   language, not a replacement for it.
2. Run the Specificity Test (PRINCIPLES.md §8) on the new work. Hit at
   least six of eight. Hit all eight before calling it A+.
3. If the work reaches the bar, fold the relevant patterns back into the
   brand-wide language as `shared-core` candidates — not as new principles,
   but as new pattern pages with the depth applied.

## Status

Draft 1. The principles are the first pass; they will sharpen as
additional reference pages are added. The Yard & Larder reference is
the first proof; future references will cover other verticals (a
roastery, a salon, a marina — to prove the language generalizes).

## What is NOT here

- No build tooling. The reference is plain HTML/CSS/JS. Open the file.
- No framework. No React, no Vue, no Tailwind. The principles are
  framework-agnostic; the proof is intentionally framework-free.
- No source repositories modified. This repo pulls from
  `~/Desktop/oak-ember-smokehouse/`, the wiki design language pages,
  and the merchant-sites templates — but does not modify any of them.

## Related

- Brand-wide design language: `wiki/clusters/cross-cluster/concepts/design-language/`
  (loaded by the wiki auto-loader; do not duplicate here)
- The previous bar (Oak & Ember): `~/Desktop/oak-ember-smokehouse/`
- Merchant-sites templates (downstream consumers):
  `C:\Users\brand\work\food-truck-template\`,
  `C:\Users\brand\work\merchant-site-template\`
