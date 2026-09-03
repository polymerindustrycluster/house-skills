# Page design: composition, pacing, typography, and why pages "flow"

Grounded in measured deconstruction of Pudding / Reuters Graphics / OWID / 538 pages
(numbers measured at a 1280px viewport) and an art-direction audit of a real house site.

## Why a page flows (or doesn't)

Flow is produced by **rhythm, hierarchy of ink, and occasion** — not by width discipline
alone. The anti-pattern: every section runs the identical template (eyebrow → H2 → lede →
chart → table toggle → dense caveat) at identical density with identical spacing, so the
eye learns the loop by section two and starts skimming. A page that is one dark slab, five
thousand pixels of uniform cream, and another dark slab cannot flow, no matter how good
each chart is. Flow is a wave: prose, visual, breath, register change, repeat.

Throughout this file, "viewport" = ~900px of vertical scroll at the 1280px desktop
reference width. Pacing numbers are DIAGNOSTICS calibrated from measured exemplars; the
enforceable rule in each case is named alongside.

## Act structure and pacing rules

1. **Three acts.** ACT I = hero + lead figure; ACT II = supporting bands; ACT III =
   methodology, then closer, then footer (the canonical end-order across this skill:
   story → methodology → closer → footer — the reader's last story impression is
   editorial, not apparatus). **Cold open: a chart is visible in the FIRST SCREEN** —
   not merely begun within ~1,000px, but present in the opening ~900px viewport, even if
   only its top third shows. The exemplars open on a graphic; a first screen made of
   masthead, headline, standfirst and a stat block is the anatomy of an annual report or
   a SaaS dashboard, and outside art directors call it instantly ("the numbers are doing
   jazz hands because the graphic is missing").

   **Budget the DISTANCE TO THE FIRST CHART, not the hero's height, and measure it.** An
   audited site with this rule written down put fifteen of sixteen first charts below the
   fold, median 1,668px, because nothing checked. The number that matters is where the
   first chart starts; a taller hero is fine if the chart is inside it.

   **The stat block is not the thing to cut, and this reference used to say it was.**
   Moving it below the lead figure was tried on a real page and made the first screen
   worse: it removed the only concrete numbers a reader had and left a headline, a
   standfirst and an interactive control. Stat cards ARE evidence; they are simply not
   drawn. The trade that works is to put a purpose-built compact chart between the
   standfirst and the stat block, so the hero gains a graphic instead of losing its
   numbers. That chart is deliberately a POORER view than the lead figure below it —
   fewer dimensions, one idea, readable from its own labels — because its job is to show
   the shape and hand the reader on, not to pre-empt the analysis.

   Where a piece genuinely cannot open on a chart (a photo-led essay,
   a participatory elicitation), the opening visual is still a VISUAL, never a KPI row;
   gets the page's biggest stage — the finding chart is not the same size as the fourth
   supporting chart.
2. **Prose/visual cadence:** never more than 2–5 paragraphs (≤1 viewport of text) before
   a visual unit — chart plus its title/subtitle/source chrome — occupying roughly half
   a viewport or more.
3. **Register changes** — the enforceable rule: no more than two consecutive bands with
   the same template (a deliberate stepped sequence, rule 4, counts as ONE register —
   declare it). The calibration: exemplars change register every 3–5 viewports, via a
   full-width tinted stat band (the key number set 1.5–2× body size on contrasting
   ground), a pull-quote finding, a photo/artifact band, a full-bleed chart moment, or a
   small-multiples grid. Key numbers get a register change, not a paragraph.
4. **Repetition-with-escalation** is the strongest pacing template: repeat one beat
   layout verbatim while a single variable steps (week → year → lifetime; age cohort by
   cohort). Build the beat once, iterate ≥3 times; the run is one register.
5. **Art-directed moments are register-conditioned**: newsroom register 0–1 bespoke
   moments per page (an element type used on no other page — check the site inventory
   where available); essay register carries as many as the craft budget affords (the
   whole piece may be art-directed). What is banned is the middle: scattered one-off
   decoration that is neither identity nor argument.
6. **Band separation is visible**: alternate band backgrounds (paper / paper-alt tint);
   hairline rules live *within* bands, never as the only separator between them.
7. **Page length is free if the cadence holds** — 8-viewport and 69-viewport exemplars
   both flow. Constrain density cadence and explanation completeness, not word count.

## The column system

- **Body measure 540–660px at 1280 (~60–70ch); never wider than ~52% of viewport.** The
  column is the spine; every other width is defined relative to it.
- **ONE TEXT RAIL — the alignment law.** Every text block shares the measure column's
  edges on one axis: kicker, headline, standfirst, section headers, ledes, notes, source
  lines, closer. The reading eye tracks LEFT edges, not center axes — a page whose hero
  headline sits at one width while its standfirst sits at another reads as misaligned
  even when every block is mathematically centered, and the failure is worst at the
  hero, the page's most-viewed pixels. Headlines WRAP on the text column (exemplars run
  40–51px display type on a ~660px column, 3–4 lines); widening the headline box to
  "avoid a tower" buys a second rail and a hole of whitespace beside the type. Only
  non-text units — charts, tables, stat rows, media — leave the rail, and they break out
  symmetrically to the quantized figure widths, which reads as deliberate. Lint: at any
  desktop width, the set of distinct text left-edges on a page is exactly one.
- **Centred layouts and the rail only agree when text blocks share ONE width.** If the
  page centres each block on a shared axis (a common house pattern), then narrowing any
  text block moves its left edge inward and creates a new rail. So never "tune" a
  standfirst or note to a tighter measure inside a centred system: change the shared
  measure or change nothing. Corollary: a stat row, byline block, or kicker set at a
  different width than the prose is a second rail, however symmetric it looks — put
  small multi-item blocks (2–4 stat cards) in a GRID capped at the text measure rather
  than a wide flex row.
- **A headline will render narrower than its dek, and that is correct.** Display type
  wraps after a few words, so a 46px hed fills less of the same box than a 19px
  standfirst. Both still start on the rail. Fix ragged headlines editorially (write to
  fill the lines) or with balanced wrapping — never by changing either block's width.
- **Charts never render narrower than the text column.** Breakouts are **quantized**:
  define exactly two breakout widths — ~1.2× and ~1.8× the column — and use only those.
  Full-bleed (100vw) is reserved for the hero plus 1–3 peak moments per page — and
  "full-bleed" means the BACKGROUND band runs edge to edge; the content inside stays on
  the column system (the house hero's figure-capped content on a full-width dark band is
  the correct implementation, not a violation).
- Column placement is a voice parameter: centered (immersive story) vs left-set with a
  wide right margin or rail (document/reference).
- Lead figure ≥ 420px tall at desktop; supporting figures 260–380px; nothing under
  220px except sparklines in stat rows.

## Typography

- **Exactly two typefaces with role separation**: a display/voice face for H1, H2,
  pull-quotes, and big numbers; a workhorse (usually sans) for body, UI, captions, chart
  labels. Serif body reads editorial-authoritative; sans body reads modern-analytic —
  both appear at top tier; choose per voice. One-face monocultures with hierarchy from
  weight alone read as dashboard, not publication.
- **Body 16–18px, line-height 1.5–1.7.** Bigger (20–24px) only as a whole-page voice
  decision, never per-section.
- **Type scale in roughly 1.4× steps**: body 16–18 → H3/chart-title 24–28 → H2 32–37 →
  H1 40–54 → display stat 72+. Avoid intermediate one-off sizes. Captions/sources/axis
  labels 12–14px. Expressive pages may overshoot H1 to 2.5–3× but keep the ladder shape.
- **Headline stack is fixed**: kicker (small caps, ≤45 chars, one line on mobile) →
  headline (≤3 rendered lines at 1280) → dek (1–2 sentences) → byline/date.
- **Bold budget: ≤1 bold phrase per paragraph, ≤3 per section.** Emphasis spent
  everywhere is emphasis spent nowhere. Display-size type is banned outside headings and
  stat moments (a glossary set at heading scale is a rendering bug even when the CSS
  says otherwise). No 900-weight full-length paragraphs.
- Hero lede ≤ 4 lines (~70 words), max ONE bold phrase; overflow moves into the first
  band.
- `tabular-nums` on all numerals.

## Spacing

- Adopt a spacing scale (8 / 16 / 24 / 40 / 64 / 96 / 128) and snap every margin to it.
- Standard band padding 64px top/bottom; act boundaries 96–128px; hero → first band 96px.
  A single flat padding value everywhere is metronomic; the act boundaries carry the
  larger steps.
- Section headers bind to what follows: ~2× the top margin over bottom margin.

## Color system

- Page ground may be tinted (pale blue, grey, warm cream), but **data sits on quiet
  ground**: charts and narration cards on white/near-white surfaces.
- One accent = one semantic job PER PAGE, with the mapping held stable across the site
  wherever the same series recur (chart-craft.md states the same rule): the
  story/subject hue never changes meaning within a scroll; gray = context/peers; a
  second accent = counter-subject or below-threshold; annotation ink gets its own
  reserved hue. A signature brand color that never encodes data (chrome only) is a
  wasted asset OR a deliberate choice — decide, and be consistent.
- Multi-hue needs (lanes, categories >3) declare a page-local palette with a legend and
  may not reuse the story colors with new meanings.
- **One design generation.** Legacy pages get migrated to the current tokens; two
  coexisting visual languages make the site feel like different publications. Promote a
  legacy page's good ideas into the shared system first, then migrate it.

## Figure chrome (chart as self-contained unit)

Every chart ships as a unit: claim-style title (24px, sentence case) → optional
how-to-read subtitle stating units → the graphic → a 12–14px source/caption line directly
beneath. The figure never borrows the section H2 sitting 400px above. This makes figures
shareable, screenshot-safe, and legible out of order.

## Caveat ink discipline

The epistemic apparatus underwrites the findings; it must never compete with them.

- **Caveat budget per figure: ≤45 words visible** — one source line + at most one
  limitation sentence. The rest goes into the notes disclosure or the methodology box.
- **One callout `.note` box per page maximum (~80 words)** — reserved for the single
  "what this does and does not license" judgment.
- Methodology renders once, in the canonical position (after the final story beat,
  before the closer), compact or collapsed at caption scale. Collapsing the methods
  DETAIL does not violate the nothing-load-bearing-behind-a-click rule, because every
  inference-affecting caveat already appears visibly beside the chart it qualifies — the
  box is depth, not the disclosure. Boilerplate (corrections policy, AI disclosure)
  appears once per page in the footer pattern, not per section.
- These budgets govern APPARATUS ink (source lines, limitation notes). The caveat BEAT
  (Beat 6 — the strongest objection and your answer) is editorial narrative in body
  register and is not capped by them.
- Typeset caveats at true footnote scale, one weight — caption-gray prose with five bold
  interruptions after every chart makes a third of the scroll disclaimer, and the reader
  wades instead of gliding.

## Art, photography, and credits

Every image carries a sourcing path and a credit line: commissioned, licensed, archival
(check the license, not just availability), public-domain, or own-photography — the last
two are the no-budget path. No unlicensed grabs, ever. The byline block is genre
furniture the provenance sentence does not replace: "By X · Analysis Y · Graphics Z ·
Additional reporting W" (collapse roles one person holds).

## Hero, closer, footer

- Hero: kicker → finding-headline (key number emphasized once) → standfirst → 3–4 stat
  cards that never wrap (cut to 3 if 4 don't fit; exactly one carries the accent). Stat
  cards show FINDINGS (substantive numbers), with at most one apparatus stat as a trust
  signature.
- Closer ≤ 90 words: one memorable statement (≤2 lines at display size) that RESOLVES
  the hero's question with its caveat attached — deliberately not identical to the H1 —
  plus one qualifying sub-paragraph. Nothing after it except the footer; a page whose
  visual rhythm ends on 2,000px of reference matter ends on the wrong note.
- Footer: three-stage stack — related-stories grid (3–4 up) → support/subscribe or
  contact CTA → org identity — on a distinct background so the story visibly ends.

## Voice parameters (choose per outlet/piece, then hold)

These are stylistic axes where exemplars legitimately diverge — parameters, not rules:

- **Register**: `newsroom` (white ground, restrained palette, photography, quiet type)
  vs `essay` (tinted ground, custom display lettering, illustration, personality
  marginalia). Everything else correlates with this choice.
- **Body face**: serif (authoritative) vs sans (analytic).
- **Column placement**: centered vs left-set + rail.
- **Hero face**: full-bleed photo + overlaid headline vs illustrated title art vs plain
  typographic masthead.
- **Chart medium**: SVG charts, styled photographs-as-quantities, or hand-drawn/collage
  artifacts — the "chart" slot accepts all three.
- **Marginalia/personality layer** (mascot notes, hand-drawn arrows): opt-in garnish,
  ~1 per 2 viewports when on; zero in newsroom register.
- **Interactivity depth**: embedded chart apps vs light highlight toggles vs none —
  static pages lose surprisingly little when composition carries the pacing.
