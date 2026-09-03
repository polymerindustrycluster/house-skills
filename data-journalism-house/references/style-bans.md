# Negative style guide: house bans and AI tells

This file governs PUBLISHED ARTICLE PROSE — headlines, standfirsts, ledes, body,
annotations, chart text, closers, methodology boxes. It is a hard lint layer: run it
over every draft in the edit stage (SKILL.md stage 6), after the voice pass. Skill
meta-text and code comments are out of scope. Where house law is stricter than the
AI-tell guidance below, house law wins.

Why it exists: readers now pattern-match AI-generated prose in seconds, and one tell
undoes a page of craft. The deeper disease (per Wikipedia's "Signs of AI writing,"
WikiProject AI Cleanup, whose field guide the AI-tell section distills): LLMs regress to
the statistical mean, swapping specific, verifiable facts for generic assertions of
importance — the subject gets less specific and more exaggerated at once, a portrait
fading into a blurry sketch while the caption shouts about its importance. Every tell
below is a surface symptom of that one disease: content-free assertion of significance.
These are signs, not proof — and the cure is never to camouflage the phrasing but to
replace the empty claim with a concrete, sourced specific.

## House word bans (John's law — hard lint)

**Never use, in any form (plural, -ing, -ed, -s):** crucial, delve, matters.

**Minimize — near-zero, and never twice in a piece (any form):** amplify, archetypal,
at the heart of, augment, blend, catalyze, catalyst, catering, centerpiece, cohesion,
cohesive, comprehensive, conceptualize, confluence, digital bazaar, dynamics, elucidate,
embark, embodiment, embody, emanate, encompass, envisage, epitomize, evoke, exemplify,
extrapolate, facilitating, facet, fusion, harmony, harnessing, holistic, illuminating,
immanent, implications, in essence, infuse, inflection, inherent, instigate, integral,
integration, intrinsic, intricacies, iteration, leverage, manifestation, mosaic, nuance,
paradigm, pinnacle, prerequisite, quintessential, reinforce, resilience, resonate,
reverberate, subtlety, substantiate, symbiosis, synergy, synthesize, tapestry,
underlying, unify, unity, unravel, unveil.

The replacement discipline: these words survive in drafts because they let a sentence
sound finished without saying anything. Deleting one should force the sentence to state
its actual content ("the model leverages three data sources" → "the model reads three
data sources: X, Y, Z").

## House syntax bans (hard lint)

- **No em-dashes in published prose.** Use commas, a colon, parentheses, or two
  sentences. (Chart annotation micro-text may use an en-dash for numeric ranges:
  2015–2025.) This is stricter than the AI-tell density threshold below; the house rule
  governs.
- **Smart quotes only.** Typographer's quotes throughout rendered prose: ‘ ’ “ ”, and
  the apostrophe is ’. A straight ' or " in a prose text node is a build defect. (Code
  blocks, attributes, and data files keep straight quotes; the lint applies to rendered
  text nodes.)
- **No contrastive/antithetical parallelisms.** "This is not X. This is Y." / "X is
  ready. We are not." / "The problem isn't X. The problem is Y." / "not only… but also"
  / "not just X, but Y". When two consecutive sentences mirror or invert each other's
  structure for rhetorical contrast, rewrite as one direct statement asserting the true
  half plainly. This outranks the aphorism guidance in writing.md: an aphorism built on
  inversion gets rebuilt as a direct claim. (House law: zero, not "max 1".)

  **What this ban does NOT reach: the scope disclaimer.** "A count of establishments,
  not a sum of metros." "The date is the vintage, not the month the figure was
  published." "Nothing was recorded, which a confirmed zero is not." These name what a
  measure excludes, and in data journalism that is the sentence standing between a
  reader and a specific wrong reading. A scan of one audited site flagged 40 of these
  and every one was doing precision work.

  The test is what the negated half carries. **If dropping "not Y" would let a reader
  believe something false about the data, it is a scope disclaimer and it stays.** If
  dropping it costs only rhetorical lift ("This is not a story about steel. This is a
  story about people"), it is the banned flourish. Do not put this pattern in a lint:
  it cannot make that distinction, and a gate that flags 40 correct sentences is a gate
  someone turns off.
- **No faux-profound staccato.** "Full stop. Two words. Full stop." cadences are
  banned; fragments may appear only as data labels, never as rhetorical beats.
- **No apologies, no sycophancy, no throat-clearing** in any reader-facing text: no
  "it's worth noting", no "we're excited to", no "unfortunately".

## AI-tell patterns (distilled from Wikipedia's "Signs of AI writing")

Attribution and licence: the fifteen categories and their example phrases below are
adapted from Wikipedia, "Signs of AI writing", WikiProject AI Cleanup,
https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing, by its contributors, licensed
CC BY-SA 4.0 (https://creativecommons.org/licenses/by-sa/4.0/). The category order and the
sample phrases are theirs; the "Fix:" lines and the data-journalism readings are ours.
This section is therefore also CC BY-SA 4.0, and any file that carries it must be.

### 1. Puffery / importance inflation
Formulaic claims that a subject matters, without evidence that it does. Grep: "stands as
a testament", "plays a vital/pivotal/key role", "underscores its importance", "reflects
broader", "key turning point", "indelible mark", "evolving landscape", "enduring
legacy", "setting the stage for", "deeply rooted", "focal point". Fix: state the
checkable fact that would justify the claim (what changed, measured how, per whom) and
delete the significance assertion itself.

### 2. Promotional / travel-brochure language
Marketing warmth in neutral description; persists even when told to be neutral. Grep:
"boasts a", "nestled in", "in the heart of", "rich cultural heritage", "vibrant",
"breathtaking", "diverse array", "groundbreaking", "renowned", "commitment to",
"continues to captivate". Fix: strip evaluative adjectives; keep only properties a
source states and a reader could verify.

### 3. Superficial -ing analysis clauses
A present-participle phrase bolted onto a sentence's end, asserting unsupported
significance. Grep sentence-final: "highlighting the…", "underscoring…",
"emphasizing…", "reflecting/symbolizing…", "contributing to…", "ensuring…",
"fostering…", "showcasing…", "offering valuable insights". Fix: cut the clause; if the
analysis is real, give it its own sentence with a named source making that exact claim.

### 4. Vague attribution (weasel wording)
Opinions ascribed to unnamed crowds. Grep: "Industry reports", "Observers have cited",
"Experts argue", "Some critics argue", "several sources", "widely regarded". Fix: name
the person or publication; if you can't name who, the claim goes.

### 5. Coverage-instead-of-content
Listing that coverage exists instead of reporting what it said. Grep: "independent
coverage", "profiled in", "national media outlets", "maintains an active social media
presence". Fix: report the substance of the coverage (the finding, quote, or number),
never the fact of coverage.

### 6. Editorializing summaries and outline conclusions
Closing paragraphs that restate and moralize. Grep: "In summary", "In conclusion",
"Overall,", "Despite its/these challenges", "faces several challenges", "Future
Outlook". Fix: end on the last fact — data journalism closes with evidence, not
benediction. (The genre's closer restates the FINDING with its caveat, which is
evidence; "challenges remain and the future looks bright" is not.)

### 7. Rule-of-three overuse
Triplets everywhere, making thin analysis look thorough. Check: lists of exactly three
recurring in consecutive sentences; ", and other …" tails. Fix: list the actual number
of items the evidence supports — one, two, or five.

### 8. False ranges and fake breadth
"From X to Y" / "whether X or Y" implying a surveyed spectrum that was never surveyed.
Grep: "from … to …", "offering a diverse range", "spanning more than". Fix: name the
specific endpoints that exist in the data, or state the single case you have.

### 9. AI-vocabulary density
No single word convicts; clustering does. Beyond the house lists above, watch the
newer set: "align with", "enhance", "robust", "deep dive", "key" (adjective),
"landscape"/"interplay" (abstract), "meticulous", "garner", sentence-initial
"Additionally". Fix: the plain word ("examine", "has"), and re-read for clusters.

### 10. Copula avoidance
Dodging "is/are" with grander verbs. Grep: "serves as a", "stands as", "functions as",
"operates as", "marks a", "represents a", "refers to" in a first sentence. Fix: write
"X is Y." Plain copulas now read as human.

### 11. Vague connection
Fuzzy relational hedges where the real relationship is known. Grep: "in connection
with", "in association with", "associated with" (outside its statistical sense),
"connected to". Fix: the concrete verb — wrote, funded, cited, caused. (The statistical
"is associated with" from the uncertainty ladder is exempt: there it IS the precise
claim.)

### 12. Hedging and didactic boilerplate
Safety-blanket advisories. Grep: "it's important to note", "worth noting", "may vary",
"based on available information", "While specific details are limited". Fix: a real
data limitation is stated precisely (n, period, source gap); anything else is deleted.

### 13. Chatbot artifacts (any hit is disqualifying)
Grep: "As an AI", "language model", "I hope this helps", "Certainly!", "You're
absolutely right", "Would you like", knowledge-cutoff phrasing ("as of my last
update"), unfilled placeholders ("[Your Name]", "[insert"). One artifact means nothing
was reviewed — delete the line and re-review the entire draft.

### 14. Formatting tells
Title Case Headings; bullet lists with **Bold Inline Header:** descriptions; boldface
"key takeaways"; emoji as decoration; markdown residue in rendered prose; skipped
heading levels; mixed curly and straight quotes; horizontal rules between sections;
spaced/contrastive em-dashes (house law already bans them all in prose). Fix:
sentence-case headings, prose over bullets, one emphasis style, consistent glyphs.

### 15. Citation tells
Machinery of fabricated or scraped sourcing. Grep: "contentReference", "oaicite",
"turn0search", "[cite:", "grok_", "utm_source=chatgpt.com"; DOIs/ISBNs that don't
resolve; book citations with no page numbers. Fix: resolve and read every link before
it ships — a citation you haven't opened is not a citation.

## Draft lint pass (run over every draft, after the voice pass)

1. Grep the house never-list (any form of crucial / delve / matters) — zero hits.
2. Grep the house minimize-list — any word appearing twice gets rewritten to its
   concrete content.
3. Grep `—` in prose nodes — rewrite each (en-dash numeric ranges in chart micro-text
   exempt).
4. Grep straight `'` and `"` in rendered prose nodes — replace with typographer's
   quotes.
5. Scan consecutive-sentence pairs for mirrored/inverted contrast, plus
   `not only|not just .* but` — rewrite as one direct statement. Zero allowed.
6. Grep puffery/promo/hedge sets (§1, §2, §6, §12): `testament|vital role|pivotal|
   boasts|nestled|rich .*heritage|vibrant|renowned|in summary|in conclusion|overall,|
   despite (its|these) challenges|important to note|worth noting` — zero hits.
7. Sentence-final -ing analysis clauses (§3): each becomes its own sourced sentence, or
   dies.
8. Weasel attribution (§4): `experts|observers|critics|industry reports|several
   sources|widely` — every hit gets a name or the claim goes.
9. Copula check (§10): `serves as|stands as|functions as|refers to` — replace with
   is/are unless the verb is literal.
10. Triads and false ranges (§7, §8): >2 exact-three lists per 500 words, or any
    unsurveyed "from X to Y" — rewrite.
11. Artifacts (§13, §15): `as an ai|knowledge update|i hope this|\[your name\]|\[insert|
    oaicite|turn0search|contentReference|utm_source|grok_|\[cite:` — any hit triggers a
    full manual re-review; verify every remaining URL/DOI resolves.
12. Headings sentence-case, no emoji, no skipped levels; quote glyphs consistent.
13. Final read, the disease check: for each sentence ask "what specific, verifiable
    fact does this add?" — a sentence asserting only significance fails the piece.

## Run this lint as a gate, not as a memory

Written down is not enforced. One site that carried this whole law in its skill shipped
76 violations across 15 of 16 pages: em-dashes in body copy, straight apostrophes in
callouts, straight quotes around data codes. Steps 4, 5, 6, 8, 9, 10 and 11 above are
all mechanical, so they belong in a script that fails the build (review-gates Layer 1.5).

Three things that decide whether such a gate actually works:

- **Walk the text nodes; do not use `innerText`.** It skips collapsed and hidden content,
  which is exactly where methodology boxes, source registries and `<details>` table twins
  live. The first pass of that audit used `innerText`, found 34 violations, and missed 42.
- **Exclude what is not prose**, or the gate cries wolf and gets switched off: anything
  inside `<script>`/`<style>` (inlined source comments a bundler pulled in), anything
  inside `<noscript>` (raw markup while scripting is on), a **bare** dash alone in a cell
  or chart label (the correct no-data placeholder), and en-dashes between numbers (ranges).
- **Fix the shared file first.** In that audit one source-registry file held 51 of the 76,
  repeated across 15 pages; correcting it cleared two thirds of the board in a single
  edit, and one page went from twelve violations to none. Trace a violation to its
  upstream string before editing any page that displays it.

**A tidying regex is a content edit, and it needs the same verification as prose.** Two
separate incidents in one session: a byline regex stripped an AI credit from eight pages
while only two were spot-checked, and `<link rel="icon"[^>]*>` stopped at the first `>`
inside an SVG data URI and left loose `<circle>` markup in the document. Both passed
every gate then in place. After any bulk pattern edit, re-render and diff what a reader
sees, and count the sites you changed against the sites that matched.
