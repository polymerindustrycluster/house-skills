# Review gates: the rubric, the four layers, and render-and-look

## The four-layer review (run in order; a value can be computed correctly yet
interpreted incorrectly — each layer catches what the previous cannot)

### Layer 1 — Data correctness
- Reproduce the key numbers from source data through the stated pipeline; a second pass
  (or second person/agent) must be able to reproduce the central numbers without a
  verbal explanation from the author.
- Internal consistency: the same quantity never appears as two different numbers without
  an on-page reconciliation (real vs nominal, hero vs chart). Pick one basis per visual
  unit and label it.
- No hand-typed CHART-BOUND data in markup; charts bind to data files. Every prose/hero
  number is guarded — generated, claims-checked, or traced to a checked constants file
  (iron rule 11).
- Template variables actually resolved — literally grep the rendered page for
  `undefined`, `NaN`, `${`, and empty id-slots.
- Denominators of POSSIBLE sets ("of 72 possible pairings") are computed from the data,
  never typed — a hand-typed possible-set count sits outside every gate's reach and is
  where a wrong number survives longest.

### Layer 2 — Statistical validity
- Every claim's verb matches its evidence tier (writing.md ladder); descriptive results
  have not quietly become causal or normative.
- Robustness recorded: alternative definitions/windows/denominators tried; single
  subgroup not driving the whole result; small movements calibrated against noise and
  revision history.
- Denominators defended; distributions shown where averages could mislead;
  employment/population weighting stated where cell-counting could mislead.
- The stage-3 destroy-list re-checked at review: extreme-cell headlines checked for
  selection (the max/min of many cells is biased outward); group contrasts checked for
  composition/Simpson's reversal; season-crossing comparisons on NSA data flagged;
  improver stories checked for regression to the mean.
- Comparisons of two estimates use the interval on the DIFFERENCE; margins carry their
  confidence level; group-level correlations are not narrated as individual-level claims
  (ecological fallacy).
- Where many cells/hypotheses were scanned, the piece says so and treats borderline
  patterns accordingly (multiplicity is disclosed, not laundered).
- Suppression thresholds honored, including complementary disclosure (a suppressed cell
  recoverable by subtraction is not suppressed).

### Layer 1.5 — Numbers that must agree (make the checkable defects machine-checked)

**The governing rule: when a defect class can be expressed as an assertion, it stops
being a style note and becomes a check.** Every rule enforced only by author discipline
decays — in one audited body of work, a rule was violated on a page built after the rule
was written, and the classes below were caught by a reader doing arithmetic rather than
by any gate. A page that can re-run its own sentences can re-run these too, and a
project without a harness writes them as a pre-publish checklist instead.

The invariants worth asserting, all found broken in production:

- **Parts sum to the whole, on the same page.** Twelve county counts printing 1,732,617
  under a stated total of 1,735,169. If a page shows components and a total, assert their
  agreement; if they legitimately differ (suppression, rounding, a different vintage),
  the page states why where both appear.
- **An extreme claim is derived, never typed.** A chart annotated "no county reaches
  69%" with a county plotted at 72.5%. Any superlative — no unit reaches, the highest,
  the only one, the largest — comes from a computation over the same data the chart
  draws, so it cannot survive the data changing underneath it.
- **A pair printed together reconciles.** Two figures on one chart ($51.0M and $50.8M),
  a hero number and a chart number, a title and its axis. Where the difference is real,
  name it; where it is rounding, say so at the point of collision.
- **Cross-surface facts agree**: page, README, hub card, and social/meta description are
  four surfaces stating the same numbers, and drift between them is invisible in review.
- **Print precision matches computed precision.** A figure rounded for display and then
  subtracted from another rounded figure will not reconcile; assert on the unrounded
  values and state the rounding.
- **A claim about a CHANGE is computed from changes, never from levels.** A page said
  everything that rose and then fell in its series came from abroad, and that the domestic
  band "has not moved". The domestic band carried 35% of the rise and 23% of the fall:
  "everything" and "almost all" were describing 65% and 77%. Every LEVEL on that page
  reconciled at every single year, which is exactly why 105 machine-checked claims passed
  over a thesis wrong by a factor of three — "parts sum to the whole" is a levels invariant
  and is blind to a decomposition. Any sentence of the form *most of the rise / the fall /
  the growth was X* asserts the share of the CHANGE between two named endpoints, and names
  those endpoints in the claim.
- **A scalar standing in for a series carries that series' range.** "About thirty a year"
  described a band running 27 to 57, a 2.11x swing whose midpoint nobody would call thirty.
  The scalar was not merely imprecise, it was load-bearing in the wrong direction: a flat
  line has nothing to decompose, so "about thirty" is what made the false decomposition
  above read as obvious. Where one number summarises a series, assert both endpoints and
  both extremes, and print the range wherever the scalar is doing argumentative work.
- **A claim's ASSERT must be at least as strong as its TEXT.** A claim reading "the pipeline
  never moved: 27 in 2012, 30 in 2023, and between 27 and 57 every year in between" asserted
  `min >= 27 and max <= 57`. A series that DOUBLES inside those bounds satisfies it, and that
  series doubles. The harness certified a sentence its own numbers refute, which is worse than
  an unchecked sentence because it arrives with a green board attached. Bounds quoted in the
  text are pinned with `==`, not `>=`/`<=`; a superlative in the text is a superlative in the
  assert; and review reads the pair TOGETHER, never the verdict alone.
- **Prose authored once and rendered into many pages is a surface, and nothing watches it.**
  The cross-surface rule above assumes each surface is separately authored. A shared source
  registry, a label map, a glossary — anything written once and rendered into N pages — has no
  cross-surface check at all, and the exemption that label STRINGS are hand-authored editorial
  text is precisely the hole a retracted number and a wrong year filter both travelled through
  to reach readers. Assert shared prose against the data it describes, once per consuming
  page, or record in the trust map that nobody is watching it.
- **Anything the browser writes must be checked in the browser.** The rule below ends with
  "a byline written by JavaScript is invisible to a source grep", and that holds for every
  string a page composes at runtime, not only bylines. A page whose entire subject was a
  footnote that does not resolve shipped the sentence "Footnote resolves to: undefined",
  reading a data key that had never existed — and every gate passed, because every gate greps
  files. Any check specified against "the rendered page" (placeholder text, undefined / NaN /
  null, empty states, generated labels, counts) runs against rendered DOM in a headless
  browser, or it is not running.
- **Authorship is a claim, so assert it.** Half the pages in one audited site carried no
  AI disclosure in the byline, and four credited a named person for analysis a model
  produced. Two were damaged by a tidying regex, two were built that way, and the rest
  stated the same fact in five wordings. Every gate passed throughout, because none was
  looking. Assert that every page carries the disclosure, in one wording, against the
  RENDERED page — a byline written by JavaScript is invisible to a source grep.

## What is enforced, and what is on trust

Keep this map, per project, and keep it honest. An audit of this skill found roughly 200
rule-bearing lines and fifteen naming a runnable check, which is the ratio that lets a
written rule decay: it was violated on a page built after it was written, and a style law
stated verbatim was broken seventy-six times. **A rule with no check is not a standard, it
is a hope.** So for every rule, one of two things must be true: a command fails on it, or
this table says plainly that nobody is watching.

MACHINE-ENFORCED (the classes a build can refuse):
numeric claims against their own data · cross-page figure agreement, including *basis* and
*observability* · one text rail · the 12px rendered floor, swept across widths · overlap,
out-of-frame and clipped ink, swept · authorship disclosure in one wording · the mechanical
half of the style law · evidence in the first screen, ratcheted so debts only shrink · the
builders and their catalog · **rendered-text artifacts and narrow-width overflow**, swept in
a headless browser rather than by grepping files · **and the gates themselves**, by injecting
a defect that actually shipped and requiring each gate to fail on it.

ON TRUST — no check exists, and every one of these shipped past a green board:
- **A decomposition claim, and the scalar that props it up.** The share-of-change and
  series-range invariants above are stated as rules and asserted per claim; no generic check
  finds a page that needs them and has not written them. The failure they describe passed 105
  green claims.
- **An assert weaker than the sentence it certifies.** Detectable in principle — a text
  quoting a bound against an assert using `>=`/`<=` is a mechanical shape — and detected by
  nobody today. Read the pair together in review; the verdict alone is not evidence.
- **Shared prose rendered into many pages.** Per-page assertion is possible; nothing does it
  by default, and the label-string exemption means nothing is expected to.
- **Literally true and reliably read false.** A national figure on a regionally-framed page;
  a headline total that the next sentence contradicts.
- **A caveat that sits somewhere other than where the claim is made.**
- **A finding that is an artefact of its own buckets** (an "empty era" produced by
  overlapping bucket bounds).
- **A hierarchy presented as a flat list** — a parent ranked against its own children, a
  column that cannot be added.
- **An unstated basis**: nominal read as real, a median over rows read as a median over
  units, an annual rate averaged over an unfinished year.
- **A label that does not describe what it labels** (a bucket named by four of its members).
- **Whether a dashboard answers the question it poses**, and whether a reader would keep
  reading.

**Those are not a backlog of missing gates.** Most cannot be expressed as an assertion,
because they are about what a sentence *causes a reader to believe*, not about what it
says. They are the naive read's territory (Layer 3.5), which is why that pass is a required
gate here and not a nicety: it is the only instrument pointed at this half of the list.
Run it on a cadence, from the live page, and treat its findings as findings.

**A green board is not a look, and the gap between them is where the embarrassing defects
live.** Everything a gate here checks is a proxy: size, overlap, position, containment.
Rendering the page and reading it catches the class that no proxy names — a clipped glyph,
a chart that reads as broken, a label stranded from its mark. On one audited site, asked
whether the work had been visually inspected, the honest answer was that the newly
introduced layout band never had been; one screenshot of it found a defect that ten checks
had passed. Budget a real look at every layout band you changed, not only the two widths
you happened to design at.

**And the gates themselves need one property: a check must distinguish "measured and
clean" from "could not measure."** A text-size gate reported `svg-min —` and PASSED on a
page whose chart had collapsed to zero width — 231 labels went unmeasured and unmentioned,
by the one check whose entire job was chart text. An early `return` on unmeasurable input
reads as a pass. Every gate reports what it could not inspect and fails on it, and no gate
is trusted until it has been run against a case whose answer is already known: inject the
defect, watch it fail, restore, watch it pass. A tidying regex is a content edit and gets
the same treatment — spot-checking two files is how the other eight were missed.

### Layer 2.5 — Outside eyes (conditional external checks — run whenever triggered, in every form)
- For explanatory/causal or consequential claims: an outside domain expert reads the
  methodology before ship. An agent that cannot send it drafts the ask (who, what to
  check, deadline) and flags ship-blocked-pending-review or editor-waived — same escape
  hatch as reporting.
- Right of reply: every named firm/person whose conduct or performance the piece
  characterizes has been offered comment, or the editor has explicitly waived it with
  the waiver recorded. (Naming a public award recipient is not characterization;
  "underperformer X" is.)

### Layer 3 — Editorial (the 14-dimension rubric)
Score each dimension's **gap severity** 1–5 — this is a SEVERITY scale (5 = worst), not
a quality score; say "severity" in reports so nobody inverts it. Anchors: **5** =
defining gap (the dimension's core rule is absent and the piece fails the genre on it);
**4** = a named defect from this dimension's list is present and a reader would notice;
**3** = present but mitigated elsewhere on the page; **2** = minor blemish; **1** =
strong. In AUTHORING mode, fix everything ≥4 before shipping and a piece with any 5 does
not ship (dimension 14 is advisory — it is a pitch-time criterion, reported but never
ship-blocking at review). In AUDIT mode (reviewing an existing/other-author piece), the
rubric REPORTS — scores, evidence, highest-leverage upgrade — it does not gate; and
distinguish scoring from editing: queries go in the author's voice, rewrites happen only
at the editor's call. Dimensions that cannot be assessed with available access (no data,
no source) are marked NOT ASSESSABLE, never guessed.

1. **QUESTION-FIRST** — a consequential question or tension a real reader has, posed
   before the data; not "here is a dataset/method."
2. **HEADLINE & DEK** — headline states the finding (verb, no topic label, no jargon
   noun); dek = fact + credential + stakes, ≤1 caveat clause, doesn't spoil a
   participatory reveal or pre-narrate every section.
3. **NARRATIVE ARC** — premise → discovery → complication → resolution; the aha lands
   early and something later escalates it; the closer resolves the hero's question,
   never introduces the piece's best question; sections are an argument, not a parallel
   inventory.
4. **TAKEAWAY-FIRST ANNOTATION** — every chart carries its claim on the chart; no
   silent charts; no machine-truncated labels.
5. **COMPARISON-AS-EXPLANATION** — every number answers "compared with what"; the
   magnitude question the page poses is answered, with a same-method benchmark if no
   fair external one exists.
6. **UNCERTAINTY** — visible where it affects the conclusion (drawn, not just
   footnoted); calibrated language; not over-hedged either.
7. **INTERACTION** — nothing crucial behind a click; no interaction theater. A missing
   interaction is a defect ONLY where the ladder names an obvious high-value job for
   this audience (e.g., lookup on county-keyed data for a member audience); a fully
   static piece is compliant when no such job exists — that is Tse's point, not a gap.
8. **HUMAN SCALE** — severity 5 only when NO human-scale beat exists at all (and the
   archetype doesn't satisfy it structurally — lookup/participatory pieces do). A
   rung-3 vignette satisfies the beat. Severity 3–4 when reachable humans would clearly
   have elevated the piece and neither an interview ask nor an editor's downgrade is
   recorded (writing.md escape hatch).
9. **VISUAL FORM FIT** — simplest form preserving the argument's structure; sort order
   reveals the claimed pattern; two-dimensional theses get two-dimensional forms.
10. **VISUAL POLISH** — hierarchy, color-as-meaning, no label collisions, no shipped
    rendering defects; composition follows page-design.md (acts, cadence, register
    changes, caveat-ink discipline).
11. **VOICE & PROSE** — plain, active, confident; jargon translated; no seminar-creep,
    no prosecutorial tics, no hedge repetition, no bold-spam; a smart non-expert enjoys
    it and can answer all five audience-contract questions.
12. **READER PAYOFF** — the core insight is stateable in one sentence by the reader;
    actionable findings surfaced as findings (not filed as caveats); utility present
    (lookup value, decision relevance, "what to watch next").
13. **METHODOLOGY BALANCE** — transparency strong AND subordinate: apparatus below the
    story, caveats beside their charts, no register internals in reader prose, hub/README
    surfaces consistent with corrected pages.
14. **DISTINCTIVENESS** — only this outlet could have made this (its data, its access,
    its members); participation/share potential used where natural.

### Layer 3.5 — The naive reader (the only layer run WITHOUT source access)

**Operational protocol (2026-09-01, from the 22-page register that revised the first-read
law's root cause).** One cold reader per page; rendered prose only, forbidden from every
other file; NEVER the editor of the page (independence survives even inside one model:
an editor re-reading its own page is not a naive reader). The reader returns a REGISTER:
verbatim quote, one of eight types (UNDEFINED-TERM, VOCAB-DRIFT, JARGON-UNGLOSSED,
NUMBER-BEFORE-MEANING, CHART-SPEAK, OVERSTUFFED-SENTENCE, DANGLING-TENSION,
SCOPE-AMBIGUITY), severity 1-3 (3 = re-read or gave up), one line on what tripped them,
plus the page's point in their own words and what read CLEANLY (honesty both ways; a
review that finds something in every paragraph is not a review). The page metric is
severity-weighted stumbles per 1,000 words; rank pages by severity-3 count first, since
per-word load inflates on short pages. Run edited pages back through a FRESH reader as
the control: the first register validated itself when the two piloted pages ranked
most-readable under blind re-audit. Two hard-won cautions: readability formulas
exonerate this disease (FK graded the worst-bitten page easiest on the site), and the
register doubles as the editor's worklist, so quote verbatim or the editor cannot find
the sentence.

Every other layer is staffed by producers who have read the code, the data, and the
methodology before judging. Expertise cannot un-know itself, so those layers reliably
pass pages that a first-time reader cannot decode: a defined term still hides its
direction, and a reviewer who already knows the measure scores the definition as
adequate. This layer exists because that failure is systematic, not occasional. It was
discovered the hard way: a site that had passed an internal audit, an independent visual
inspection, a four-family external council and two red teams was then handed to a real
reader, who could not tell from an axis whether higher was better.

**Access rule, and it is the whole point: the reviewer gets the RENDERED PAGE ONLY** —
screenshots at both widths, or the live page. No source, no data files, no methodology
box, no brief about what the piece is trying to say. A reviewer who can read the code
is not a naive reader.

**The questions**, answered from the page alone:
1. What is this page claiming? Say it in one sentence.
2. For each number on the first screen: what does it mean, would a bigger one be
   larger-or-smaller, and would a bigger one be BETTER OR WORSE for the subject? Those
   last two are different questions and pages routinely answer only the first.
3. For each chart: what does up, down, left, right mean here? Which side of each
   reference line is which?
4. Name every word you would have to look up.
5. Where did you stop reading, or reread a sentence to parse it?
6. What did the page want you to do or believe at the end?

**Scoring**: any question the reader cannot answer is a defect on the page, never a
deficiency in the reader. Question 3 failures are usually constructed units
(writing.md); question 5 failures are usually sentence density or an unsignposted turn.

Run this before the portfolio pass, on at least one piece per body of work, and on any
piece whose subject is a constructed measure (a quotient, an index, a rank) — those fail
this layer by default.

### Layer 4 — Interface
- Run the project's automated gates (render, collision, claims, consistency, layout) if
  the repo has them — then remember their documented blind spot: a shape-only assertion
  can pass while the prose beside it is wrong by half. Gates check the floor, not the
  story.
- Interactive states: automated claims describe the page's DEFAULT state; for each
  non-default state (selection, filter, toggle) either test it directly or state the
  invariant that makes it safe ("the selector only re-emphasizes; it never recomputes"),
  and verify the table twin stays in sync with the current chart state.
- **Render and look** (mandatory) — TWO altitudes, because each hides what the other
  shows. (a) FULL-PAGE at ~1280px and 375px (tiled if the renderer caps height): judge
  composition, rhythm, register changes, the scroll's density waves. (b) **1:1 CROPS at
  native resolution** — minimum set: the hero, one representative band (kicker → chart →
  source line), the densest chart, and the mobile first paint. A full-page screenshot
  downscaled into a context window hides detail-scale defects — a 150px rail offset, a
  label collision, a sub-pixel ribbon — that are unmissable in a crop; this exact
  failure shipped once (a misaligned hero read as "verified" from the downscaled
  full-page view). In the crops, run the edge-tracking check: trace the LEFT edge of
  every text block down the page — the one-rail law (page-design.md) means you should
  see exactly one text edge; any stagger is a defect. Then READ everything with vision —
  never conclude "looks good" from code. An agent WITHOUT vision or screenshot tooling
  must not fake this: run every automated gate, state explicitly that visual review was
  NOT performed, and flag it as an open gate.
- **Chart visual critique** (per chart, on 1:1 crops of the figure unit — title,
  subtitle, graphic, source — at desktop AND its mobile re-layout). Five perceptual
  tests the structural checklist and geometry gates cannot run:
  1. **Two-second test**: shown the cropped figure cold, can a fresh reader state its
     takeaway in about two seconds? If the answer requires reading the surrounding
     prose, the chart is silent no matter what the checklist says.
  1b. **Direction test**: cover the prose and ask what higher, lower, right and left
     mean. If the answer requires computing a ratio in your head, or knowing which of
     two averages is the denominator, the figure states arithmetic where it owes a
     reading. Constructed units (ratios, indices, quotients, ranks) fail this by
     default unless their axes carry direction.
  2. **Squint/hierarchy test**: squinting (or downscaled), the story series is the
     dominant ink and the annotation is the second thing you see; context grays recede.
     If the eye lands on gridlines, a legend, or a context series first, the hierarchy
     is inverted.
  3. **Grayscale test** (deterministic: `magick crop.png -colorspace Gray g.png`): with
     hue removed, the story series is still distinguishable from context by luminance,
     weight, or labeling — the cheap floor for colorblind readers and print.
  4. **Isolation test**: figures travel — screenshots, slides, social cards. Out of all
     page context, the figure unit still identifies its subject, units, period, and
     source. If it needs the H2 above it, the chrome is incomplete.
  5. **Annotation-target test**: every leader line and callout lands ON the data it
     describes at rendered size; every reference line's label is readable where it
     sits; nothing points at the wrong mark after a re-layout.
  A chart failing test 1 or 2 is not "polishable later" — it is the piece's argument
  failing to transmit; fix the form, sort, emphasis, or annotation before ship.
- **Independent visual review before ship**: the builder's own render-and-look is
  necessary and not sufficient — a builder reads its screenshots looking for what it
  just tried to fix. A FRESH-EYES pass (a second agent or a human who did not build the
  page) reads the same full-page + crop set, INCLUDING the per-chart critique above,
  before publication. Same escape-hatch pattern as reporting: if no independent
  reviewer is available, say so and flag it, never self-certify it.
  Check specifically:
  - the first mobile paint of every chart contains its takeaway;
  - no clipped/truncated labels, no colliding annotations, no `undefined`/`NaN` text;
  - hierarchy reads correctly at arm's length (squint test: the biggest ink is the
    finding);
  - the scroll rhythm shows waves, not a uniform loop;
  - tables are collapsed to editorial scale;
  - the closing viewport is the closer, not an accidental block of reference matter or
    a style-bug blowup.
- Accessibility: keyboard parity, reduced-motion fallback, chart table-twins, alt/ARIA
  on figures, rendered text ≥12px. Operational floor for no-JS/no-interaction reading:
  every beat's CLAIM exists as HTML text (title/lede) that renders without JS — in-plot
  annotations reinforce the claim, they are never its sole carrier.

## Layer 4.5 — The depth audit (flip-risk + comparator census; periodic, portfolio-level)

Every other layer checks sentences against EXISTING derivations. This one asks what the
piece never fetched. Run it periodically over the body of work (and on any page a
reader's simple "double-check that?" question dents), with reviewers instructed to
ATTACK, not validate. Two questions per piece:

1. **Comparator census.** Which magnitude questions does the reader naturally ask?
   Which does the piece answer, which does it decline honestly, which does it skip
   silently? For each decline or skip: what SINGLE additional pull would most change
   the piece's meaning, and what would it cost to fetch? Prefer same-instrument
   comparators (the source's own national/state/peer series) — most of the shared
   bias differences out. Incident that named this layer: a churn page's declared
   "no comparator" stood for weeks while one keyless call to the same source held
   an answer that reversed the page's emotional register.

2. **Flip test.** Can any headline interpretation REVERSE under a reasonable
   alternative cut — a different denominator, window, or basis; within-group instead
   of aggregate (Simpson's); excluding the largest unit; the other plausible
   seasonal alignment? This is stage 3's stress-test list applied retrospectively
   and adversarially, by a reviewer scored on flips found, not on agreement.

3. **The misreading audit** (added 2026-09-01, derived from one reader's questions
   over a single session — every test below is a defect he found in shipped or
   about-to-ship prose, so treat the list as an incident record, not a checklist
   invented at a desk). The other two instruments assume the sentence reads its own
   measure correctly and ask what is missing. This one attacks the reading itself.
   Run it sentence-by-sentence on every headline, standfirst, H2 and closer.

   **A. Does the sentence read its own measure correctly?**
   - **Stock vs flow.** Is a cross-sectional measure being spoken as behaviour over
     time? Incident: "nine in ten jobs are held by people who live here" (a commuting
     snapshot) became "people stay" (a retention claim the data cannot support, and
     which the same site's churn page contradicts).
   - **Gross vs net.** Is a gross flow being read as a net requirement? Incident: a
     plant's ~58 replacement hires a year became "the training pipeline must supply
     58" — off by an order of magnitude, because most hires are people already in the
     industry moving.
   - **Aggregate vs stratum.** Is a whole-population rate being applied to a
     sub-population that certainly differs? Incident: a ~10%/quarter industry churn
     rate applied to "floor jobs" — the same source's age bands show a TENFOLD spread
     in hire rates, and the instrument has no occupation dimension at all.
   - **Denominator scope.** Would a reader guess the same denominator the number
     uses? Incident: "four papers in five are led from here" detached into "80% of
     world polymer science is from Ohio"; the denominator was the region's own
     attributable corpus.

   **B. Can this instrument see what the sentence implies?**
   - **Census completeness.** What can this source structurally NEVER see, and does
     the page say so? Incident: a training census built on federal completions data
     cannot see non-credit training, employer programs, or registered
     apprenticeships — a silence that reads as zero.
   - **Label vs substance.** Are we measuring the labelled thing while the real thing
     is unlabelled? Incident: counting "polymer-named" programs in an industry whose
     workforce is mostly trained under machining, welding and manufacturing codes —
     and a portfolio named "Sustainable Polymers" whose every application line says
     rubber.
   - **Mechanism gap.** We have the what; is the why in this data at all, or does it
     need a human? Incident: the region's most durable technician program ran 25
     years and stopped; the file records the stop and has no cause field. Say so, and
     name the call.

   **C. Would a knowledgeable outsider believe it?**
   - **Plausibility prior.** Does the magnitude survive a world model? A reader who
     says "there is no way" is running a prior against your number — either the
     number is wrong, the scope is missing, or the fact is genuinely remarkable and
     needs its context stated. All three happened in one session.
   - **Status and provenance.** For any status claim (proposed / awarded / active /
     closed), verify against the PRIMARY record, not a secondary page. Incident: a
     research centre was called "proposed" on the strength of a project website; the
     funder's award API showed it awarded, sized, and its lead institution changed.
   - **Scope escalation.** Is this story a special case of a bigger one? Incident: a
     single-molecule story (6PPD) was the sharpest worked example of a
     portfolio-level finding nobody had written.

   Output: for each flagged sentence, the test it fails, the correct reading, and
   whether the fix is a rewrite, a scope clause, a stated limit, or a call to a human.

Output: a ranked register — flip-risks first (urgent: a flip is a wrong published
interpretation), then comparator gaps by value-per-fetch. Fold results into the
piece's methodology box or a comparator-debt ledger; a decline with no ledger entry
is a silent skip.

## Layer 2.6 — Documentary corroboration (added 2026-09-01, piloted before adoption)

Data files hold *what* and *when*. They almost never hold *why*, *who decided*, or
*what was said*. Where a piece names an institution, a program, a company or a
person, the public documentary record — news reporting, press releases, archived
catalogs, board minutes, regulator inventories — is a second evidence stream the
piece is otherwise ignoring. Run this whenever a page asserts, implies, or invites a
causal or status claim about a named entity.

Its first live run refuted a premise the dataset had licensed: a training program the
completions data showed "ending" in 2015 had in fact **contracted**, and its
successor certificate is still offered a decade later. Nothing in the data could
have caught that, and the piece was one sentence from publishing it.

**Seven disciplines, six of them written by the pilots themselves:**

1. **Verify the event before explaining it.** Before researching *why* something
   ended, establish *that* it ended. A dataset's "last observed year" means the
   record stopped, not that the thing stopped. Make this the first move; it is the
   negative control for the whole layer.
2. **Archived institutional records outrank news** for existence-and-date questions.
   A college's own catalog, snapshotted, brackets a change harder than any article.
   (Practical note: `web.archive.org` may be blocked to fetch tools; its CDX API
   works over plain HTTP and returns status codes and timestamps.)
3. **No URL, no citation — however good the text looks.** A pilot met a fluent,
   specific, repeatedly-surfaced passage with names and quotes whose originating
   article it could not locate, and correctly refused to cite it. Search-result
   summaries are not sources.
4. **Quarantine interested parties.** An institution reporting its own program's
   numbers is a primary record of its claim, not evidence of the fact. Mark such
   figures visibly and never let one anchor a headline.
5. **Attribution is not causation.** "A professor said the fall was caused by X"
   establishes that the professor said it. Render it as speech, with speaker and
   date, and keep the causal question open unless the evidence closes it.
6. **Every citation carries a date of record.** Undated institutional pages get a
   retrieval timestamp or an archive snapshot instead; a live page with no date is
   not a dated fact.
7. **Publish the null.** "The public record does not explain it" is a finding, and
   the most valuable output of both pilots was a documented absence. A workflow that
   only rewards positive findings will quietly convert absences into speculation —
   so the null gets written into the piece, not dropped.

Output: for each claim tested, the sources with URL, publisher, date and source type
{news report · press release · institutional record · trade press · statistical
publication}; what each ESTABLISHES versus SUGGESTS; single- or multi-sourced; and an
explicit unestablished list that survives into the page's own methodology.

## The claims apparatus — what it proves, and the three laws that keep it honest

Added 2026-09-01 after a cross-family council refuted a proposed fix and named the
real one. A machine-checked claim pairs a published sentence with an assertion run
against the SHIPPED DATA. It proves the sentence is consistent with the file behind
it. **It does not prove the sentence is true about the world**, and a site that
presents a passing claim suite as journalistic integrity is making the largest
overclaim on its own pages. Three laws follow.

1. **THE FLAG-NAMING LAW.** Every derived status label must BE its operational
   predicate, or display that predicate immediately beside the short form. Not
   "ended" but "no award recorded under this code in 2023". Not "failed" but "filed
   ten or fewer completions". Push it into the data layer too: no `is_closed`, no
   `ended` — `zero_awards_recorded`. Naming the variable after the measurement makes
   the false sentence hard to write, which is cheaper than catching it later. This is
   the highest-yield intervention two independent families converged on.

2. **STATE THE PROMISE ACCURATELY.** Never write "N verified claims" or "N sentences
   that can be proved wrong" when the assertions run against your own shipped data.
   Write what is true: N sentences carry a machine-checked condition tying them to
   the data they came from — a consistency check, not a check against the world.
   Point at the corrections log for what it did not catch.

3. **SAMPLE THE WORLD ON A SCHEDULE.** Internal assertions cannot reach an open
   world: a database is closed, reality is not. Make documentary corroboration
   (Layer 2.6) a RECURRING gate — a fixed fraction of claims per period checked
   against primary sources — rather than a heroic one-off. It is the only instrument
   that catches an inference drawn from a gap in the data.

**And two rules about building gates at all**, both learned by proposing bad ones:
- **No gate ships on argument.** Retro-run a candidate against the frozen
  pre-correction corpus and report true positives, false positives and false
  negatives; mutation-test it with synonyms and with named-but-wrong denominators. A
  vocabulary ban that dies to "wound down" and "went dark" is not a gate.
- **A new free-text field decays into boilerplate** exactly as the last one did.
  Prefer a naming rule that makes the error unwriteable over a field that asks an
  author to describe the error they are not seeing.

**Audit the mappings you already have.** Classify every existing claim: BINDING (the
assertion tests what the sentence asserts) · PARTIAL (it tests the number while the
sentence also asserts scope, status, cause, completeness or comparison) · DECORATIVE
(cannot fail for any reason connected to the sentence's truth) · INVERTED (passes
more readily as the sentence gets wronger — the "no public record exists" class,
where an absence is confirmed by not looking). Partial and inverted mappings are how
a green suite coexists with a false page.

## Layer 5 — The portfolio pass (run on the body of work, not the piece)

Some defects are invisible page by page and obvious across a site. Run this whenever a
third piece ships, and before any batch publication:

- **One stencil, many stories?** Line up the pages' first screens. If a labor-flow story
  and a price story share a wireframe, the template is doing the composing. Exemplar
  desks share a standard of proof, not an outline: vary the archetype (the library
  exists for this), the opening visual, and the section rhythm piece to piece.
- **Is the verification the personality?** A methodology section on every page is
  correct. A repeating apparatus headline, a checksum section presented as a finding,
  and "every number is re-checked" in the body of each piece read to outsiders as an
  institution performing rigor rather than reporting. State it once, on an about/methods
  page, and let the pieces carry one compact source line each.
- **Reporting-rung distribution**: count pieces at rung 1 versus rung 3. All-rung-3 is a
  deficit (see writing.md's portfolio limit).
- **Instrumentation audit** (both publication modes): grep the site for the publisher's
  own name in coaching constructions ("the sentence X can carry into…", "the argument X
  takes to…", "the one to lead with"). Each hit hands a reader the machinery pointed at
  them. Sort the hits by direction and keep the ones that CORRECT the publisher ("X
  should retire the word 'cheap'") — those earn credibility; cut the ones that ARM it.
- **Self-inventory audit**: a body of work that counts itself must derive every statement
  of that count from one computed value. Audited once, a hub published four different
  counts of its own pages in four places — a hero line, the rendered card grid, a
  hardcoded literal in an interaction, and a closer — and a site whose argument is that
  every number is checkable cannot ship four counts of itself. Grep for the number and
  its spelled form; anything hand-typed becomes a derivation, and deliberately unlisted
  artifacts are excluded by the same rule that unlists them.
- **Navigation must survive JavaScript.** An index or hub page is not an article: its
  links ARE its content. Cards or lists built entirely by script mean that with JS off,
  or on one failed fetch, the front door to the whole body of work silently contains no
  link to any of it. Ship the anchors as HTML and let script decorate them. Test it by
  loading with JavaScript disabled and counting links, not by reasoning about it.
- **Range audit** (institutional mode especially): a body of work published to
  demonstrate capability demonstrates less of it when every piece renders identically.
  Count distinct archetypes, distinct opening visuals, and distinct closer types across
  the set; one stencil twelve times understates the shop.
- **Closer variety**: if most closers restate the hero stats, the endings are recaps, not
  kickers. At least half should land a decision, a consequence, or a next question.
- **Headline set**: read the twelve headlines alone, in a list. Findings should dominate;
  a run of topic labels or metric announcements means the findings are living in the
  standfirsts, which is the wrong order.

## Pre-publish checklist (final pass)

- [ ] Pitch's single point survives verbatim somewhere in hero or closer.
- [ ] Hero: finding-headline, stakes-bearing standfirst, substantive stat row.
- [ ] Every chart passed the per-chart annotation checklist (chart-craft.md).
- [ ] Human-scale beat present.
- [ ] "Compared with what" answered for every headline number.
- [ ] Uncertainty/attribution lint pass done on the full text.
- [ ] Methodology box present, scaled to consequence, with exact filters and
      contestable-choice notes.
- [ ] Provenance sentence in the first third.
- [ ] Mobile re-layout verified per chart at 375px (not just "it scrolls").
- [ ] Desktop + mobile screenshots rendered and actually read.
- [ ] Corrections/versioning policy holds: no silent edits; README/hub cards match the
      current page.
- [ ] Named: the piece's one concrete weakness to fix next.

## Review discipline notes

- Verify the verifier: before trusting any automated check, run it against a case whose
  answer you already know. A gate that has never failed is unproven, not perfect.
- **Know each gate's blind spot, and name it when you cite the gate.** Observed in live
  use: collision gates that only measure the desktop render report "no collisions" on a
  page with two visible text collisions at 375px; layout gates that check centre axes
  pass a hero whose blocks sit on three different left edges; a claims assertion whose
  tolerance is shape-only passes while the sentence beside it is wrong by half. "All
  gates green" is a floor, and the sentence that follows it should say which defects
  those gates cannot see.
- **Exemplar hygiene.** When house law changes (a new style ban, a new layout rule), the
  worked exemplars written before it now contradict it, and every agent that imitates
  them inherits the contradiction — this surfaced repeatedly as "the exemplar uses the
  punctuation the law bans." On any law change: re-lint the exemplars, or mark them
  explicitly as pre-law with a pointer to what supersedes them.
- A result that flatters the piece right after a refutation deserves MORE suspicion —
  ask what changed between the runs.
- Reviews are cheapest as separate passes with separate mindsets (correctness pass,
  reader pass, hostile-reviewer pass). Fusing them averages away the adversarial edge.

### Layer 1.5, instrument 4 — the universal-quantifier sweep

**One grep, run over headings only, then one test per hit.** Headings are where a page
makes its promise, and a promise is the one sentence nobody re-derives when the data
grows underneath it.

```bash
grep -rnoE "<h[12]>[^<]{0,120}</h[12]>" --include=index.html . \
  | grep -iE "<h[12]>(all|every|each|the (full|complete|whole))\b"
```

For each hit, ask the only question that matters: **what is the set, and can you count
it?** Then count it. Three outcomes:

- **True.** Say so and move on. Most will be.
- **True but unscoped** — the heading over-promises and the next sentence rescues it.
  Acceptable when the scoping is genuinely adjacent and a skimmer meets it immediately.
  Do not "fix" these; the page already does the honest work.
- **False.** The set has grown, or was never what the heading said. Repair the heading,
  not the body — the body is usually already right, which is exactly why nobody noticed.

**What this found on its first run** (22 pages, eleven hits, three real defects — and
every one of the three sat on a page whose subject is the method itself):

- *"All fifteen datasets, with what each one cannot tell you"* — the site drew on
  twenty-four. The register behind the heading had gone stale by nine sources and five
  pages, and no gate could see it, because every gate checked the page against the
  register and the register was the thing that went stale.
- *"Every number on this site carries a written condition that ties it to its source"* —
  false. The site carries 519 claims; it contains far more than 519 numbers.
- *"Every sentence here is tied to its source by a check that can fail"* — false in the
  same way, on the hub, which is the first sentence of the project a stranger reads.

**The repair pattern, which is the useful part.** Do not retreat to a hedge
("most numbers", "many sentences"). Hedged promises are weaker AND still unverified.
Find the quantifier that IS universal and check it. Here, all 545 claims carried a
`falsified_if` with no exceptions, so the true heading — *"Every claim on this site names
the condition that would prove it wrong"* — was **stronger** than the false one it
replaced, and it is now a one-line assertion the build can enforce.

That is the general rule: **a false universal is usually hiding a true one nearby.**
Look for it before you weaken the sentence.

**And then check that the true one is also honest, which is a separate test.** The
repair above was wrong on its first attempt, and an existing gate caught it. The heading
went out as *"Every claim names the condition that would prove it wrong"*, on the
reasoning that all 545 claims carry a falsifier, so the universal was verified. It was
verified and still an overclaim: a claim's condition runs against **the data the page
shipped with**. It can establish that a sentence stopped matching its own file. It can
never establish that the sentence is wrong about the world. Those are different
statements, and the second is the one a reader hears.

The site had banned that exact phrase hours earlier, after a cross-family review named
it the largest overclaim on the site and after a transposed classification code moved a
published series by half **while its assertion kept passing** — the assertion was true
of the wrong number and of the right one. The gate then caught the person writing the
repair reintroducing the banned sentence.

Two things to take from that:

- **A quantifier can be literally true and still overclaim, because the overclaim lives
  in the verb, not the quantifier.** "Every claim carries a condition" is true. "Every
  claim carries a condition that would prove it wrong" adds a promise the mechanism
  cannot keep. When you repair a universal, re-read the whole predicate, not just the
  count.
- **Encode the ban, not the instance.** The reason this was caught at all is that
  somebody turned "do not make this specific overclaim" into a regex a build runs. A
  house rule written only in a review document would have caught nothing, because the
  person about to break it was the person who had just read the document.
