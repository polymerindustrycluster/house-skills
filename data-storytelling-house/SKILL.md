---
name: data-storytelling-house
description: |
  HOUSE-BUILT room-artifact craft: turn verified evidence into presentations,
  scientific explanations, technical reviews, pitches, board/funder asks, briefings,
  workshops, executive summaries and teach-back cards for a specific audience.
  Use to prepare or audit a talk/deck, explain a mechanism, or adapt the same finding
  for audiences with different knowledge and decisions. Duarte story structure,
  Schwabish presentation practice, conditional scientific explanation and evidence
  review, audience translation, and rehearsal. Use for assembled rooms and their
  readable briefs, memos and Slidedocs. Articles and evidence pages go to
  data-journalism-house even for known readers. This skill never edits evidence
  artifacts. Pure chart/figure requests go to pic-charts. Recorded or forwarded room artifacts retain their
  declared distribution safeguards.
---

# Data Storytelling — house skill

Turn evidence into a story that moves a room. The unit of work is not a page and not a
chart: it is **one audience, one idea, one outcome**. Everything in this skill serves the
moment after the talk ends — what the room repeats, and what the room does.

The backbone is Nancy Duarte (*Resonate*, *DataStory*, *slide:ology* — page cites in
[references/duarte-frameworks.md](references/duarte-frameworks.md)). The conditional
modules below add source-located Schwabish guidance and scientific communication
research; each distinguishes source recommendations from house adaptations.

## THE BOUNDARY LAW (read first, non-negotiable)

**This skill never touches an evidence page.** The house runs two lanes with a one-way
street between them:

- An **evidence artifact** (evidence-room page, data article, methodology box) persuades
  by being *checkable*. Its craft is `data-journalism-house`. It is built to survive a
  hostile reader, and its trustworthiness is the asset the storytelling lane spends.
- A **room artifact** (talk, deck, ask, teach-back, exec summary) persuades by being
  *felt and repeated*. Its craft is this skill. It cites the evidence lane; it never
  edits it.

The street runs one way: story artifacts draw numbers FROM evidence artifacts. If the
story wants a number the evidence does not support, **the story changes, never the
number**. Incident: a talent beat claimed "everything international" for punch; the
derivation said two-thirds of international endpoints rose while domestic held 30 — the
beat was rewritten, the data untouched.

**The one exception has a REFER path, not an edit path.** If, while building a room
artifact, you find an evidence-lane number that appears to be WRONG (not merely
inconvenient): do not edit it, do not quietly work around it. File a dated finding to
the journalism lane (the evidence repo's issue/register, or surface it to John), halt
the beat that depends on the number, and build on the rest. A storytelling session
that silently routes around a suspected evidence error leaves the error live for the
next reader. A room that later checks the evidence room and
finds the deck agreed with it is the entire trust model of this house. Persuasion
machinery aimed at an evidence page is a firing offense for this skill: refuse and route
to `data-journalism-house`.

## Workflow

Stages in order. Stages 1 and 2 are HARD GATES — a failing answer stops the build.
Gate outcomes are PROCEED / KILL / DOWNSHIFT (gate 1 only — see below) /
NEEDS-EDITOR-CALL. NEEDS-EDITOR-CALL means: surface the call to John (or whoever
commissioned the artifact) and wait; running unattended, proceed with the stronger
reading labeled provisional in the working file, exactly as the journalism lane does.

**Print path.** A written room artifact (one-page ask, executive summary, Slidedoc)
runs stages 1–2, then swaps stage 3's sparkline for the **three-act structure**
(Situation — but/and — Complication — so — Resolution; frameworks §3), keeps stages
4 and the skeptic's apparatus (frameworks §11), skips 5–8's live-delivery rules, and
runs the gauntlet's print variant (review-gates Layer 1). A reader can leave
whenever they want, so print leads with the conclusion; only a live room earns
suspense. Where `typst` is present, build print artifacts from the form templates in
`templates/typst/` (see Toolchain below) so the form's required blocks are checked at
compile time rather than by a reviewer's eye.

### 1. ROOM AUDIT (gate)

Load only the reference that the task needs; combine them when their jobs overlap:
- Explaining an unfamiliar mechanism or teaching a scientific concept →
  [scientific explanation](references/scientific-explanation.md).
- Judging whether scientific findings support a claim or next step →
  [scientific evidence review](references/scientific-evidence-review.md).
- Adapting evidence for different audiences, or serving a mixed-knowledge room →
  [audience translation](references/audience-translation.md).
Ordinary pitches and status updates need none of these unless that work arises.

Before any content: profile the actual audience — the six-dimension hero profile
(*Resonate* p. 65: lifestyle, knowledge, motivation, values, influence, respect) or the
  seven-question map (*HBR Guide*), both in
[references/duarte-frameworks.md](references/duarte-frameworks.md). Then write two
lines:

- **The room**: named, specific, and CHECKED against the commissioning artifact —
  "GAC internal staff, all departments, mostly non-technical, Tuesday" — not
  "stakeholders," and not what you assumed. (This rule's own first draft hardcoded
  "chamber members" into a room that was actually all-staff; the wrong room inverts
  every role and leaks into beat selection.)
- **The action**: what a specific person in that room can DO afterward, sorted by
  Duarte's four action roles — doers (do the work), suppliers (fund/resource it),
  influencers (evangelize it), innovators (build on it). Give each role **actually
  present in the room** its own verb — Duarte's "at least one action suited to each
  type" (*Resonate* p. 42) assumes the type is in the audience; manufacturing an
  innovators' ask for a five-person board dilutes the one ask that matters.
- **The distribution**: room-only / recorded / posted-after / forwarded-freely. This
  line sets the BUILD CONTRACT, not a review that happens later — spoken words cannot
  be un-said once a recording exists, so a post-hoc review of a recorded talk is
  structurally impossible. Room-only: full room craft. Anything beyond room-only: the
  constraints bind from stage 2 onward — every claim survives a hostile anonymous
  replay (uncertainty verbs at evidence tier, traceable numbers, no dramatization
  that misstates), and the journalism-lane check runs on the WORKING FILE before
  delivery, never on the recording after. A posted deck or transcript is a separate
  release artifact: it may be rebuilt and reviewed on its own before posting. When
  the room craft a talk needs and the public contract it must carry genuinely
  conflict, that is a NEEDS-EDITOR-CALL, not a workaround.

**Gate-1 outcomes, verbatim:**
- For a room-artifact request with no identifiable room, route by audience: anonymous
  public readers → the journalism lane; a known internal readership → the print path
  (a memo or Slidedoc is a room artifact whose room reads instead of sits); genuinely
  neither → say so and decline the story framing.
- A learning objective with in-room practice, or an evidence judgment, is a valid
  outcome; it does not need a funding ask. Declare the corresponding room shape.
- No action, learning objective, or evidence judgment → DOWNSHIFT to the FYI briefing form
  ([references/room-artifacts.md](references/room-artifacts.md)): gate 2 relaxes to a
  summary sentence (accurate, not arguable), stages 3/5/8 are skipped, and the
  gauntlet runs only Layers 2 and 3. A briefing dressed as a story is a failure; so
  is a real ask dressed as a briefing to dodge the gates.
- The action asks the room to *agree* rather than *do* → sharpen until a body moves.
  Precision, because this criterion once misfired in review: **a vote, a signature, an
  approval, a recorded resolution IS a body moving** — those are the skill's canonical
  asks. "Agree" means passive nodding with nothing scheduled and nobody named.

**Then declare the ROOM SHAPE.** The default workflow below is built for the
pitch/ask; other rooms exist, and forcing them through a persuasion arc is
malpractice. Declare one of these in the working file; each names what it changes and
keeps everything it doesn't name:

- **Pitch / ask** (default): the full workflow as written.
- **Executive working session** (interruption-driven; *DataStory* Ch. II is the
  governing text): DataPOV stated in the first minute — the decision first, the
  argument behind it. Three acts replace the sparkline; prepare content for HALF the
  slot; pre-wire the sponsor (their hot buttons, where they'll dig, likely
  counterarguments); expect interruption and treat it as engagement; backup material
  for every WHY. STAR optional; no manufactured bliss — close on the decision and its
  next step.
- **Teach-back / workshop**: the aim is understanding and practice, not an ask. A
  specific learning objective replaces the *arguable* Big Idea (bar: accurate and
  testable). The what-is budget expands to whatever comprehension needs; the engine
  becomes Feynman's inside-what-is contrast — alternate fact and context, itemized
  signal and wonderment (*Resonate* pp. 130–133). The per-role ask is replaced by the
  room DOING the thing in the room; teach-back cards are the native artifact.
  STAR and bliss are optional, never manufactured; close on the concept's use or
  learning objective. Zero numbers selected for recall is valid. For scientific
  concepts, test application separately from headline recall.
- **Scientific review**: the outcome is a calibrated judgment of a finding, including
  "not yet established." An accurate question and bounded conclusion replace the
  arguable Big Idea. Use question → evidence and material methods → limits → judgment
  or next test; no forced sparkline, STAR, or bliss. Follow the evidence-review
  reference. Scientific explanation within any room shape uses the explanation
  reference without turning the entire presentation into a lesson.
- **Post-mortem / bad news / compliance**: no STAR, no bliss, no persuasion arc —
  tone-deaf at best, hazardous at worst. Three acts + the skeptic's apparatus;
  Duarte's ill-fortune rule governs: know the cause, own it, address it directly and
  emphatically (*DataStory* Ch. XI). Anything with legal exposure is
  NEEDS-EDITOR-CALL by default.
- **Panel / hostile Q&A**: the prepared asset is the sound-bite set and the IF-ASKED
  cards, not a deck; the sparkline governs only your longest single answer.
- **Showcase / internal spotlight**: a capability pitch in a status-report slot. The
  pitch/ask arc applies, but the ask collapses to one doer verb (executable without
  anyone's approval) plus one supplier decision with a date; no manufactured asks for
  absent roles; the STAR is MANDATORY — a showcase nobody retells produced nothing;
  the real payoff is the next budget conversation, not the room's same-day yes.
- **Briefing**: the DOWNSHIFT above.

The gauntlet (stage 9) checks the artifact against its DECLARED shape — a working
session is not failed for missing a STAR it was right not to have.

### 2. BIG IDEA (gate)

One complete sentence carrying (a) your unique point of view on the subject and (b) what
is at stake for THIS room. Duarte's two-part test, operationalized:

- **Complete sentence with a verb.** "NE Ohio's polymer economy" is a topic. "NE Ohio's
  polymer economy is quietly bleeding the jobs it thinks it is keeping" is a Big Idea.
- **Arguable.** If no reasonable person in the room could hold the opposite, it is a
  fact, not a point of view — true, and inert. Stake it.
- **Stake named.** The sentence, or its immediate follower, says what the room gains or
  loses.

For data-heavy recommendations, form a **DataPOV** (*DataStory* Ch. III): the action
the evidence supports and its stakes, in a complete sentence. Quantify stakes only
when verified evidence supports them; do not invent an impact forecast. House preference,
consistent with her figure examples though not stated as a rule in her text: the
sentence names the statistical outcome you want ("…could increase sales by 40
percent"). By default the DataPOV titles the deliverable and is the third act of its
summary; a room where leading with the conclusion would close ears before the
argument (a skeptical board hearing the counter-position first) may hold it back — a
declared choice in the working file, not a drift. Write the Big Idea at the TOP of the working file.
Every beat that follows must serve it; a beat that doesn't is cut no matter how good the
chart is. **Kill criterion:** if after two attempts the Big Idea is still a topic label,
there is no talk yet — there is analysis still to do, or an audience still unchosen.

### 3. SPARKLINE STORYBOARD

Structure the middle as Duarte's alternation between **what is** (the room's present,
acknowledged honestly, in their terms) and **what could be** (the future the Big Idea
opens). Mechanics in [references/duarte-frameworks.md](references/duarte-frameworks.md);
craft rules:

- **Open on their what-is, not your what-could-be.** The audience must first hear their
  own reality described accurately — it is how a mentor earns the right to propose.
  Duarte's guide: the what-is opening takes **about 10% of total time** (*Resonate*
  p. 38). Two thresholds, two jobs — be precise about which is which: 10% is the
  DEFAULT TARGET, overridable for an unfamiliar or technical room with the reason
  stated in the working file; the opening THIRD is the FAILURE LINE no override can
  cross, because a gap the audience hasn't felt yet is a lecture. A reviewer checks
  the declared target, and fails only the third. The turn lands explicit, not
  muddled. The turn is a state change made by juxtaposition, never an
  announced transition ("now let's look at what could be" is the contrived-gap failure
  the *HBR Guide* names).
- **Generate beats from the three acts.** Draft the three-act summary first —
  Situation, *but/and*, Complication, *so*, Resolution (*DataStory* Ch. IV) — then
  explode it across the sparkline: acts 1–2 become what-is beats, act 3 opens the
  what-could-be run, and the conjunctions are the turn hinges. Act 2 must contain the
  measurement that will change if the room says yes.
- **Alternate.** A talk that states the dream once and then defends it for twenty
  minutes flatlines. Return to what-is (the obstacle, the cost, the skeptic's voice)
  and re-lift. Mark every beat card `IS` or `COULD`; in the MIDDLE — between the first
  what-could-be and the call to action — a run of three or more of the same mark is a
  sag flag, not an automatic fail: a deliberate stack (two facts and a constraint
  earning one pivot) is legal when the run is marked INTENTIONAL with a line of why.
  Unmarked runs get restructured. (The opening what-is run and the closing bliss are
  sustained by design; the rule does not apply to them.)
- **End in new bliss**: the last beat is the world WITH the idea adopted, concrete
  enough to picture, plus the per-role calls to action from stage 1. Never end on the
  evidence, the methodology, or "questions?" — the last thing said is the thing carried
  out the door.
- Storyboard on **cards before slides** (one claim, one beat, `IS`/`COULD` mark, the
  evidence it draws on, the sentence the room should repeat). Cards are cheap to
  reorder; decks calcify.

### 4. EVIDENCE SELECTION — the hero filter

The audience is the hero; the presenter is the mentor with a gift. Select evidence
accordingly:

- **The hero test, per beat**: does this beat change what the ROOM knows, feels, or
  does — or does it display what the PRESENTER did? Effort-display beats ("our
  process", "what we went through") are cut or compressed. Keep methods, controls,
  comparisons and conditions when they determine whether the audience should trust
  or use the result; apply the scientific-evidence-review reference's relevance test.
- **Numbers arrive scaled to the room.** Every load-bearing number is translated into
  the room's own units before or beside its raw form, using Duarte's three devices —
  **Scale** (contrast with familiar sizes), **Compare** (a same-magnitude number from
  another domain), **Context** (name what drove the ups and downs) (*Resonate* p. 117,
  "Numbers rarely speak for themselves"). Incident: "$1,365/week" did no
  work; "$71,000 a year, in a county where the average job pays half that" became the
  gap the whole talk turned on. The journalism lane's first-read law — house doctrine,
  not Duarte — applies with the volume up: interpretation BEFORE magnitude, one claim
  per sentence, no chart-speak. A listener cannot re-read.
- **Traceability**: every number in a room artifact traces to a governed source — an
  evidence page, a verified claim file, or an external source that has itself been
  verified (primary, dated, checked — a bare citation is not verification; a number
  you only read somewhere is carried as "reported by X," never as fact) — and the
  artifact carries a sources line (footer or backup slide). Numbers that failed verification are
  banned no matter how vivid. Incident: a demographics count (1,451) was vivid,
  contaminated, and cut.
- **An unbenchmarked magnitude number arrives pre-loaded with its scariest reading.**
  Before spending one in a room, check whether the evidence lane answered "compared
  with what." If the page declined ("no comparator exists"), the room artifact
  carries the decline OUT LOUD — "we can't yet say whether that's a lot" — never
  silently letting the room supply its own comparison. Incident: a churn rate with a
  declared no-comparator was heard as "catastrophic" by the first cold listener; the
  comparator, fetched later, showed the region at the FAVORABLE end of its peers.
- **Three that RECUR.** A room retains roughly three numbers, so the cap governs
  RETENTION, not inventory: at most three numbers are asked to be remembered —
  repeated across beats, room-scaled, said at the peaks. Structural numbers (a
  WHAT/WHY/HOW grid's metrics, a table in the print path, NUMBER GUARD rails, backup
  slides) carry as many as the structure needs, each traceable, each appearing where
  it works and nowhere else. The failure the cap prevents is asking the room to
  remember eight things and being quoted on none. Scope note: the cap applies to the
  SELECTED RUN-OF-SHOW — a beat library or menu is an inventory, neither structural
  nor a retention ask, and cannot be audited against the cap until its setlist is
  frozen. Freeze the setlist first.
- **For decision-maker rooms**: use the room's actual decision criteria and supported
  stakes. Where business outcomes apply, connect to Duarte's executive levers
  (revenue, profit, cost, market share, time-to-market, retention, or risk) and lead
  with a supported performance action, nesting process steps beneath it. A scientific
  decision may instead authorize a test; never invent business impact to justify it.

### 5. STAR MOMENT

Plan **one** Something-They'll-Always-Remember: the moment the room retells at dinner.
Duarte's five types — memorable dramatization / repeatable sound bite / evocative
visual / emotive storytelling / shocking statistic (*Resonate* p. 148) — are detailed in
[references/duarte-frameworks.md](references/duarte-frameworks.md). House rules:

- **One UNREPEATED peak per talk at our lengths.** Duarte's stated floor is one
  intentional STAR per presentation; she documents Jobs using four across a keynote
  of "an hour and a half or more." Provenance honest: the ONE cap is house doctrine
  for our typical 15–40 minute rooms, where a second peak competes with the first.
  Definitions that keep the cap enforceable: a line said three or more times is an
  **anchor** (the talk's repeated sound bite), not a STAR — anchors are exempt from
  the cap by definition, so rule 7's mandatory sound bites never collide with it. A
  second STAR is earned two ways: a slot past an hour, or a working file that
  declares TWO REGISTERS (an institutional stake and a personal one) — then one STAR
  per register, never two in one.
- **Built from true material, stated at its true scope.** A STAR moment is the
  emotional delivery of a verified fact, never a manufactured stunt — and because it
  is the beat most likely to be retold, screenshotted, and checked, it obeys two extra
  laws. (a) **Scope discipline**: say exactly what the source says. Worked example:
  "in 2023 the University of Akron — the world's flagship polymer school — graduated
  two polymer undergraduates," delivered as count-then-silence — one institution, one
  year, undergraduates only; the first draft of this very rule said "the region…a
  year," which the source does not support, and paired it with a headcount from a
  different page with nothing guarding the pair. The STAR is where that kind of drift
  is most expensive. (b) **The mixed-tier law**: when a talk spans evidence tiers
  (gated pages plus prototypes), the STAR comes from the HIGHEST tier present — never
  from the least-verified material in the room — and any tier caveat that must
  survive forwarding goes ON the slide, not in the mouth.
- Place it late. Duarte states no timeline rule; her measured cases put it in the back
  half at an emotional peak (Zander's Chopin moment lands two-thirds through; the *HBR
  Guide* calls it "climactic"). House placement: the last what-could-be turn before the
  close — never the opening minute (unearned), never during the ask (competes).

### 6. SOUND BITES — the room-repeats-it law

**A beat the room cannot repeat an hour later did not happen.** For every load-bearing
beat, write the exact sentence you intend the room to carry — short, concrete, no
subordinate clause. The sound bites are the ONLY verbatim lines in the talk: anchor
lines are said word-for-word, everything around them flexes with the room — a fully
scripted talk trades presence for precision it doesn't need. and deploy Duarte's three retention mechanics: say it more than
once, pause long enough to write it down, and put the words on a slide (*Resonate*
p. 152; the Jobs case is p. 163 — "reinvent the phone" five times, matching the press
release, and it ran as next-day headlines). A sound-bite slide carries the phrase
ALONE — nothing else — so projecting it never collides with the glance test or the
listen-or-read law. Test: hand the beat list
to a cold reader for sixty seconds, take it away, ask what they'd tell a colleague.
Beats that don't come back get rewritten or cut. This is the house **teach-back card**
discipline (format in [references/room-artifacts.md](references/room-artifacts.md)):
if the presenter needs notes to say it, the room has no chance of repeating it.

### 7. SLIDES (if the artifact has them)

Slides are scenery, not script. slide:ology floor, enforced:

- **Glance test**: every slide's point lands in ~3 seconds. If the room must read
  dense prose while you talk, redesign the delivery. This checks the takeaway and
  visual hierarchy, not mastery of an unfamiliar mechanism. For scientific
  explanations, plan a guided sequence and separately test understanding.
- **One idea per slide.** Slides are free; attention is not. Split rather than stack.
- **No slideuments.** Duarte's thresholds: >75 words on a slide is a document, ~50 is
  a teleprompter (*slide:ology* pp. 6–7) — her basis: an audience given dense prose
  will read it instead of listening. Those numbers are FAILURE diagnostics, not a
  safe harbor: at normal reading speed a 50-word slide takes ~15 seconds, so a slide
  with a simple takeaway often carries roughly a dozen words or fewer —
  unless it is a deliberate silent-read moment, in which case stop talking while
  they read. Necessary notation, diagram labels, and conclusion-changing caveats
  have no arbitrary word cap; sequence them and check legibility. Build the
  leave-behind as a separate **Slidedoc** (*DataStory*
  Ch. VIII: designed to be read — DataPOV as title, three-act summary in full
  sentences, one idea per slide, appendix), and never present it while talking.
- **Data slides show meaning.** Completed assertion slides carry the supported
  **observation** in the slide-title slot; the chart beneath keeps its own claim title
  (`COMPOSITION.md`: no chart ships naked) and a NEUTRAL subtitle
  (the measured noun, precisely, and the when — *DataStory* Ch. VI). Same split the
  evidence room uses on figures: claim line above, neutral what-was-measured line
  beneath. A declared question/evidence/reveal sequence may delay the observation;
  finish with the supported conclusion and limits, preserving figure titles and
  material qualifiers throughout. Observations speak the chart's grammar:
  adjectives for bars, verbs and slope-calibrated adverbs for lines — never rails,
  rules, and axis furniture. Chart construction itself routes to `pic-charts` — this
  skill governs what the slide is FOR, that skill governs the figure.
- Signal over noise: anything on the slide not serving the beat's one idea comes off.

### 8. CLOSE AND ASK

The ask comes per audience role, with the smallest real next step named (a date, a
door, a signature — not "reach out"), actions simple and executable. Then — Duarte's
explicit order — **never end on the action list**: the reward picture follows the asks
(*Resonate* p. 42), and the reward must be proportional to the sacrifice you are asking
for (p. 88). Price the sacrifice out loud — audience resistance IS the sacrifice they
can see coming (p. 84), and the *HBR Guide* adds: show you're shouldering part of the
burden yourself. Last sentence of the talk = the Big Idea or its sound-bite form, said
once more, plain, inside the new-bliss picture.

### 9. RED TEAM (gauntlet)

Run [references/review-gates.md](references/review-gates.md) before any external
audience. Floor: the cold-listener pass (a reader with the script/deck only, no context,
asked what the main idea was, which numbers (if any) they retain, and what they were asked
  to do), the hostile-listener pass (the room's most skeptical member, hunting for the
bent number, the unpriced cost, the effort-display beat), and the traceability audit
(every number, counted object, denominator, period, and condition to its source).
Sound bites may shorten wording, never change what was counted. A talk that fails
cold-listener recall of the Big Idea is
not done, whatever the deck looks like. Scientific and learning outcomes also need
the separate comprehension check in Layer 3; headline recall cannot satisfy it.

## Toolchain — the forms as code (probe before first use)

The forms in [references/room-artifacts.md](references/room-artifacts.md) are the law; the tools
below only make the law mechanical. Probe each with `command -v <tool>`; when a tool is absent,
write the same form in Markdown in the same block order and say so — never present a hand-built
file as if the guards ran on it. Charts still come from `pic-charts`: embed the bundle image, never
redraw.

- **Typst — the print path** (`typst`; templates in `templates/typst/`). `pic-room.typ` encodes
  the four print forms as functions whose REQUIRED arguments are the form's blocks, so the
  document refuses to compile without them: sources line; distribution ∈ room-only / recorded /
  posted-after / forwarded-freely; the THREE NUMBERS cap; WHY lines starting "Because…";
  assumptions as "This is true if…"; objections answered or retained as limits, plus the abandoned
  alternative; teach-back beats ≤ 8 words with IF ASKED and BOTH NUMBER GUARD lines; the
  one-page ask and executive summary panic if they run to a second page; the briefing has no
  `ask` parameter at all, so a briefing that smuggles an ask is a compile error. Worked examples
  for every form live in `templates/typst/examples/` (fictional organisation, synthetic
  numbers) plus `guard-violation.typ`, which MUST fail — run it whenever you edit a guard, so a
  silent pass cannot creep in — **`bash templates/typst/check.sh` is the named check**: it
  compiles the four positive examples and asserts their page counts, requires each of the eleven
  negative examples to fail with its OWN expected message (a negative that compiles is reported
  as a broken guard, and one that fails for a different reason is reported too), extracts the
  overflow stamp from a debug compile, and asserts via `pdffonts` that the brand face and its
  display cut are genuinely embedded. It fails — rather than skipping — when `pdffonts` is unavailable. Compile a single form with `typst compile --root templates/typst --font-path
  "$BRAND_FONTS" <file>.typ` — the font path is required because the hero-stat figures set in
  the brand's display face, which lives in the brand pack's `fonts/` folder (internally, the
  `pic-design` skill's bundled Aptos) rather than system-wide, and without it Typst falls back
  SILENTLY with only a warning. **Colours come from `templates/typst/tokens.typ`, GENERATED by
  pic-charts' `scripts/assert_palette_matches_tokens.py --pack DIR` from a brand pack's
  `tokens.json`**; the forms read roles (`accent`, `alert`, `dark-surface`, `action`) and the ink
  scale, never a hex, so one form serves every brand. Copy your pack's `tokens.typ` over the
  shipped one. A panic is a form failure to fix in the CONTENT (cut, don't shrink), never by
  loosening the guard (`--input allow-overflow=yes` renders the overflow so you can see what
  to cut). Styling follows the house design system (`design-starter`; internally `pic-design`):
  Charcoal body, ink-650 muted text, semibold tracked headings, dark-surface eyebrows, the
  hero-stat tile pattern, and the organisation's lockup in the band (`lockup: none` to suppress). Each number in `numbers:` may carry a
  `figure:` ("3 in 10", "+13 pts") that becomes the tile's hero numeral, with the ROOM-SCALED
  phrase as its label; without it the phrase itself is set large. **`figure:` is a hand-typed
  copy of a number that also lives in EXACT.** One idiom is checked by arithmetic — an "N in M"
  figure must land within 8 points of a percentage in its EXACT line — but every other phrasing
  is unchecked, and no guard can judge whether the approximation is a fair one. That is the
  traceability audit's job (review-gates Layer 2), and it is where a bent number would enter.
  Check it by eye against the EXACT line beneath it, every time. The briefing renders on an
  auto-height page (it is read on a screen), so a short briefing is not half a sheet of dead
  canvas. Rendered pages were reviewed hostilely by a second model family against
  `pic-design/COMPOSITION.md`; the surviving findings are fixed in the templates, and the
  review brief lives with the demos. Executable documents (Quarto) are deliberately not on this lane: a cell that
  recomputes a number is the boundary law's failure mode.
- **Slidev — the deck** (`npx slidev`, project-local; template `templates/slidev/room-deck.md`
  on the local theme `templates/slidev/theme-pic/`). The theme ports `pic-design/slides/` — the
  seven sanctioned PIC slide types — as layouts: `pic-title`, `pic-section` (dark),
  `pic-content`, `pic-two-up`, `pic-quote` (light or `dark: true`), `pic-stat-grid`,
  `pic-thank-you`, plus `pic-chart` (a pic-charts figure as the dominant element with one
  source line and at most one limitation). **The theme carries no brand of its own:**
  `styles/tokens.css` is the GENERATED `theme-tokens.css` from a brand pack (PIC's by default;
  copy yours over it), `styles/fonts.css` holds the `@font-face` rules (internally Aptos from
  `../fonts`; the public cut ships a stub that falls back to `system-ui`), and `styles/theme.css`
  reads only `--brand-<role>`, `--ink-NNN`, `--paper` and `--font-*`. The mark comes from the
  deck's headmatter (`brandName`, `brandLogo`, `brandLogoWhite`; files under the deck's
  `public/brand/`), so `<PicLogo>` renders nothing in a deck that declares none. Footer chrome
  (section label + page) on every content slide, 1920-px canvas so the reference px sizes apply
  directly. Use ONLY these layouts; a slide that needs another one is a slide that has not
  passed `pic-design/COMPOSITION.md`, which every presented slide must (one assertion, one
  dominant element, fill or commit, ≤5 numerals, one accent, ~1 in 4 dark). Slidev passes
  `headline:` (not `title:`, which it consumes) to layouts. Speaker notes are HTML comments
  that show only in presenter view, so each slide's `[IS]/[COULD]/[STAR]/[ASK]/[BLISS]` mark
  and its EXACT line ride the working file; the journalism-lane check runs on that text
  file. Build: `npx slidev build deck.md --out dist`; PDF: `npx slidev export deck.md` (needs
  `playwright-chromium`, and a `vite.config.ts` with `server.fs.allow` when `theme-pic` is
  reached through a symlink, or Aptos silently falls back). Render-and-look is not optional:
  read every exported slide. **Caveat that decides routing:** Slidev exports PDF and
  image-only PPTX. If colleagues must EDIT the deck in PowerPoint afterwards, build it with
  the `pptx` skill instead and keep the Slidev file as the reviewed source of truth.
- **Remotion — one STAR asset, at most** (`npx remotion render`, project-local). An animated
  chart reveal is Duarte's "evocative visual" STAR type and the right asset for a recorded or
  posted-after talk. The one-STAR cap applies to it exactly as to any other peak; it is never
  the ask slide, and it is built from the highest evidence tier in the room. Autoplaying video
  never goes into an evidence page — that lane's scroll-first law forbids it.
- Working demos of all three, with rendered output: `~/ai-tools/tool-demos/` (macOS).

## Iron rules

Apply these within the declared room shape; its explicit substitutions govern.

1. **The boundary law**: never touch an evidence page; the street runs one way; the
   story changes before a number does.
2. **Name the room and outcome** — action, learning, evidence judgment, or FYI.
3. **Big Idea before any slide**: or the room shape's learning objective/question. A deck
   built before the sentence exists is an outline in costume.
4. **Audience is the hero**; cut effort-display, preserve decision-relevant methods.
5. **Contrast is the engine**: alternate what-is and what-could-be; three same-state
   beats in a row is a flatline; end in new bliss, never in methodology.
6. **One STAR moment**, made of verified material, placed late, never in the ask.
7. **Room-repeats-it**: test the message a cold reader takes away; for scientific
   explanation/review, separately test whether they understand and apply it.
8. **At most three recall numbers**, each room-scaled and traceable; vivid but
   unverified numbers are banned.
9. **Glance test and one idea per slide; no slideuments** — the leave-behind is a
   separate artifact.
10. **Truth constraints carry over from the journalism lane**: uncertainty verbs match
    evidence tier; the story's freedoms are selection and ordering, bounded by the
    inoculation duty — you may not select AWAY the strongest counter-case (Layer 4
    hunts for exactly that) — and adjustment is no one's freedom at all.

## Routing

- Writing/editing an evidence page, data article, visual essay → `data-journalism-house`.
- Building/fixing a chart or figure → `pic-charts`.
- This skill: talk, deck, pitch, ask, briefing, exec summary, teach-back, spotlight —
  anything whose success is measured after the room empties.
- Both lanes on one project (an evidence room AND a talk about it): run them as separate
  artifacts under separate skills, linked by citation only.
