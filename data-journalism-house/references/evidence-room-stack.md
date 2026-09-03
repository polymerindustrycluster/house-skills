# PIC Evidence Room house stack (polymerindustrycluster/evidence-room)

Read this when building or revising a page in the evidence-room repo. Editorial law in
the main skill always applies; this file is the implementation adapter.

**Resolution order where the house's CURRENT primitives fall short of editorial law**
(they do, in known places — that's the debts list): editorial law sets the TARGET; the
stack is the FLOOR. New/revised pages meet the law by extending page-local code (the
funding-map precedent: bespoke app.js), not by waiving the law — and not by forking the
shared core casually. Specifics:
- **Mobile**: the shared fixed-width + sideways-scroll fallback is overridden per-form
  on any page you touch (chart-craft § mobile).
- **Lookup/selectors**: build page-local (a county selector uses public geography — this
  does not touch the "no member/personal data" rule, which is about people and firms'
  private records); claims describe the default state.
- **Maps, scrolly, uncertainty bands**: no primitives exist — either budget the
  page-local build or steer the storyboard to forms the stack renders well; decide at
  storyboard time, not build time.
- **Register changes / pacing**: the band anatomy is the skeleton; register changes ride
  WITHIN it (a stat band, a photo band, a full-bleed chart band as a page-local
  `.feature` section) — the anatomy is not a license for uniform-density loops.
- **Typography**: the display-face decision is a site-level call for John, not a
  per-page improvisation; until made, work the hierarchy with the existing weights.
- **Full-bleed**: means the background band; content stays column-capped (the house hero
  already implements this correctly).

## Page anatomy (the house template — reproduced by `node tools/new.mjs <slug> "Title"`)

1. **MAST** — dark strip: org name, context span; PV.mark() injects the logo and
   PV.methodology() later stamps "Data as of {fetched}". Required slot, not chrome.
2. **HERO** — dark, radial-gradient: `.eyebrow` (measure + period) → `<h1>` (the finding
   as a sentence, key number in `<em>` for lime) → `.stand` (standfirst) → `#figs`
   hero-stat row via `PV.figures()` (2–4 cards, one `.key`). Hero is capped at --figure
   width (letting stats run wider than the headline caused a diagnosed "empty hero" bug).
3. **BAND** (repeat per finding) — light: `.takeaway` kicker → `<h2>` (takeaway title,
   never a label) → `.lede` → `.chart > svg` (`role=img` + `<title>`) → table-mount div
   (PV.tableView()) → `.src` caption or `.note` callout. `.legend` between chart and
   table when needed. NEW OR REVISED PAGES resolve the figure-chrome debt forward: give
   each chart its own compact title/subtitle/source block adjacent to the SVG (the
   chart-craft.md rule), letting the H2 do section work rather than double as the chart
   title. Hero stat row: aim for 3–4 cards that never wrap (PV.figures() accepts 2–4;
   cut to 3 before letting 4 wrap).
4. **CLOSER** — dark mirror of the hero: one big takeaway sentence + `.sub` (via
   `#closersub`). Resolves, restates-with-caveat; never identical to the H1.
5. **GENERATED** — DOM-injected by the shared script, never authored: `.pv-footprint`
   banner directly below the mast (county-scoped pages), and the mandatory `.pv-method`
   "How we did this" (PV.methodology(), from data meta + claims.json + SOURCES.json),
   which `insertBefore(sec, closer)` places BETWEEN the last band and the CLOSER —
   i.e., the canonical order story → methodology → closer → footer (verified at
   picviz.js:456).

Load order is fixed: `../_shared/picviz.js` then `app.js`. NOTE: nothing enforces this
anatomy programmatically — the columns/centres gates hardcode these class names, so a
page that renames sections silently stops being auditable. Keep the names.

## picviz.js — what exists (recipes, not components)

There is NO PV.barChart()/PV.lineChart(). Every chart is assembled from primitives
(~50–150 lines of bespoke SVG per chart): `el`/`txt` factories (inline-style fill/stroke
by design — don't fight it), `ticks()` (numeric domains only), `PV.frame()` (single
numeric-y axis chrome), `PV.chart()` (one svg, computed viewBox; throws on conflicting
rows+H), `PV.hoverable/showTip/tableView` (pointer + keyboard parity; tooltips enhance,
never gate), `PV.figures()`, `PV.methodology()`, `PV.footprint()`, `PV.data()` (dual-mode
loader — NOTE: the WHERE map for shared files lives inside picviz.js and must be edited
by hand for any new cross-page data file; this has caused silent 404s before),
`PV.padGrid()`. Best worked example to imitate: `cost-scissors/app.js` (ranked ladder
bars; rebased multi-line whose end-label de-collision is a hand-rolled nudge loop INSIDE
that file — a recipe to copy, not a primitive to call; derived spread line with shaded
area + peak callout).

**Known code smells to avoid repeating** (all shipped bugs, caught in audit):
- `.slice(0, 30)` label truncation → hand-shorten labels instead.
- Annotation drawn before bars → occluded text; draw annotations last.
- Reading `D.meta.X` when the field is top-level → "undefined dollars" in a hero.
- Per-group bar scaling in card fallbacks → $25K renders same as $11M; scale globally.
- `y = index mod 9` dot lattices → encodes nothing; use histogram/beeswarm.
- CSS specificity: `.closer .wrap > p` display-scales ANY bare `<p>` in the closer —
  class every non-headline closer paragraph (`.sub`, `.src`).
- `PV.tableView()` RETURNS a string; it does not inject. Assign it:
  `document.getElementById(id).innerHTML = tableView(...)` — three silent empty tables
  shipped a first render before this was noticed.
- Typed y-domains clip real data (a `hi = 106` cut off a 111.4 peak). Derive lo/hi from
  the series, always.
- The shared mobile fallback stretches `.chart svg` to `min-width:900px` with a
  scroll-sideways hint. A page whose app.js re-lays out from container width must
  override BOTH: `.chart svg{min-width:0!important;width:100%}` and
  `.chart::before,.chart::after{display:none!important;content:none!important}` —
  the proven pair, shipped on sources and patents.
- A green suite must POSTDATE the last edit. The suite bundles first, so editing anything
  while it runs produces a pass that tested a superseded tree; kill and re-run rather
  than reasoning about which gates saw what (this bit the same session twice).

## What does NOT exist (build carefully or propose adding to _shared)

- **Scrollytelling** — no step engine; nearest infra: existing `prefers-reduced-motion`
  hooks. If needed: IntersectionObserver + sticky stage, degrade to stacked bands.
- **Annotation primitive** — callouts/leader lines are hand-coded; collide.mjs DETECTS
  overlap after the fact (mark deliberate plates with `data-pv-plated`).
- **Small multiples** — chart() is single-panel; N calls with manually-synced domains.
- **Maps** — none (funding-map is a Sankey, and a legacy pre-_shared page). A county
  choropleth needs inline path data (no external tiles — bundles must be self-contained).
- **Uncertainty bands** — hand-rolled closed `<path>` only; no ribbon/whisker primitive.
- **Interaction beyond hover** — no filter/toggle/linked-highlight primitives; funding-map
  has bespoke hash-routing never generalized. Claims describe the DEFAULT state.
- **Dark mode** — pic-viz.css is light-only by design (`color-scheme: light`).
- **Fonts** — --sans lists Lato but nothing loads it; the site actually renders system
  fonts unless a page adds loading. Decide deliberately.

## Mobile

The current shared-core strategy is fixed-width SVG + sideways-scroll hint below 760px.
The audit found this hides the evidence on phones — per-chart re-layout (chart-craft.md
§ mobile) overrides this default for new/revised pages: labels above bars, compact
slope lists, aggregated series, subject-in-first-paint scatters. Reserve the scroll
container for true tables/matrices.

## The gates (the suite is twenty; run it whole)

```
node tools/all.mjs            # THE command: all 20 gates, ordered cheap-first, one verdict
```

One command, one exit code; `--fast` skips the two width sweeps and says so. The twenty,
in suite order: bundle, verify, columns, centres, disclosure, style, coldopen, figures,
provenance, alttext, fonts, classes, legends, measure, claims, series, consistency,
collide --sweep, textsize --sweep, selftest.

- **measure** — running prose holds the 678px measure; deliberate registers live in
  `_data/measure-whitelist.json`, a human-adjudicated ratchet. Exists because --measure
  (72% of the figure) COMPOUNDS UNDER NESTING: the browser flattens the inner var at
  :root and each element re-resolves the leftover 100% against its own container, so a
  measure-capped box inside a measure-capped box renders at 0.72 squared. Pin resolved
  values (--measure:678px) on container boundaries; pinning the INNER variable
  downstream is inert.
- **style** also enforces the glyph laws: negatives print the TRUE MINUS (U+2212), never
  JS's default hyphen (apply at the formatter/primitive, not per call site); multiplication
  is x-the-sign (1.2×), never x-the-letter; verbatim spans stay ASCII.

Four added 2026-08-31, each from a defect every earlier gate passed:
- **fonts** — every family a stylesheet NAMES is shipped (@font-face + file on disk +
  not gitignored). The sheet named Lato with zero @font-face; readers without it got
  fallback metrics and no true 900. Gates measure the runner's browser, which had Lato.
- **classes** — every class a page USES resolves to a rule the site DEFINES. .fig-title
  appeared 57 times across 17 pages and was defined in one page-local stylesheet; every
  chart title but that page's rendered as body text. A styled-by-nothing <p> passes
  every geometry gate, because it is a perfectly valid <p>.
- **legends** — key-before-data, static DOM-order check (see chart-craft.md).
- **series** — the dataset resembles the world: duplicated-year detection (the IPEDS
  mirror republishing 2019 as 2020) and undeclared holes vs declared suppressions.
The ones newer than the older 7-gate list this file used to carry:

- **disclosure** — every page carries the same AI-authorship line and its licence credits.
- **style** — house style law over rendered prose (em-dashes, straight quotes, bans);
  verbatim spans (`pre`, `.code`) are exempt because pasteable JSON needs straight quotes.
- **coldopen** — evidence in the first screen, as a RATCHET (`_data/coldopen.json`): a
  page may only improve its recorded debt. When a hero edit pushes the first chart past
  the ceiling, tighten the prose — never move the ceiling.
- **figures** — the cross-page figure registry (`_data/FIGURES.json`). Register any
  quantity two pages both print; it exists because two pages published the same median as
  1.21× and 1.24× on undisclosed different bases and nothing noticed.
- **provenance** — the registry matches the page, not only the page the registry: every
  source a page claims in `by_artifact` must leave fingerprints in that page's own data.
  Two phantom sources shipped before this existed.
- **alttext** — every chart carries an accessible description. It CANNOT check the
  description's truth (that is a claim's job — see `fed-years-over-award` for the
  pattern); it catches absence and structural impossibility only, and says so in its
  header.
- **selftest** — injects each gate's own motivating defect and requires the gate to fail.
  Extend it whenever you narrow a rule or add a gate.

`columns`/`centres` still are not in CI — run locally always.

Diagnostics (no exit codes — for eyes/vision models; running them IS the render-and-look
step): `tools/shots.mjs [--mobile] [--tables]`, `tools/crop.mjs <name> <sel>`,
`tools/textsize.mjs [--mobile]` (12px rendered floor), `tools/widthsweep.mjs`,
`tools/edges.mjs`/`inkfit.mjs` (never run `inkfit-apply.mjs` unattended — it regex-mutates
app.js). METHODS-SOP §8's documented blind spot: a shape-only claim assertion can pass
while the prose is wrong by half — gates are the floor, not the verdict.

## Data pipeline pattern

`_data/build/fetch_X.py` (named public API; asserts downstream completeness at fetch
time; keys from the environment; writes source/definition/caution/fetched into the JSON meta) →
`derive_Y.py` (page-shaped JSON; generate, never hand-type, anything checkable) →
`claims.json` (hand-written falsifiable assertions with real `falsified_if`; a claim's
tolerance must be tight enough to guard the sentence beside it — see the §8 incident) →
verify scripts. Raw fetched data is not committed; derived data/*.json is.

## Editorial contracts (METHODS-SOP / CONTRIBUTING, abridged)

- PIC-12 vs NEO-14 footprints never mixed in one figure; footprint banner on
  county-scoped pages (below the hero, one line — not vault-registry prose above it).
- Measurement register 3252+3255+326; NAICS 325 is context, not cluster.
- A withheld cell is never a zero; "zero is a judgment" — confirm a real zero by hand.
- Every published sentence has a claims.json guard; `verify:"manual"` is a debt.
- Corrections dated and append-only; no silent edits; keep READMEs and hub cards in
  sync with corrected pages.
- No member/applicant/personal data (public repo, permanent history).

## Friction found in live use (2026-08 wages rebuild — budget for these)

- **Mobile re-layout requires knifing shared CSS**: pic-viz.css enforces the
  sideways-scroll fallback (`.chart svg{min-width:860px}` + `::after` hint) with no
  opt-out; a compliant per-form re-layout needs page-local specificity overrides until a
  sanctioned `.chart.reflow` escape is added to the core.
- **The hero used to break the one-rail law** (fixed 2026-08-27 in _shared/pic-viz.css):
  `.hero .wrap > *` set figure width at specificity (0,2,0), silently beating any
  `.hero h1`/`.eyebrow` override at (0,1,1) — h1/kicker sat on the wide rail while the
  standfirst centered on the measure rail. Overrides of that blanket rule must use
  `.hero .wrap > h1`-shaped selectors to win. columns.mjs's EXPECT table pins
  `.hero h1` to "measure" — keep it that way.
- **verify_consistency footprint regex false-positives on hyphenated compounds**: "51
  county-industry pairings" reads as "51 counties" and errors — phrase as
  "industry-county pairings".
- **centres.mjs takes a WEBROOT and appends /dist itself**: run `node tools/centres.mjs .`,
  not `... dist`.
- **claims ENV has no med()/quantile()**: medians become repeated nested-lambda
  expressions, and JS vs Python quantile methods can disagree — avoid printing IQR
  numbers as claims, or add `med` to the harness ENV first.
- **ticks() will round-lie**: it yields 0.25 steps while pages hand-roll `toFixed(1)`,
  printing 1.25 as "1.3×". Rule: tick labels never round-lie — format to the tick's real
  precision.
- **PV.chart's rows×rowH guard can't express stacked mobile rows** (label line + mark
  line + annotation inserts) — expect manual H + a y-cursor for mobile variants.
- **PV.methodology() meta-key sets are fixed in picviz.js**: a page-specific limitation
  can't join the generated box without editing the shared core — carry it in a claim's
  text, the figure source line, and the README instead.
- **Interactive verdict sentences**: use the template + ingredient-claims pattern — guard
  the default sentence and each data ingredient; per-variant sentences stay unguarded by
  design (claims cover the default state).

## Gate blind spots measured in the 12-page rebuild (2026-08)

Cite these whenever you report a gate as passing:
- **collide.mjs is desktop-only and `.chart svg`-only.** It reported "no collisions" on a
  page carrying two visible text collisions at 375px, and it cannot see legacy pages
  whose figures live outside `.chart` (funding-map's `.viz`, timeline's containers).
  Verify collisions by reading mobile crops, not by citing the gate.
- **collide's axis heuristic** treats any flat mark under 3px tall as an axis, so a
  horizontal leader line reads as "bar crosses the axis." Route leaders around it or
  expect a false positive.
- **columns/centres measure widths and centre axes, never left edges.** Both passed
  clean on a hero sitting on three different left rails. The one-rail check is a human
  or vision-model read of a 1:1 crop.
- **verify.mjs counts SVG text bounding boxes toward page overflow** even when the glyphs
  are visually clipped by the SVG, so an annotation anchored near the right edge can
  fail the gate while looking correct; and `textsize --mobile` did NOT pass at HEAD on
  every page, so "the baseline was green" is an assumption worth testing before you
  inherit blame for a failure.
- **crop.mjs errors on some pages** ("clipped area is empty"); fall back to
  `magick <shot> -crop WxH+X+Y +repage` against the full-page screenshot.
- **ticks() will emit 0.25 steps** while pages format with `toFixed(1)`, printing 1.25 as
  "1.3×" — a rounding lie on the axis. Format to the tick's real precision.
- **getComputedTextLength() returns 0 on a detached SVG**, so shrink-to-fit logic must run
  after the node is in the document.

## Known design-system debts (from the art-direction audit — fix opportunistically)

Flat 56px band rhythm and no register changes; caveat ink at story weight (budget it per
page-design.md); Lato-only binary hierarchy (display face decision pending); lime never
encodes data; the categorical trio changes meaning page-to-page (adopt the one-accent-
one-job rule); legacy pages (funding-map, timeline) on the old visual language; tables at
archive scale (cap 12 rows + disclosure + CSV); charts lack their own title/source chrome
(add per-figure header blocks); index closer glossary display-scale bug pattern.
