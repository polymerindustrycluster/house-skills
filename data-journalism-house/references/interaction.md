# Interaction: when it earns its place, and how

## The two governing rules (hold both at once)

**Tse (NYT, "Why We Are Doing Fewer Interactives," Malofiej 2016 — slides:
github.com/archietse/malofiej-2016; covered by Nieman Lab).** Two rules quoted from the
talk:
1. "If you make the reader click or do anything other than scroll, something spectacular
   has to happen."
2. "If you make a tooltip or rollover, assume no one will ever see it. If content is
   important for readers to see, don't hide it."
Plus, from the same talk's slides (paraphrase): interactives are expensive to make work
on every platform — count that cost before committing. Summary line: "Readers just want
to scroll."

**Aisch's counterweight** (*In Defense of Interactive Graphics*,
vis4.net/blog/in-defense-of-interactive-graphics): don't hide crucial content behind
interaction — but not everything is crucial, and the minority of readers who do interact
aren't nobody (his correction: the famous "85% ignore interactives" stat meant 85%
didn't click a button on 2015 NYT graphics). Interaction → transparency → trust.

Operationalized: default to a linear scrolling narrative; nothing load-bearing behind a
click, tab, stepper, slider, dropdown, or hover. Test every piece by imagining it printed
on paper — the key message must survive. Tooltips carry only redundant detail.

## The interaction ladder (what justifies interaction)

Interaction is justified for exactly these jobs, in rising order of value:

1. **Verification** — hover detail letting an engaged reader check any point's value.
   (Cheap, fine, never sufficient alone.)
2. **Completeness** — letting readers find their case in data too large to show
   ("where's MY county?"). Prevents cherry-picking accusations.
3. **Lookup / personalization** — the page re-tells its story from the reader's seat: a
   selector that highlights their unit across every chart and recomputes one templated
   verdict sentence ("A $1,332 Akron paycheck buys what $1,690 buys in Chicago"). For a
   known audience (members, readers in named counties/occupations), a missing lookup is
   an editorial gap: it is the difference between an essay read once and a tool reopened.
   Default state must still tell the story (nothing crucial behind the selector).
4. **Prior elicitation** — reader commits to a guess before the reveal (the "You Draw
   It" family). The commitment is what makes the discrepancy memorable. This is the
   canonical "something spectacular."
5. **Assumption testing** — a control exposing the analysis's sensitivity to a contested
   choice (base month, threshold, weighting). Converts a disclaimer into a demonstration:
   the winter-base-month caveat becomes a toggle that SHOWS the ordering is robust.
6. **Shareable artifact** — a one-tap export of the piece's verdict for the reader's
   unit (a "recruiting card" with the sentence, the two ranks, the source line). Lets
   the piece travel into the conversation it was written for.

If a proposed interaction does none of these, cut it and render the information as a
sequence of static annotated charts. "Move your cursor to make dots wiggle" is not a
journalistic purpose; filters that merely reorganize (workstream, horizon) without
answering a reader question are organization, not explanation.

## Cross-chart linking

When several charts share the same units (rows, counties, occupations), a selection in
one should highlight the same unit in all — three disconnected views of the same twelve
rows is a missed argument. Selected state may live in the URL hash so a view can be
shared. Claims/verification note: automated claim checks run against the page's DEFAULT
state; write claims about the default view, since a state reachable only by interaction
cannot be re-run by a headless gate. Table twins must stay in sync with whatever the
chart currently shows.

## Scrollytelling (sticky-stage) discipline

Use ONLY when the beats are literally successive views of one visual space (zooming a
map, adding series to one chart, stepping time). Otherwise use stacked sections.

- Anatomy: full-viewport graphic stage; narration in ~360–460px shadowed cards entering
  from the bottom; a persistent state chip in a corner showing "where we are".
- "Every scroll-triggered effect must serve the narrative. Gratuitous animation
  distracts rather than enhances." Restraint over spectacle — the format amplifies the
  content's message, never fights it.
- Preserve native scroll; scroll-jacking is banned.
- Mobile-first build order (The Pudding): "Starting with mobile first forces you to pare
  down your experience to the nuts and bolts… This refines and focuses the content."
  Build the mobile core first, then enhance.
- Sticky visual pinned to ~40vh top or bottom while text scrolls over/under is the
  standard mobile stacking pattern.
- Viewport units: use `svh` for full-height stages (not `dvh` — "constant layout shifts
  felt broken" is a documented real failure).
- Provide a reduced-motion fallback: `prefers-reduced-motion` degrades the scrolly to
  the sequential stacked-band layout with the same content.
- Add a progress indicator on long scrollies so readers know the commitment.

## Accessibility requirements (all pages, not just interactive ones)

- Keyboard parity: everything hover does, focus does; interactive marks are focusable
  with ARIA roles/labels; visible focus states.
- `prefers-reduced-motion` honored in both CSS and JS-triggered animation.
- Every chart has an accessible fallback: `role="img"` plus a text alternative that
  carries the CLAIM (not "bar chart"), and a data-table twin (with real table headers)
  behind a disclosure as the long description.
- Meaning never rides on color alone: pair hue with position, label, shape, or hatch
  (the "withheld" hatch pattern is the model). Text contrast meets WCAG AA on its actual
  background, including annotation text over chart marks.
- The page reflows at 200% zoom without loss; touch targets ≥44px; no hover-required
  interaction on touch devices.
- Test: the page's argument must be complete with JS disabled — every beat's claim
  exists as HTML text; charts may need JS to render, but no argument text is injected
  only on interaction.
- Input hygiene: any lookup/search input is treated as untrusted — escape it before it
  touches the DOM; never eval or innerHTML user-typed text.

## Interaction budget

2–3 interactive moments per piece, maximum, drawn from the ladder above. Three
well-designed interactive moments beat ten gimmicks. Every added control is production
and cognitive cost; when in doubt, one more annotated static chart.
