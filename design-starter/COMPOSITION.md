# Slide composition law — the craft layer

Battle-tested on a 60-slide deck rebuild in 2026, where slides that satisfied
every density rule still failed as "floating cards in dead whitespace."
Brand tokens, colors, and type come from the organization's own brand pack
(see `tokens.schema.md`) and brand card (`BRAND-CARD.template.md`); the seven
slide types in `SLIDE-TYPES.md` are the sanctioned vocabulary. THIS file is
the grammar: how any slide must own its canvas. The density ceilings (don't
be busy) and the canvas-fill floor (don't be empty) apply together — passing
one without the other is still a failure.

Every rule below refers to a token **role**, not a literal color value. Bind
each role to the organization's actual tokens when this law is adopted; do
not hardcode a hex anywhere in this file or in the generated slides.

## The first-glance contract (every presented slide)

Within 3 seconds from the back of a room: (1) ONE assertion — the headline is
a sentence with a verb, never a topic label; (2) ONE dominant element carrying
≥2× the visual weight of anything else; (3) orientation (section label + page
number in footer chrome).

## Density ceilings (anti-busy)

- ≤5 numerals on a presented slide; a numeral appears once per slide; money
  figures ≤3 per slide.
- Max 4 bullets, ≤12 words each. Card grids: ≤3 text cards unless cards are
  column-blocked panels; >25 words per card means fewer cards or an appendix.
- One accent color per slide (the full categorical palette appears together
  only where it encodes a real system — a legend, a status set — never as
  decoration).
- Any table, matrix, or directory of >5 co-equal items is a LEAVE-BEHIND: tag
  it APPENDIX, put it after the closer, and represent it in the talk track by
  a hero-stat stand-in ("full detail in the appendix").

## Canvas-fill floor (anti-empty)

Every presented slide satisfies ONE of:

- **FILL** — the layout stretches to occupy the content zone: full-height
  column blocking, edge-to-edge bands, grids that stretch, type scaled up to
  absorb slack.
- **COMMIT** — whitespace concentrated deliberately on ONE side of an
  asymmetric composition (dense column + open field carrying a brand motif or
  a bleeding image).

Auto-fail: >35% contiguous empty canvas with no compositional role; any card
>35% empty inside; orphan captions dangling in voids; symmetric dead bands
above AND below a floating middle cluster (the #1 "generated, not made"
tell).

## Dominance & scale

- The dominant element occupies ≥40% of the content zone OR is typeset
  ≥120px (hero numerals 140-220px). Dominance is visible, not inferred.
- Every card leads with ONE big thing (28-40px keyword, 48-72px numeral, a
  real-size logo) over small supporting text. All-16px cards are banned.
- Process steps ARE the slide — full-height columns with large step numerals,
  never a thin strip floating mid-canvas.

## Color blocking & bleed

- Use the dark-surface token for pacing: dividers, stakes/quote masters, the
  closer, and roughly 1 in 4 content slides. A white-canvas monoculture reads
  as unfinished.
- Walls, bands, strips, and hero images run edge-to-edge. Bordered boxes are
  for true cards only — never for the slide's primary content (a logo wall in
  a box is a failure; the wall IS the slide).
- Check text-on-fill contrast against the brand pack's own gates before
  shipping. A common trap: a primary brand accent that reads as AA-safe at a
  glance can still fail behind white text at the sizes slides actually use —
  that's what the pack's contrast gate exists to catch. Where the pack splits
  a "surface" role from a separate "white-text-safe action" role, use the
  action role for filled controls and chips, not the surface role. Muted or
  secondary text uses the ink scale's designated text-safe stop, never a
  lighter gray picked by eye.

## Charts on slides

Two rules a companion web or document surface may enforce by automated gate;
slides must carry them by hand:

- **No chart ships naked.** The figure's takeaway is drawn ON the figure (a
  claim sentence as the chart title), not only in the headline or the talk
  track. A slide headline and a chart title are two different sentences doing
  two different jobs: the headline is the slide's assertion, the chart title
  is what this figure shows. Keep them in the same helper or template so they
  can't drift apart — a chart title that only exists as a copy-pasted string
  in each deck will disagree with itself by the third deck.
- **Apparatus budget per figure: one source line, at most one limitation
  sentence.** Everything else (definitions, vintages, a second and third
  caveat) goes to an appendix slide or the speaker notes. A slide has less
  room than a page — if a comparable web budget runs around 45 visible words,
  a slide's budget is tighter still. Never satisfy the budget by deleting a
  limitation. Move it, do not lose it.

## Review protocol (non-negotiable)

1. Build → render → **VIEW every slide you touched** with hostile eyes. A
   checklist grep is not a design review. Look at *what rendered*, not at
   what the code says it renders. A rendered page has failed silently before
   — an entire lede, including a correction that mattered, rendered as
   nothing because one variable was out of scope and the generating script
   threw silently. Reading the source would have called it fixed; loading the
   page showed the blank. If a block can be empty, confirm it is not.
2. Self-score each slide 1-5 on dominance / fill / hierarchy; any score below
   3 gets revised before proceeding.
3. Adversarial pass before shipping: a second set of eyes (a vision-capable
   model or a human who did not build the slide) judges the renders against
   this file. Gestalt lens: balance (visual-weight distribution), whitespace
   (active vs. leftover), rhythm (consistent spacing intervals).
