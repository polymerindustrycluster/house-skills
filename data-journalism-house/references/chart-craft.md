# Chart craft: selection, annotation, color, uncertainty, tables, mobile

## Chart selection by relationship (after the FT Visual Vocabulary)

Before drawing any chart, write one sentence: "This chart shows the **[RELATIONSHIP]**
of [MEASURE] across [DIMENSION]" — then choose from that relationship's forms. (Some
forms legitimately serve two relationships — a connected scatter is correlation AND
change; a dot strip is ranking AND distribution — so the row is a menu, not a cage; what
is banned is picking a form from an unrelated row because it looks good.)

| Relationship | First choice | Also good | Trap to avoid |
|---|---|---|---|
| CHANGE OVER TIME | Line (markers if irregular) | Column (1 series), slope (2–3 points), area (totals), calendar heatmap, fan chart (projections) | Area hides component change; >4 lines = spaghetti → gray context + story series, or small multiples |
| MAGNITUDE | Column/bar | Paired bar (≤2 series), proportional symbol, isotype (whole units, 1 icon = N stated) | Bar axis anchors at 0; never slice a pictogram for a decimal |
| RANKING | Ordered bar/column | Slope (rank change), lollipop, dot strip | Unordered categories bury the ranking; extremes of many scanned cells carry the winner's-curse warning |
| DISTRIBUTION | Histogram | Boxplot (many groups), beeswarm/dot strip, population pyramid, cumulative curve | Reporting only the mean. n ≤ ~20: show every point — summaries of tiny sets hide more than they compress |
| CORRELATION | Scatterplot | Bubble (3rd var — area encodes value; label key values, area is under-read), connected scatter (over time), XY heatmap | "Many readers will assume the relationships you show them to be causal" — disclaim or design around it |
| DEVIATION | Diverging bar | Diverging stacked bar (surveys), spine, surplus/deficit filled line | Unlabeled baseline = meaningless chart; label the reference by meaning |
| PART-TO-WHOLE | Stacked column/bar | Pie/donut (few segments only), treemap, waffle | Pies with many segments; if only size matters it's MAGNITUDE — use bars |
| SPATIAL | Choropleth — intensive/normalized variables only (rates, densities, medians, percentiles, index scores) | Proportional symbols (totals), dot density, flow map, cartogram | Raw counts/totals on a choropleth; geography used when it isn't the story; small-denominator rates dominate both tails — pool years, smooth, or suppress below a minimum denominator, and state the rule on the chart |
| FLOW | Sankey | Waterfall (sequenced additions/subtractions), chord, network | Flows too numerous to trace — aggregate first |

Tie-break: **the simplest form that preserves the structure the argument needs.** If a
chart needs a paragraph to explain how to read it and the relationship fits a simpler
row, downgrade. If a form's necessary caveat is "size does not mean importance," the
encoding is wrong — drop or repurpose the channel.

Two-dimensional theses need two-dimensional forms: if the lede says "a high rate on a
small base is a different problem from a high rate on a large one," the chart must encode
BOTH rate and base — a ranked bar list with the second variable as label text repeats the
flaw the prose apologizes for.

## Chart law (house rules; NYT-lineage where noted)

- **Color**: one hero accent for the series that matters; everything else gray context.
  Sequential data: monotonic-luminance ramps. Deviation/bipolar data: diverging ramps
  with a neutral midpoint and symmetric luminance to the ends. Never rainbow/jet.
  Categorical caps at ~7 hues.
- **One accent hue = one semantic job per page** — and keep the mapping stable across
  the site wherever the same series recur; a page may not reuse the site's story hue for
  a different job. Charts needing more hues declare a local palette in a legend and may
  not reuse the story colors with new meanings.
- Line first for time; bar second; never pie for composition with >4 slices; never dual
  y-axes; bar domains anchor at 0. More than 4 lines → gray-context emphasis or small
  multiples (same threshold everywhere).
- `tabular-nums` on all numeric labels.
- Unlike units never share a value axis — rebase/index each series (then title the chart
  with the FINDING; the rebasing rationale goes in the source line, not the H2).
- **Domains are chosen deliberately and documented**: bars anchor at 0; line/scatter
  domains are computed from the data or set to a defensible stated bound (a natural
  bound, a shared domain across small multiples or updates); assert the data fit the
  domain and handle overflow VISIBLY (an overshoot tick, a "past its base" tag) — never
  a silent clip, and never a bar that quietly disagrees with its own label.
- **Sorting is editorial and disclosed**: sort by a defensible, stated criterion that
  makes the section's claimed pattern legible (sorting 26 occupations by national median
  interleaves the two groups whose contrast is the headline; sorting within labeled
  groups makes the claim a visible shape). Say what the sort is; when a different
  defensible order would materially change the impression, offer it (table sort or a
  toggle).
- Bind every chart's DATA VALUES to a data file — never hand-type values into chart
  markup, so corrections propagate. (Label STRINGS are editorial text: hand-authored,
  hand-shortened — "resin mfg" — never machine-truncated mid-word; truncation is a build
  error.)

## Per-chart checklist (run for EVERY chart before it ships)

- [ ] TITLE is the takeaway as a plain-language sentence with a verb, ≤1 line; it could
      not sit unchanged on a chart showing the opposite result.
- [ ] SUBTITLE states measure, unit, population, period — required whenever the title
      does not already carry them.
- [ ] **DIRECTION, NOT FORMULA.** The how-to-read line says what higher, lower, right and
      left MEAN in the reader's own terms; it never just gives the arithmetic. "Horizontal:
      wage ÷ county all-industry average" is a formula, and it silently asks the reader to
      work out that right means better — most will not, and the ones who do will not trust
      the answer. Write the reading: "the further right, the more it out-pays other work in
      its own county." The formula belongs in the source line or the methodology box.
      Whenever a scale is a ratio, an index, a z-score, a rank, or any constructed unit,
      the axis title itself carries direction ("pays less than the county ← 1.0× → pays
      more"), and any reference line is labeled by what crossing it means. Test: a reader
      who has never met this measure can say what a dot in the top-right corner means,
      from the figure alone. Ratios and indices fail this test by default — they are the
      most common places a page becomes unreadable while every number in it is correct.
      Full rule set, including ranks, transformed scales, out-of-range values, glyph
      collisions, and where "first use" actually falls: writing.md's *Constructed units*.
- [ ] **The chart's claim is carried ON the chart** — by takeaway title, direct labels,
      or in-plot annotation. Add an in-plot annotation when the pattern is not
      self-evident from the titled form: default YES for lines, scatters, and
      distributions; default NO for ≤3-mark comparisons (the title is the annotation)
      and for small-multiple panels (the grid gets ONE shared annotation at most). The
      annotation layer is where the editing happens (the Cox doctrine): the same
      unemployment chart supports "31 months of job growth" or "above 8% for 43 months"
      depending on what you annotate.
- [ ] Series are directly labeled as the PRIMARY decoding; a legend exists only as
      redundant reinforcement, or where the form requires one (local multi-hue palettes,
      a hatched "withheld" key) — never as the sole key the eye must shuttle to.
- [ ] GLYPHS AND CONVENTIONS, ruled once (2026-08-31 sweep of the exemplars and our own
      17 pages — every dimension below had drifted where it was never explicitly ruled):
      negatives take the TRUE MINUS (U+2212) everywhere a reader sees them — prose, axis
      ticks, table cells; JS stringifies with a hyphen a third the width of the digits,
      so fix the FORMATTER or the shared primitive, never call sites one by one.
      Multiplication is 1.2× (the sign), never 1.2x. Numeric table columns set
      font-variant-numeric:tabular-nums. Axes may abbreviate (17k); running prose spells
      (17,000). Fragment chart titles take no terminal period; multi-sentence titles
      keep full punctuation; headline style is the house's own ruling (this house:
      declarative sentences WITH periods) — the rule is pick one and gate it, because
      16-of-17 agreeing silently is a ruling nobody can enforce.
- [ ] KEY BEFORE DATA: when a legend does exist, it renders ABOVE the plot, in reading
      order, left-aligned to the chart's own rail — never below it. A below-chart key
      makes the reader meet the data, fail to decode, scan down, and scan back. This is
      the exemplars' shared practice: NYT colors the category words directly above the
      graphic (or keys color in the running text — FT, Bloomberg, WSJ do the same);
      Datawrapper places the scatter color key above the plot by default, and
      Silver Bulletin ships Datawrapper; The Pudding keys color in the prose itself.
      Colored words in the standfirst or lede COUNT as the key and are often better
      than a swatch row. Found 2026-08-31: twelve charts across nine pages carried the
      key below the plot, consistently aligned and consistently backwards; no gate said
      otherwise because no rule stated it. tools/legends.mjs now does.
- [ ] Outliers/events discussed in the text are marked on the chart (labeled vertical
      line with date: "2022: gas triples").
- [ ] Reference lines labeled by meaning ("1.0× — the local average"), not just value.
- [ ] Claims of group contrast are drawn as group structure: bracket/shade the bands and
      annotate each band's summary.
- [ ] Bar axes anchor at 0; a truncated line-chart axis is deliberate and defended; a
      log scale is labeled as such with one reading aid ("each gridline = ×10").
- [ ] Maps follow the SPATIAL row: intensive variables only on choropleths; totals as
      proportional symbols; small-denominator rule stated on the chart.
- [ ] Uncertainty that affects the conclusion is drawn (see encodings below), not just
      footnoted.
- [ ] What's MISSING is visible when it matters: suppressed/withheld units get hatching
      or an annotated void ("Chicago, New York, Atlanta are somewhere on this plane; BLS
      won't say where"). A withheld cell is never a zero; a partial period is hatched or
      lightened with an on-chart tag.
- [ ] Numbers at argument precision; units repeated in labels/tooltips ("3.4%
      unemployed").
- [ ] ≤2 annotation font-hierarchy levels; title visually dominant.
- [ ] Tooltips (if any) contain only redundant detail; the piece works if no tooltip is
      ever opened.
- [ ] Key message legible with zero interaction and at 375px width.
- [ ] Accessibility: `role="img"` + a text alternative that carries the CLAIM ("chart
      showing gas prices fully retraced while product prices stayed at their peak"), not
      the form ("bar chart"); the data-table twin is the long description.
- [ ] Source line present: source + period + this figure's major exclusion (each figure
      is an independent reading context and carries its own).
- [ ] Chart carries its OWN title/subtitle/source block adjacent to the figure — it
      never borrows the section H2 sitting 400px above.
- [ ] The rendered figure passed the five perceptual tests (two-second, squint,
      grayscale, isolation, annotation-target) in review-gates.md's chart visual
      critique — a checklist pass is structure; those tests are whether it lands.

## Uncertainty encodings (and one distinction that must never blur)

**Dispersion across units and uncertainty about a summary are different quantities** —
they differ by roughly √n, and a shaded band behind a line reads as a confidence
interval whether you meant it or not.

- Claims resting on small movements of an estimated summary: draw the SAMPLING or
  REVISION interval of the summary (or first-print vs latest vintages). The spread of
  the underlying units is not this.
- Claims that the aggregate masks divergence: draw the spread of units, LABELED as
  spread ("the middle half of counties"), never as an unlabeled ribbon.
- Sample estimates: interval whiskers or a band at first presentation, confidence level
  stated in the source line.
- Forecasts/projections: draw the computed forecast interval — it usually widens with
  horizon; show what the model actually says.
- Revision-prone series: show the revision history where the claim depends on stability.
- Suppression/withholding: hatched marks + "withheld" legend entry, written at the
  affected row.
- Privacy floor: suppress or aggregate cells below the source's disclosure threshold
  (and check complementary disclosure — a suppressed cell recoverable by subtraction is
  not suppressed).
- If the phenomenon is the DIFFERENCE between two series, chart the difference — two
  nearly-coincident level lines cannot show their own subject; plot the delta directly.

## Table discipline

- Inline tables cap at ~12 rows. Longer: top-N + "Show all N ▸" disclosure + CSV
  download. The story owns the scroll; the appendix owns the archive.
- Group long tables (sticky group headers); drop any column constant in ≥90% of rows
  and state it once in the caption.
- Numeric cells: tabular-nums, right-aligned; zebra tint on tables >8 rows.
- Every chart keeps an accessible table twin (behind a disclosure) — tooltips enhance,
  never gate.

## Mobile re-layout (per form, not per page)

Design the phone rendering of each chart; never ship a fixed-width canvas behind a
"scroll sideways" hint. The first paint must contain the takeaway. Default moves:

- **Wide horizontal bars/lollipops/dot plots**: labels above their marks (wrapped rows),
  shortened labels, full-width bars.
- **Slope/rank charts**: compact before/after two-column list of the named units, subject
  highlighted; full field in the table.
- **Multi-series lines**: fewer ticks, end-labels only, ~600px virtual width; or
  aggregate (quarterly → annual) so the series fits. (Aggregating or dropping data for
  mobile is an EDITORIAL change — flag it, per SKILL.md's scoped-revision rule.)
- **Scatters**: re-scale so the SUBJECT and the reference line are in the first paint.
- **Matrices/heatmaps**: swap to small multiples or a per-row list.

**Draw charts in SVG, because a graphic built from HTML elements cannot be checked.** One
audited page carried an isotype in its hero assembled from small HTML squares. It looked
right, and it was invisible to every automated check on the project at once: the text-size
gate found no text to measure, the collision gate found no marks to compare, and the
cold-open gate reported the page's first chart 5,000px further down than the graphic a
reader could plainly see. Nothing was wrong with the picture; the problem is that no gate
could ever tell you if something became wrong. Where a repeated-mark visual (isotype, dot
grid, waffle) is wanted, draw it in SVG with real `<text>` and real marks, and give it the
`<title>` that makes it readable to a screen reader as well as to a gate.

**A container that clips needs its own check, because clipping is invisible to every
overlap test.** Charts routinely paint a few units outside their own box — a row label
right-anchored just inside the left margin is the usual case — and it is harmless while
nothing clips it, since the overhang lands in the page gutter. Put that same chart in an
`overflow: auto` box and the ink is cut. On one site "North Carolina" rendered as "Vorth
Carolina" at 900px while ten checks passed, and they passed *because* of the clip:
collision tests look for ink spilling into the page, and clipping is what stops it
spilling. Test the left edge specifically — ink past the right edge can be scrolled to,
ink past the left cannot, because scrolling right moves content further left.

**Fix it at the margin, not with a negative margin.** The tempting repair is to let the
container bleed. Two ways that goes wrong, both worth knowing before trying: `box-sizing:
border-box` means `padding-left` **takes** width from the chart rather than adding room
beside it, so the render scale drops and every label shrinks — on one attempt to 11.8px
across fourteen pages; and compensating the width moves the chart's left edge off the text
rail, which trades the layout's most load-bearing invariant for a three-pixel cosmetic one.
**A fix that breaks a stronger rule than the one it repairs is not a fix.** The real defect
is a left margin narrower than the label it must hold, and it belongs in the chart, sized
from the measured string.

**Never size anything from a character count.** `s.length * 7.4`, `s.length * fontSize + 6`
and their relatives appear wherever a label needs a backing plate, a legend needs an
advance, or a right-anchored string needs a start. A proportional face has no
characters-per-unit, so the estimate is always wrong and only sometimes visibly: on one
audited site a plate ran 18 units wider than the string it backed, which put the plate in
the page margin while the label inside it sat correctly on the page. Measure with
`getComputedTextLength()` (advance) or `getBBox()` (full box, including ascender and
descender), and prefer a helper that draws the text FIRST and fits the decoration to it,
so the two cannot disagree.

**Derive leading from the measured face; never from a constant.** A stacked label and its
sub-line are usually anchored at the same x, so they overlap *whatever they say* if the
leading is too small — this is not a string-length problem and no amount of shortening
fixes it. On one audited site the same defect appeared on three pages independently, 26
overlapping pairs in total, because the leading constants were authored against the
desktop face while the shared stylesheet enlarged chart type below 760px. A constant is a
guess about a face that a stylesheet can change underneath it. Measure the rendered face
with `getBBox()` and derive the leading, and the layout survives the next type change.

Two corollaries worth having in advance:
- **Scope a responsive type bump to the layouts that were sized for it.** A rule that
  enlarges chart type below a breakpoint is written for charts that keep a minimum width
  and pan. A chart with its OWN mobile re-layout renders near 1:1 and receives the larger
  type without the extra room it assumed, which is exactly how the defect above happened.
- **A constant overlap looks width-dependent when the scale varies.** Those pages held a
  fixed viewBox against a column of `viewport − padding`, so the same 3-unit overlap
  crossed the collision gate's reporting floor around 415px and looked like a narrow-screen
  bug. It was present at every width in the band.
- A face probe placed off-canvas (`y: -999`) reports a nonsense ascent, because `getBBox`
  is in viewBox coordinates. Probe on the baseline.

**Widening a minimum is a zoom; enlarging type is not.** When chart text renders too small,
there are two levers and they are not equivalent. Raising the container's minimum width
scales marks and labels together, so nothing that was clear can newly overlap — it is
provably safe. Raising the font while positions stay in the same user units moves labels
toward each other and can collide them. Reach for the minimum width first; a site that did
so widened one number and fixed two pages with zero new collisions, verified by re-running
the collision sweep before and after.

**Downscaling hides overflow, so drawing a chart at true size exposes labels that were
never going to fit.** A chart authored in 1100 units and rendered into 700 shrinks
everything 36%, including an axis label that is too long for its own box. Render it at 1:1
and that label runs off the page. Expect a batch of these the first time a chart stops
being downscaled, and fix them by clamping the label into the viewBox — measured, not
guessed — rather than by reverting to the scale that hid them.

**A container measures 0 before it is laid out, and 0 fails silently.** Sizing a viewBox
from `parentElement.getBoundingClientRect().width` is right, but a fallback of
`|| AUTHORED_WIDTH` means a draw that runs too early quietly keeps the authored width and
reports success. The first attempt at this fix on two charts changed nothing and looked
like it had worked. Make the fallback something always available (a viewport-derived
width), and confirm the change by re-measuring the rendered result, never by re-reading
the source.

**A viewBox is not a re-layout, and this is the trap worth naming.** An SVG authored at
700 units and dropped into a 350px column renders at 0.5 scale, so a compliant 15-unit
label paints at 7.5px, half the accessibility floor, while every gate that reads the
markup says it is fine. Give the phone its OWN viewBox width (roughly the column, so the
scale approaches 1:1), its own tick set, and stacked rather than side-by-side labels. Then
do the arithmetic explicitly: rendered px = font units × (column width ÷ viewBox width).

Three more that cost real rework on one page, all invisible in source and obvious on screen:

- **Collisions are about rendered STRING LENGTHS, not about the viewport, so sweep widths
  rather than spot-checking two.** One chart collided twice at 390 and was clean at 1440:
  a vertical reference rule passed through a legend chip, because the rule's x comes from
  the data and the legend's comes from the margin, so they meet only at some widths.
  Another was clean at 390 AND at 1440 and collided at 560, where a reading line met a
  right-anchored row label. Testing the two widths anyone would think to test would have
  missed it. Sweep a range (say 320 to 1600 in steps), and wherever two labels can meet,
  measure with `getComputedTextLength()` and reflow — a hard-coded breakpoint is a guess
  about a string you have not measured.
- **Put a hero chart on the TEXT rail, not the figure rail.** Body charts sit at figure
  width legitimately; a chart directly under a headline does not, and at 980px against a
  678px measure it starts 151px outboard and reads as a second rail.
- **A redraw handler must clear its own previous render** and keep the `<title>`, or a
  breakpoint change stacks two charts in one box. Accessible titles are the usual
  casualty of a naive `innerHTML = ""`.
- **Sankeys/networks**: card-stack fallback — bars scaled to the GLOBAL maximum, never
  each group's own max.
- Sideways scroll only for genuine reference tables and long time-series matrices — with
  the affordance before the clipped content, not after.
- Check text at true rendered size: floor 12px rendered, verified at 375px.
