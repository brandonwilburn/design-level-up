# AGENTS.md

This file is for AI agents working inside the `design-level-up` repo.
Read it before touching anything.

## What this repo is

A private work-in-progress. Three artifacts:

- **`PRINCIPLES.md`** — the canonical reference for design depth.
  The source of truth for the principles. Every other file in
  this repo defers to it.
- **`docs/images.md`** — the image brief for the Yard & Larder
  reference. What to look for when sourcing real photos.
- **`reference/`** — five full HTML/CSS/JS reference pages that
  prove the principles. Each demo lives in its own subfolder.
  Each is self-contained; open its `index.html` in a browser.

## Repo layout

```
design-level-up/
├── PRINCIPLES.md                # the depth principles (canonical)
├── AGENTS.md                    # this file
├── README.md                    # project context
├── docs/
│   └── images.md                # Yard & Larder image brief
├── reference/
│   ├── yard-and-larder/         # Nashville general store (refined)
│   ├── driftwood-coffee/        # Asheville coffee roastery
│   ├── petal-and-stem/          # Brooklyn florist
│   ├── lighthouse-books/         # Portland bookshop
│   └── wax-and-groove/          # Detroit record store
└── .gitignore
```

## What this repo is NOT

- Not a starter template. Don't fork it; don't generate a new
  tenant from it. It's a reference, not a blueprint.
- Not a replacement for the brand-wide design language in the
  wiki. The wiki is the floor (restraint). This is the ceiling
  (composition). They layer.
- Not framework-specific. The principles are framework-agnostic.
  Each reference proof is intentionally framework-free (plain
  HTML/CSS/JS, no build step). If you add a new reference, follow
  the same convention unless there's a strong reason not to.

## Conventions

- **Markdown style.** Match the wiki voice: declarative, evidence-
  driven, with explicit adopt / consider / reject markers. No
  marketing copy. No "in this article we will..." openers.
- **HTML structure.** Semantic. Headings nest correctly. `<address>`
  for addresses, `<dl>` for term/value pairs, `<article>` for
  self-contained pieces, `<aside>` for tangential content. ARIA
  only when the semantic markup doesn't carry the meaning.
- **CSS architecture.** Tokens at the top of `styles.css` (palette,
  type, scale, spacing, geometry). Sections numbered in comments.
  No utility classes — components, not utilities. Hairline borders
  in place of `box-shadow`; one accent per demo, three roles
  (base / hot / cream).
- **JS.** Minimal. State only, no motion. The motion grammar in
  `PRINCIPLES.md` §1 and the no-reveal-on-scroll decision forbid
  JS-driven motion. Any new JS must be functional, not decorative.

## The Specificity Test (PRINCIPLES.md §8)

Before any new design work ships — a new reference page, a new
section added to an existing page, a new pattern demonstration —
run the eight-point Specificity Test. The test is the bar.

A passing design hits at least six of eight. An A+ design hits
all eight.

## Adding a new reference

When a new reference is needed (a new vertical, a new vibe):

1. Create `reference/<name>/` with `index.html`, `styles.css`,
   `script.js`. The new demo is fully self-contained.
2. Use a different palette from the five existing demos. The point
   of multiple references is to show the principles can be hit
   in different aesthetics, not to show the same code can be
   reused. Pick a palette that fits the niche.
3. Pick a real address in a real city. The Google Maps embed
   pattern is in every existing reference; copy the format.
4. Write the copy with specificity: every paragraph has a number,
   a name, a place, or a date. Use P.S. and P.P.S. asides for
   personality.
5. Include at least one *made* visual element (an SVG illustration
   for the hero, a custom mark, a custom divider). Don't rely
   on stock photography alone.
6. Run the Specificity Test. Hit at least six of eight.
7. Update `README.md` to add the new reference to the table.

Don't copy-paste the code from an existing reference into a new
one. Read the principles, design the new page against the
principles, write fresh code.

## Modifying an existing reference

When refining a reference (e.g., the Yard & Larder "more fun"
refinement):

1. The reference is the current best demonstration of the
   principles. Don't lower the bar to make a refinement easier.
2. Run the Specificity Test after the change. Still hitting six
   of eight? If not, the refinement regressed the design.
3. If the refinement is substantial, commit on a
   `feature/<name>-refinement` branch and merge after operator
   review.

## When to update PRINCIPLES.md

Update the principles when:

- A new depth move is added (a new principle section). Pair it
  with a reference page that proves the move.
- An existing principle proves wrong. Supersede it with a new
  section that explains the change. Do not silently edit.
- A new anti-pattern is observed (something AI defaults to that
  wasn't on the list). Add it to §10 with the counter.

Do NOT update the principles to lower the bar. If a reference
page can't hit the current bar, fix the reference page; don't
lower the bar.

## Don't

- Don't add utility classes, Tailwind, or any framework to the
  reference pages. The proof is plain HTML/CSS/JS by design.
- Don't add JS-driven motion. No `IntersectionObserver` reveal
  animations, no parallax, no marquees. The motion grammar in
  `PRINCIPLES.md` §1 forbids it.
- Don't fork the brand-wide design language into this repo. The
  wiki is the floor. This is the ceiling. They link, they don't
  duplicate.
- Don't push to `main` without operator review of the rendered
  page in a real browser. The brand-wide design language has a
  standing rule: no customer-facing change ships on a static
  read-through; it ships after a real browser load.
