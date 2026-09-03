---
name: data-journalism-house
description: |
  HOUSE-BUILT for the Polymer Industry Cluster evidence room; the canonical copy lives in
  the maintainers' private tree and this repository is a tagged snapshot of it.
  Write data-driven explanatory journalism — NYT Upshot / The Pudding / FiveThirtyEight-class
  articles as static HTML+JS pages, from question to published, gate-checked piece. Use when
  writing or revising a data journalism article, visual essay, data-led explainer, evidence
  page, or "evidence room" piece; when turning a dataset + question into a story; when
  auditing an existing data article against genre standards; or on any request mentioning
  Upshot-style, Pudding-style, 538-style, data storytelling articles, or scrollytelling
  journalism. Covers the full craft: pitch gate, storyboarding, article archetypes, headline
  and standfirst formulas, chart selection and annotation law, uncertainty language,
  methodology boxes, page composition and design system, interaction discipline, mobile
  re-layout, and a four-layer review gauntlet. Also triggers on "data essay",
  "interactive article", and "visual essay". Route pure chart/figure requests (no
  article) to pic-charts or dataviz; generic concept explainers with no dataset to
  infographics; talks, slide decks, and room-facing asks to data-storytelling-house.
---

# Data Journalism

Produce articles where **the analysis, the visual form, and the explanation are one
integrated argument** — not prose with charts bolted on, and not a dashboard with captions.
The genre contract: a consequential question × credible measurement × skeptical analysis ×
visual logic × transparent uncertainty × human relevance. It is multiplicative — a zero on
any factor sinks the piece. (For culture pieces, "consequential" = a curiosity or cultural
tension a reader would retell; stakes language, caveat depth, and provenance formality
scale down with consequence, exactly as the methodology box already does.)

**The single deepest rule:** after the first screen the reader can state either the
piece's one-sentence finding OR the exact question plus the promise it will be answered —
reveal-structured pieces (participatory, mystery-lede) choose the second and must land
the payoff by mid-piece, never the closer — and by the last screen the reader can inspect
how you know.

## Workflow

Run these stages in order. Stages 1 and 4 are HARD GATES — do not proceed past them
with a failing answer. Do not skip stages because the piece "is simple"; a simple piece
moves through them quickly.

**Auditing an existing piece instead of writing one?** Skip to stage 7 and run all four
layers of [references/review-gates.md](references/review-gates.md); report by rubric
dimension with severity scores and the highest-leverage upgrade.

**Revising an existing piece?** Two rules the first pass always wants to skip:
- **Re-derive every inherited number, not only the ones you change.** A page carried
  forward is a page whose old arithmetic nobody has re-run. In practice this is where
  the errors are: a published "widest gap on record" that a fresh derivation showed was
  not the widest, a hand-typed possible-set denominator off by twelve, a README and a
  page disagreeing about how many rows the data has. Guard the inherited sentences too,
  and log a dated correction for anything that moves.
- **Treat an audit's suggested fix as a hypothesis, not a fact.** Recompute before you
  implement it. A finding can be right that a chart needs an endpoint annotation and
  wrong about the number that goes in it — publish your own derivation, and say so when
  it differs from the brief.
- **Reviewer convergence is plausibility, not verification.** N reviewers agreeing adds
  nothing a derivation doesn't: in one audit, four independent model families twice
  converged on findings the arithmetic then refuted — once on a direction (excluding a
  code family RAISED the median they said it inflated) and once on a specific that does
  not exist (a real 1.01× from one band attached to an occupation whose cell is
  withheld). Recompute every convergent finding; treat every unverified problem-flag as
  a lead. And never compare verdict tallies across differently-framed review passes: a
  reviewer instructed to be hostile skews toward no-ship, so findings travel between
  passes and verdicts do not.

**Gate outcomes are three, not two**: PROCEED, KILL, or NEEDS-EDITOR-CALL. The pitch
criteria involve judgment ("nameable aha", "confirms the obvious"); when a criterion is
genuinely arguable, don't stall — record the argument both ways and proceed with the
stronger reading labeled provisional, surfacing the call in the deliverable. When a gate
FAILS and the user wants the piece anyway: present the failing criterion and the
strongest reframe, proceed on their explicit call (or, running unattended, proceed with
the reframe labeled provisional), and record the overridden gate in the methodology box
or session notes. Never silently ignore a gate and never silently refuse the work.

**When the finding contradicts the outlet's/client's own prior public claim**: the menu
is (a) publish with the contradiction stated — the self-audit standfirst move, plus
correcting the prior surface per the corrections policy — or (b) kill the piece at the
client's call, recorded in session notes. Softening verbs below evidence tier or omitting
the contradiction is never on the menu.

**Short form** (single-finding post, ≤~500 words, publish today): the stages compress,
they don't disappear. Pitch = the kill criteria answered in one line each (skip the
10-item form). Storyboard = 2–3 cards; human-scale and caveat may be clauses inside a
card. Edit = the uncertainty/attribution lint only. Review = Layers 1 and 2, rubric
dimensions 2/4/5/6 only, and render-and-look — always — plus Layer 2.5's right-of-reply
check whenever a firm or person is characterized (an ethics floor no word count waives). Page-design act structure is
waived; the chart law and caveat budgets are not.

**Scoped revisions** (a mechanical fix — rendering, layout, typography, build errors —
with "change nothing editorial"): skip stages 1–6; run Layer 4 render-and-look at both
widths always, Layer 1 only if any number or data binding moved, and skip Layers 2–3.
One flag: a mobile re-layout that aggregates, drops, or re-selects data IS an editorial
change — surface it for sign-off instead of shipping it silently.

### 1. PITCH (gate)

Complete the pitch form in [references/pitch-and-storyboard.md](references/pitch-and-storyboard.md)
in writing. Kill criteria, verbatim:

- No one-sentence single point → no piece.
- No nameable "aha" moment (or the analysis result that would constitute one) → no piece.
- The medium check, SCOPED BY ARCHETYPE: for a visual essay, "would work equally well as
  1,000 words of plain prose" is a hard kill (that archetype exists only where the visual
  experience is the argument). For the default data-led explainer, the bar is lower and
  passable with one good chart: is there at least one chart that does argumentative work
  prose cannot? The Upshot's best work is often 900 words around two excellent charts —
  that passes.
- Data merely confirm the obvious and no surprising sub-finding exists → kill, reframe,
  or re-scope as a utility piece. Two guards: (a) lookup and tracker archetypes pass on
  UTILITY (a question the reader will return to), not on surprise — don't demand an aha
  from a tool; (b) reframing around a surprising sub-finding found by scanning is
  selecting on noise (HARKing) — a rescued pitch must label itself exploratory and show
  the sub-finding persists (second period, holdout, or pre-registered follow-up) before
  headlining it. One reframe loop maximum, then it's an editor call.

Never torture the analysis to rescue the pitch. "There is no story here" is an acceptable,
even distinguished, outcome. Re-test interest after analysis, after storyboard, and after
build (the continue/pivot/put-it-down checkpoints in the same reference).

### 2. DATA AUDIT

Interrogate the dataset like a hostile source before analyzing it: who created it, for what
purpose, what exactly one row measures, what is excluded, whether definitions changed over
time, how records go missing, what incentives shape reporting, and **what the denominator
is**. Write the answers down (a short data memo). Two rules when the ingestion is yours: **an extractor reports its own yield** against an independent count of the raw marker it keys on — a parser that silently dropped 44% of award records produced output that looked exactly like clean output, and fewer rows is invisible without the denominator — and **a failed request never becomes a zero**: accept an empty result only when the response body itself says no records matched, because a saved error page and a genuine zero are different facts that read identically downstream. A correct calculation on an invalid
measure is the genre's most common analytical failure — precision without validity.

### 3. ANALYZE AND STRESS-TEST

Explore before modeling; simple comparisons before complex methods. Before believing a
finding, try to destroy it:

- alternative definitions, time windows, denominators, aggregations; outlier in/exclusion;
- whether one subgroup drives the whole result, and whether a group contrast survives
  WITHIN-group comparison — composition differences can reverse the aggregate (Simpson's
  paradox); where the mix shifted over time, show or state the mix-held-constant result;
- whether the headline unit was selected as the extreme of many scanned cells — the
  winner of a 3,000-cell scan is partly luck and will regress on fresh data; aggregate,
  test persistence in a second period, or say the ranking is unstable;
- whether small-denominator units drive the extremes of any rate ranking or map;
- whether the comparison crosses seasons on non-seasonally-adjusted data (QCEW is NSA:
  compare same-quarter year-over-year, never adjacent quarters), and whether SA and NSA
  series are mixed in one claim;
- whether last year's data confirm this year's flip — and whether the "improver" was
  selected on an extreme prior value, in which case regression to the mean produces the
  flip with no real change; require persistence in a third period before headlining a
  turnaround. Classify the
claim you are about to make — descriptive / comparative / explanatory / causal /
predictive / normative — and note your evidence tier: claim type says what you are
asserting, evidence tier says how you know it, and the WEAKER of the two caps your verbs
(the crosswalk lives in writing.md's uncertainty ladder — a causal claim on
correlational evidence gets association-level verbs; writing.md, Dimension C).

Every headline number must answer **"compared with what?"** — normalize (per-capita, rate,
real dollars), benchmark (history, peers, a target), or distribute (percentiles, not just
the average). If the piece poses a magnitude question ("is 12% a lot?"), answer it or say
plainly that no fair comparator exists (that is an honest finding; "we won't tell you" is
an abdication). **The honest decline is a DEBT, not a terminal state.** Declining is
honest only when the comparator is genuinely costly; a same-instrument comparator one
API call away, left unfetched, is a research gap wearing a caveat's clothes — incident:
a churn page declined "is a tenth a lot?" for weeks while the same source's statewide
series (one keyless call) held the answer, and the answer flattered the region. Every
decline records what the missing comparator IS and roughly what fetching it would cost;
an unbenchmarked magnitude number gets read at its scariest by every downstream reader,
so the decline's cost is never zero. A same-method internal benchmark (same pipeline, same collection quirks)
is a comparability ADVANTAGE — much of the shared bias differences out — but never a
cancellation guarantee: check whether the bias could differ between the two things
compared (by geography, subgroup, or time) before leaning on it.

### 4. STORYBOARD (gate)

Before any prose or code: pick the archetype (data-led explainer is the default; the
archetype library with beat skeletons is in
[references/pitch-and-storyboard.md](references/pitch-and-storyboard.md)). If a house
stack applies (see House stacks below), read its reference NOW — the stack's chart
vocabulary constrains storyboard-time form choices, and locking in forms the stack can't
cheaply render wastes the storyboard. Then write one beat card per section: the beat's single claim, the evidence slice, the chart form (chosen
via the relationship table in [references/chart-craft.md](references/chart-craft.md)), the
literal on-chart annotation text, and why the next beat follows. Assembly checks:

- The **organizing question appears in the hero** and the closer RESOLVES it. A closer
  that introduces the piece's best question is a structural bug — promote it to the top
  and rebuild the middle as successive answers to it. The same lint applies to the FINDING: if the closer or kicker states the finding better than the H1 does, the headline is carrying trivia and the closer's sentence is the headline — one 14-page audit found this on four pages at once, and in every case the better sentence already existed on the page.
- The aha beat lands by card 2–3, and at least one later beat escalates or complicates it
  (a middle that merely corroborates the opening sags).
- Every beat advances the single point; merge adjacent beats with near-identical charts
  (except deliberate repetition-with-escalation, where the repeated form IS the argument —
  see pitch-and-storyboard.md).
- One beat is a **human-scale beat** (stage 5) and one carries caveats before the final
  so-what card.

### 5. BUILD

Write prose, charts, and page together — the chart sequence is allowed to change the
argument, and when it MATERIALLY does, re-open the storyboard (revise the affected beat
cards — cheap) rather than silently diverging from a passed gate. One such loop, then an
editor call. Layer-by-layer law:

- **Headline & standfirst**: takeaway headline from the formulas in
  [references/writing.md](references/writing.md) — a finding with a verb, never a topic
  label. Standfirst = sharpest supporting fact + scope credential + stakes. Stakes before
  self-audit: lead with the reader's live question, not the outlet's methodology.
- **Charts**: chart law, the FT relationship table, and the per-chart annotation checklist
  in [references/chart-craft.md](references/chart-craft.md). Iron rule: **no chart ships
  naked** — every chart carries its claim on the chart (takeaway title with a verb,
  in-plot annotation where chart-craft's conditional rule calls for one, direct series
  labels, labeled reference lines).
  A chart whose story is told only by surrounding prose is a silent chart; fix it.
- **Page composition**: design system and pacing rules in
  [references/page-design.md](references/page-design.md). Composition is a first-class
  layer — a page of identical-density sections does not "flow" no matter how good the
  charts are.
- **Interaction**: the Tse/Aisch discipline in
  [references/interaction.md](references/interaction.md). Scroll is the default; nothing
  load-bearing behind a click or hover; interaction earns its place only for the six
  ladder jobs defined there (verification, completeness, lookup/personalization, prior
  elicitation, assumption testing, shareable artifact). For a known audience (members,
  readers in named counties), a missing "find yourself" lookup is a gap, not a nicety.
- **Human scale**: at least one beat grounds the aggregate in a person, firm, plant,
  product, or place — reported where the piece truly needs reporting, a named public
  instance or concrete translated vignette otherwise ("$1,365/week is about $71,000 a
  year, in a county where the average job pays half that"). A piece with NO human-scale
  beat at all is a defining genre failure; a vignette satisfies the beat (see writing.md
  for the ladder, the exemptions, and the agent escape hatch). Human examples illuminate
  mechanism and stakes; they are never proof of the aggregate claim.
- **Mobile**: design the mobile rendering of every chart, don't just shrink it. A
  fixed-width chart behind a "scroll sideways" hint hides the evidence from phone
  readers — re-layout per form (see chart-craft § mobile). Verify at 375px.

### 6. EDIT

Three passes over the full draft:

- **Uncertainty & attribution lint**: apply the uncertainty-language ladder and the
  attribution grammar in [references/writing.md](references/writing.md) to every claim
  sentence. Verbs are capped by evidence tier; probabilities always carry their complement;
  "the records show / we estimate / the model assigns / we think" distinctions are
  maintained so the reader can see where fact ends and inference begins.
- **Methodology-balance pass**: methodology is load-bearing but it is the floor, not the
  show. Apparatus may not colonize reader-facing real estate: no methods rationale as a
  section title, no caveat-forward standfirst (one caveat clause max above the fold), no
  register/harness internals in body prose, each guardrail stated once per independent
  reading context (page prose / each self-contained figure / methodology box), never
  twice within one. Everything else moves to the methodology box (template in writing.md)
  and chart source lines. Caveats sit where the reader makes the inference — beside the
  chart they qualify — not only in a footer. And read every caveat sentence asking: **is
  this actually a finding?** A caveat that names a surprising fact (who is excluded,
  which subgroup diverges, what declined) gets promoted to a beat or stat card, not left
  in footnote register.
- **Style-bans lint** (after the voice pass): run
  [references/style-bans.md](references/style-bans.md)'s draft lint over every piece —
  the house word bans, the syntax bans (no em-dashes in prose, smart quotes only, no
  contrastive parallelisms, no staccato), and the AI-tell pattern list. One tell undoes
  a page of craft.
- **First-read pass — THE SYSTEM CONTAINED NO ONE READING FOR THE FIRST TIME**
  (2026-09-01; root cause revised the same night by a 22-reader register of 359 typed
  stumbles). The first diagnosis blamed adversarial optimization: defenses written to
  survive a hostile expert stack into sentences that must be PARSED rather than read.
  The register showed that is only a third of the disease. The two largest categories,
  undefined terms (52) and unglossed jargon (50), are the OPPOSITE failure: the expert
  reviewer never demanded "PIC" be expanded or "leaving rate" defined because the
  reviewer already knew. One cause, two mechanisms: defenses written FOR experts stack
  (overstuffed sentences, numbers before meaning, compressed asides), and knowledge
  shared AMONG experts never gets externalized (undefined terms, unglossed titles,
  three names for one concept). Chart-speak is a third artifact of the same cause:
  prose written while looking at the chart. Fixing only the stacking leaves the larger
  half untouched, which is why the de-jargoning rules below are not optional polish.
  Two empirical warnings the register also settled: mechanical readability formulas
  EXONERATE this disease (the site scored mean FK grade 10.1, inside the wire band,
  while readers logged 359 stumbles; the hardest-hit page scored EASIEST) — never
  substitute a formula for a cold reader. And the pass validated its own controls: the
  two piloted pages ranked most-readable under blind re-audit. The pass is performed BY
  a naive reader (Layer 3.5) who is NEVER the editor, per page, as a standing
  requirement — the register (verbatim quote, 8-type taxonomy, severity 1-3, stumbles
  per 1,000 words) is the deliverable, and it doubles as the edit worklist.
  The five laws it enforces:
  1. ONE NAME PER CONCEPT, repeated relentlessly. Elegant variation is poison: churn
     shipped hires/separations on the chart, starting/ending in the definition, and
     "leaving rate/hiring rate" in the analysis — three vocabularies, one pair of
     concepts, and the reader did the mapping mid-sentence. Anchor any new term to the
     canonical one at first use ("the separation rate, the share of jobs that end in a
     quarter") and never introduce a synonym after.
  2. GLOSS EVERY OCCUPATION TITLE and agency term at first use: "molding-machine
     setters, the people who set up and run the molding machines." A BLS title is not
     English.
  3. ONE CLAIM PER SENTENCE, INTERPRETATION BEFORE THE NUMBER. "Tire builders read 95%,
     which is to say almost nobody..." became "Almost nobody outside this industry
     builds a tire: 95% of the country's tire builders work inside it." Same facts,
     readable at speed. Ban chart-speak from prose ("reads 95%", "which is to say").
  4. CONCRETE BEFORE ABSTRACT: the human-scale translation echoes EARLY (a clause in
     the standfirst), even when its full section sits later.
  5. The fix is an EDIT, not a rebuild: none of it touches a number, a chart, or a
     claim, and the coldopen ratchet still governs — glosses added above the fold are
     paid for by cutting connective tissue (roadmap sentences die first).
  6. PULL-QUOTABLE FRAGMENTS CARRY THEIR OWN SCOPE. Any emphasized, italicized, or
     headline fragment a reader might quote alone must survive detachment: the
     possessive, denominator, or corpus travels INSIDE the fragment, never only in
     the surrounding sentence. Incident: an H1's em-tagged "four papers in five are
     led from here" detached into "80% of world polymer science is from Ohio" the
     first time a cold listener met it; "four of its papers in five" survives the
     same quotation. Test each emphasized span by reading it with the rest of the
     sentence deleted.
- **Voice pass**: plain, active, confident; jargon translated at first use; numbers rounded
  to argument precision — but a scalar standing in for a SERIES
    carries that series' range wherever it is doing argumentative work, because "about
    thirty a year" for a band running 27 to 57 is how a false decomposition gets to read
    as obvious (Layer 1.5). Calibration prior, not a quota: agent first drafts reliably
  over-connect, so expect the connective/editorializing tissue to roughly halve under a
  real edit — and never cut the explanation itself (stakes, mechanism, translation, and
  human scale are exempt). Kill the seminar tics ("quantities that must never
  share an axis"), the prosecutorial tics ("we are not going to tell you"), and bolding
  more than one load-bearing phrase per paragraph.

### 7. REVIEW (gauntlet)

Five layers, and once a third piece exists in the same body of work, Layer 5's
**portfolio pass** runs too — one stencil across many stories, verification performed as
identity, an all-vignette reporting record, and advocacy voice are all defects that are
invisible page by page and obvious across a site.

Four layers, in order, from [references/review-gates.md](references/review-gates.md):

1. **Data correctness** — reproduce key numbers from source; internal consistency (the same
   quantity never appears as two unexplained different numbers).
   **1.5 Numbers that must agree** — assert the checkable invariants instead of trusting
   an author to hold them: parts sum to their printed whole, superlatives are derived
   rather than typed, figures printed together reconcile, and the page agrees with its
   own README and hub card. A rule enforced only by discipline decays; one that can be
   written as an assertion becomes a check.
2. **Statistical validity** — claims match evidence tier; robustness checks recorded.
   **2.5 Outside eyes** (conditional, but never waived when triggered): right of reply
   for anyone the piece characterizes; an external methods read for causal or
   consequential claims — see review-gates.md.
3. **Editorial** — score the piece against the 14-dimension rubric; fix every severity ≥4.
   **3.5 Naive reader** — one reviewer with the RENDERED PAGE ONLY, no source, no data, no
   methodology, asked what each number means and which direction is better. Every other
   layer is staffed by people who read the code first, and expertise cannot un-know
   itself; this is the only layer that catches what a first-time reader cannot decode.
4. **Interface** — run the project's automated gates if any, then **render and look**:
   screenshot desktop AND mobile and actually read the screenshots. Automated gates cannot
   see a squashed chart, a truncated label, or an `undefined` in the hero; a silent pass is
   worse than no check. No "looks good" verdicts from code alone.

### 8. SHIP

Methodology box present and scaled to consequence; sources named with exact filters;
data/code released to the extent consistent with privacy and licensing; corrections policy
stated (dated, append-only, never silent). If the repo has publish gates, they pass. After
shipping, name the piece's one concrete weakness to fix next — the first published version
is a draft with standards.

## Iron rules (the genre's failure modes, inverted)

1. Question-first: the organizing question is in the hero; the closer resolves it, never
   introduces it. Declare the publication mode at pitch time (journalism vs institutional
   — pitch Q12); in both modes, publish the finding and never the instrumentation.
2. No naked charts: every chart carries its claim on the chart. The accessible description (SVG title / alt text) is part of that claim surface: check it against the chart's own annotations — a description saying "two of the eight years" over annotations that prove one hands a screen-reader user a different finding than a sighted one, and no gate can see semantic truth, so pin it with a claim.
3. Compared with what: every headline number is normalized, benchmarked, or distributed.
4. One human-scale beat minimum; aggregate patterns get a face, a firm, or a translation.
   (Satisfied structurally when the archetype puts the reader IN the data — lookup and
   participatory pieces need no manufactured vignette.) In journalism mode the vignette
   rung carries a portfolio limit; in institutional mode a labeled vignette satisfies it
   permanently (writing.md).
5. Methodology is the floor, not the show: transparency below the story, caveats beside
   the charts they qualify, apparatus out of headlines and standfirsts.
6. Uncertainty verbs match evidence tier; probabilities carry their complement.
7. Scroll-first: nothing load-bearing behind click or hover; interaction only for the
   six ladder jobs in interaction.md (verification, completeness, lookup, elicitation,
   assumption testing, shareable artifact).
8. Mobile is designed, not shrunk: per-chart re-layout, evidence in the first paint.
9. Progressive disclosure: full evidence tables collapse behind details/CSV; the story
   owns the scroll, the appendix owns the archive.
10. Render and look before shipping: read your own screenshots at both widths.
11. Never hallucinate data; use only what the pipeline provides. Never hand-type
    CHART-BOUND data values into markup — charts render from data files so corrections
    propagate (label STRINGS are editorial text and are hand-authored
    — but prose authored ONCE and rendered into many pages is a surface of its own, and
    this exemption is the hole a retracted number and a wrong year filter both travelled
    through to reach readers; assert it per consuming page, or record in the trust map
    that nobody is watching it). Prose and hero
    numbers are required (writing.md), but each must be guarded: generated from the data
    files, or covered by a claims/consistency check; on a stack with no harness, a
    checked constants file is the minimum real guard, and an inline source comment
    naming the dataset and computation marks a number as MANUALLY VERIFIED only — say so
    in the methodology box rather than calling it guarded.
12. Kill or pivot a piece the analysis does not support. Data decoration is the failure
    the whole genre defines itself against.

## House stacks

If working inside a repository with its own publishing system (shared chart library,
claims harness, verify gates), read the matching stack reference before building —
for the PIC Evidence Room: [references/evidence-room-stack.md](references/evidence-room-stack.md).
Its page anatomy, chart recipes, gate commands, and known pitfalls override generic
implementation guidance in this skill (but never the editorial law above).

**Generic stack** (no house system): a self-contained static page — semantic HTML,
charts rendered by inline JS from a `data/*.json` file embedded as a
`<script type="application/json">` tag (or Observable Plot where a build exists), never
SVG with hand-typed values; system-font fallback stacks; zero external dependencies.
"Zero external dependencies" means at RUNTIME — Observable Plot or similar is allowed
only where a build step inlines it into the page. The two-typeface rule holds on system
stacks — pair a system serif display face with the system sans workhorse (or vice versa
per register); webfonts only where the house loads them. Embedded chart JSON is itself a
data release: reduce it to the derived/aggregated values the data license permits and
note the restriction in methodology item 7. No-JS reconciliation: every beat's CLAIM
lives in HTML text as guarded prose numbers (legal under iron rule 11); only the chart
RENDERING hydrates from JSON — so the argument survives without JS and no value is
hand-typed twice.
Breakpoints: design at ~1280px, re-layout charts below 760px, verify at 375px. Colors:
use the outlet's design tokens if they exist; otherwise document a colorblind-safe, contrast-checked palette in the piece itself
rather than stalling. Render-and-look: screenshot via headless browser or the preview pane at
1280px and 375px full-height, and read the screenshots.

## References

- [pitch-and-storyboard.md](references/pitch-and-storyboard.md) — pitch form, kill/pivot
  checkpoints, archetype library with beat skeletons, storyboard beat cards.
- [writing.md](references/writing.md) — headline formulas, standfirst formula, voice rules,
  uncertainty-language ladder, attribution grammar, human-scale patterns, methodology box.
- [chart-craft.md](references/chart-craft.md) — chart selection by relationship, annotation
  checklist, chart law, color-as-meaning, uncertainty encodings, table discipline, mobile
  re-layout patterns.
- [page-design.md](references/page-design.md) — page anatomy, composition and pacing rules,
  typography and spacing system, design tokens, what makes a page "flow".
- [interaction.md](references/interaction.md) — Tse/Aisch rules, the interaction ladder,
  participatory patterns, scrollytelling restraint, accessibility requirements.
- [style-bans.md](references/style-bans.md) — the negative style guide: house word and
  syntax bans, AI-tell patterns, the draft lint pass.
- [review-gates.md](references/review-gates.md) — the 14-dimension editorial rubric,
  four-layer review, pre-publish checklist, render-and-look protocol.
- [evidence-room-stack.md](references/evidence-room-stack.md) — PIC Evidence Room house
  stack: anatomy, picviz recipes, gates, known gaps and bugs.
