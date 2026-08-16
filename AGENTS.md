# AGENTS.md

This file is for AI agents working inside the `design-level-up` repo.
Read it before touching anything.

## What this repo is

A private work-in-progress. Two artifacts:

- **`PRINCIPLES.md`** — the canonical reference for design depth. The
  source of truth for the principles. Every other file in this repo
  defers to it.
- **`reference/`** — one or more full HTML/CSS/JS reference pages that
  prove the principles. The first is Yard & Larder, a fictional general
  store in Bardstown, Kentucky.

## What this repo is NOT

- Not a starter template. Don't fork it; don't generate a new tenant
  from it. It's a reference, not a blueprint.
- Not a replacement for the brand-wide design language in the wiki.
  The wiki is the floor (`wiki/clusters/cross-cluster/concepts/design-language/`).
  This is the ceiling. They layer.
- Not framework-specific. The principles are framework-agnostic. The
  reference proof is intentionally framework-free (plain HTML/CSS/JS,
  no build step). If you add a new reference page, follow the same
  convention unless there's a strong reason not to.

## Conventions

- **Markdown style.** Match the wiki voice: declarative, evidence-driven,
  with explicit adopt / consider / reject markers. No marketing copy.
  No "in this article we will..." openers.
- **HTML structure.** Semantic. Headings nest correctly. `<address>` for
  addresses, `<dl>` for term/value pairs, `<article>` for self-contained
  pieces, `<aside>` for tangential content. ARIA only when the semantic
  markup doesn't carry the meaning.
- **CSS architecture.** Tokens at the top of `styles.css` (palette,
  type, scale, spacing, geometry). Sections numbered in comments. No
  utility classes — components, not utilities.
- **JS.** Minimal. State only, no motion. The motion grammar in
  `PRINCIPLES.md` §1 and the no-reveal-on-scroll decision forbid
  JS-driven motion. Any new JS must be functional, not decorative.

## The Specificity Test (PRINCIPLES.md §8)

Before any new design work ships — a new reference page, a new pattern
demonstration, a new section added to an existing page — run the
eight-point Specificity Test. The test is the bar.

A passing design hits at least six of eight. An A+ design hits all eight.

## Adding a new reference page

When a new reference is needed (a new vertical, a new pattern):

1. Create `reference/<vertical>-<name>/`.
2. Inside, the same three files: `index.html`, `styles.css`, `script.js`.
3. Open with a paragraph in the index that names the vertical and why
   the principles need a proof in that vertical.
4. Add a row to the "Status" section of `README.md` with a one-line
   description and the date.
5. Commit on a `feature/<vertical>-reference` branch. Merge to `main`
   after the operator has reviewed the page in a real browser at
   desktop and mobile widths.

Don't copy-paste the Yard & Larder code into a new reference. Read
the principles, design the new page against the principles, write
fresh code. The point of multiple references is to show the
principles can be hit by different designers, in different verticals,
not to show that the same code can be reused.

## When to update PRINCIPLES.md

Update the principles when:

- A new depth move is added (a new principle section). Pair it with
  a reference page that proves the move.
- An existing principle proves wrong. Supersede it with a new
  section that explains the change. Do not silently edit.
- A new anti-pattern is observed (something AI defaults to that
  wasn't on the list). Add it to §10 with the counter.

Do NOT update the principles to lower the bar. If a reference page
can't hit the current bar, fix the reference page; don't lower the
bar.

## Don't

- Don't add utility classes, Tailwind, or any framework to the
  reference pages. The proof is plain HTML/CSS/JS by design.
- Don't add JS-driven motion. No `IntersectionObserver` reveal
  animations, no parallax, no marquees. The motion grammar in
  PRINCIPLES.md §1 forbids it.
- Don't fork the brand-wide design language into this repo. The
  wiki is the floor. This is the ceiling. They link, they don't
  duplicate.
- Don't push to `main` without operator review of the rendered
  page in a real browser. The brand-wide design language has a
  standing rule: no customer-facing change ships on a static
  read-through; it ships after a real browser load.
