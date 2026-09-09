// pic-room.typ — the four PRINT-PATH room artifacts of data-storytelling-house as Typst forms.
//
// Each form is a function whose REQUIRED arguments are the blocks the house form demands
// (references/room-artifacts.md). Omit one and the document does not compile. The guards
// below are the rules a reviewer used to read for by hand; a panic here is cheaper than a
// stale number in a boardroom.
//
//   #import "pic-room.typ": one-page-ask, executive-summary, teach-back-card, briefing
//
// Forms:  one-page-ask · executive-summary · teach-back-card · briefing
// Guards: distribution ∈ {room-only, recorded, posted-after, forwarded-freely}
//         sources ≥ 1 · numbers ≤ 3 (the THREE NUMBERS cap) · one page (ask, summary)
//         WHY starts "Because" · assumptions start "This is true if" · beat ≤ 8 words
//         teach-back NUMBER GUARD has both EXACT and ROOM-SCALED lines
//         briefing has NO ask slot at all (passing one is a compile error)
//
// Styling follows the house design system (design-starter; internally pic-design): ink-700 body
// text, ink-900 headings, ink-650 muted/metadata, semibold tracked headings, dark-surface
// eyebrows, a hero-stat number-tile pattern, 10pt card radii, and a 4pt spacing scale.

// ---------- tokens: GENERATED beside this file from a brand pack's tokens.json ----------
// `tokens.typ` is written by pic-charts' scripts/assert_palette_matches_tokens.py (--pack DIR);
// this file never carries a hex. It reads ROLES (accent, alert, dark-surface, action, ...) and the
// ink scale, so one form serves every brand. Copy your pack's tokens.typ over the shipped one.
#import "tokens.typ": tokens, fonts, display-fonts, lockup-path
#let pic = tokens
// ink-500 / ink-400 are NOT text colours (token hard rules) — kept only for non-text use
// elsewhere; every text fill() in this file uses ink-900/700/650 or a brand role.
#let distribution-values = ("room-only", "recorded", "posted-after", "forwarded-freely")

// ---------- guards ----------
#let require(cond, msg) = { if not cond { panic("pic-room: " + msg) } }
#let nonempty(s) = type(s) == str and s.trim().len() > 0
// Bullets are for the author, sentences are for the mouth. Catches "-", "•", "*" and "1." forms.
#let BULLET-RE = regex("(?m)^\\s*([-–—•*+>·]|[0-9]+[.)]|[a-z][.)])\\s")
#let is-prose(s) = nonempty(s) and s.match(BULLET-RE) == none
#let word-count(s) = s.split(regex("\\s+")).filter(w => w != "").len()
// Counts a trailing sentence with no final period too — otherwise a 5-sentence SAY slips the cap
// by dropping its last full stop (tested bypass, refute round 2).
#let sentence-count(s) = {
  let t = s.trim()
  let n = t.matches(regex("[.!?]+[\"\u{201d}\u{2019})]*(\\s|$)")).len()
  if t.len() > 0 and t.match(regex("[.!?][\"\u{201d}\u{2019})]*$")) == none { n + 1 } else { n }
}
// House style spells dates out ("October 31, 2026"). The day and year are range-checked too, so
// "February 31, 0000" is a compile error rather than a well-formatted impossibility.
#let months = ("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
#let month-days = (31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
#let date-ok(d) = {
  if not nonempty(d) { return false }
  let m = d.trim().match(regex("^([A-Z][a-z]+) ([0-9]{1,2}), ([0-9]{4})$"))
  if m == none { return false }
  let (name, day, year) = m.captures
  if name not in months { return false }
  let day = int(day)
  let year = int(year)
  day >= 1 and day <= month-days.at(months.position(x => x == name)) and year >= 2000 and year <= 2100
}
// Whole-word match only: "demographic" and "demonstration" are ordinary words in real citations,
// and a guard that rejects a real source teaches people to switch it off.
#let SYNTHETIC-MARKERS = ("demo", "synthetic", "fixture", "dummy", "lorem", "example.org")
#let looks-synthetic(strings) = strings.any(s => SYNTHETIC-MARKERS.any(m =>
  lower(s).match(regex("(^|[^a-z])" + m + "($|[^a-z])")) != none))
// A room must name someone. These are the placeholders the form's own message calls out.
#let PLACEHOLDER-ROOMS = ("stakeholders", "the team", "everyone", "any room", "tbd", "n/a", "the board")
#let real-room(r) = nonempty(r) and word-count(r) >= 3 and not PLACEHOLDER-ROOMS.any(p =>
  lower(r).match(regex("(^|[^a-z])" + p + "($|[^a-z])")) != none)
// digits that appear in a hero figure must also appear in the EXACT line beneath it
#let digit-runs(s) = s.matches(regex("[0-9]+")).map(m => m.text)

#let check-common(room, distribution, sources, demo) = {
  require(real-room(room), "ROOM must be a named, specific audience (\"stakeholders\" is not a room): " + repr(room))
  require(distribution in distribution-values,
    "DISTRIBUTION must be one of " + distribution-values.join(" / ") + " — it sets the build contract")
  require(type(sources) == array and sources.len() > 0, "SOURCES: every room artifact carries a sources line")
  for s in sources { require(nonempty(s), "SOURCES: an empty source entry is not a source") }
  // The synthetic-data warning must not be opt-in: sources that say demo/synthetic force the DEMO band.
  require(demo or not looks-synthetic(sources), "SOURCES look synthetic (contain 'demo' or 'synthetic') — pass demo: true so the DEMO band shows, or cite real sources")
}
// Every string a reader could trace — sources, each number's source, the evidence link — is checked
// for synthetic markers, so the DEMO band cannot be dodged by hiding the demo path in one of them.
#let check-synthetic-everywhere(demo, sources, numbers, evidence-link) = {
  let all = sources + numbers.map(n => n.at("source", default: "")) + (if evidence-link == none { () } else { (evidence-link,) })
  require(demo or not looks-synthetic(all), "a source, number-source or evidence link looks synthetic — pass demo: true so the DEMO band shows")
}
#let check-date(label, d) = require(date-ok(d), label + " must be a spelled-out date like \"October 31, 2026\" (house style; numeric dates are banned): " + repr(d))
#let check-numbers(numbers) = {
  require(type(numbers) == array, "THREE NUMBERS must be an array")
  require(numbers.len() <= 3, "THREE NUMBERS cap: " + str(numbers.len()) + " given; a room retains about three")
  for n in numbers {
    require("scaled" in n and nonempty(n.scaled), "each number needs a ROOM-SCALED form (\"about one in ten\")")
    require("exact" in n and nonempty(n.exact), "each number needs an EXACT line (the figure you may never drift from)")
    require(n.exact.match(regex("[0-9]")) != none, "the EXACT line must carry the derived FIGURE, not a description of it: " + n.exact)
    // `figure:` is the ROOM-SCALED hero, which the house form says is DELIBERATELY approximate —
    // so its digits are not required to match EXACT. But the one idiom that can be checked by
    // arithmetic is checked: "N in M" against a percentage in EXACT, within 8 points. That stops
    // "9 in 10" sitting over "29.4%" while still allowing "3 in 10". Everything else is the
    // traceability audit's job (review-gates Layer 2), and the SKILL text says so.
    if "figure" in n and nonempty(n.figure) {
      let f = n.figure.trim().match(regex("^([0-9]+) in ([0-9]+)$"))
      let e = n.exact.match(regex("([0-9]+(?:\\.[0-9]+)?)\\s*%"))
      if f != none and e != none {
        let ratio = float(f.captures.at(0)) / float(f.captures.at(1))
        let pct = float(e.captures.at(0)) / 100.0
        require(calc.abs(ratio - pct) <= 0.08,
          "the hero figure \"" + n.figure + "\" (" + str(calc.round(ratio * 100)) + "%) contradicts its EXACT line: " + n.exact)
      }
    }
    require("source" in n and nonempty(n.source), "each number needs a source (evidence page / claim file)")
  }
}
// To SEE the overflow while cutting, compile once with `--input allow-overflow=yes`. The guard stays
// on for every normal compile, and a compile made with the switch is stamped OVERFLOW DRAFT — DO NOT
// SHIP on every page, so the debug output cannot be mistaken for a deliverable.
#let overflow-allowed() = sys.inputs.at("allow-overflow", default: "no") == "yes"
// Deliberately NOT rotated: a rotated watermark does not survive text extraction, and the named
// check proves the stamp is present by extracting it.
#let overflow-stamp() = if overflow-allowed() {
  align(top + center, block(width: 100%, fill: pic.alert, inset: 6pt,
    text(font: fonts, size: 13pt, weight: "bold", fill: white, tracking: 0.08em)[OVERFLOW DRAFT — DO NOT SHIP]))
} else { none }
#let assert-one-page(form) = context {
  let n = counter(page).final().first()
  if n > 1 and not overflow-allowed() {
    panic("pic-room: " + form + " ran to " + str(n) + " pages — the reader must reach the ask without turning anything over. Cut, don't shrink. (To view the overflow, stamped DO NOT SHIP: --input allow-overflow=yes)")
  }
}

// ---------- shared pieces ----------
#let base-style(body, size: 9.5pt) = {
  set text(font: fonts, size: size, fill: pic.ink-700)
  set par(leading: 0.6em, justify: false)
  body
}
// Named field-label rather than `label` so it does not shadow Typst's built-in label().
// Eyebrow style: uppercase, tracked 0.14em, weight 700, pic-blue-dark (brand teal fails AA at this size).
#let field-label(t) = text(size: 7.5pt, weight: "bold", fill: pic.dark-surface, tracking: 0.14em, upper(t))
// lockup: none suppresses the mark. lockup: auto shows the brand pack's lockup when tokens.typ
// declares one (`lockup-path`, resolved relative to THIS file, so keep the pack's logos/ folder
// beside it). Any other value is CONTENT the document supplies and sizes itself, for example
// lockup: image("../logos/lockup.png", width: 1.1in). No mark is bundled with the form.
#let room-lockup(lockup, width: 1.1in) = {
  if lockup == none { none }
  else if lockup == auto { if lockup-path == none { none } else { image(lockup-path, width: width) } }
  else { lockup }
}
// The lockup rides the top eyebrow row only (kind + logo) so a long ROOM/DISTRIBUTION/DATE
// line keeps the full band width to wrap in, instead of competing with a 1.1in image.
#let band(kind, room, distribution, date, demo: false, lockup: auto) = {
  block(width: 100%, inset: (y: 4pt), stroke: (bottom: 0.75pt + pic.ink-300))[
    #grid(columns: (1fr, auto), gutter: 8pt, align: (left + horizon, right + top),
      text(size: 8pt, weight: "bold", fill: pic.dark-surface, tracking: 0.14em, upper(kind)),
      room-lockup(lockup),
    )
    #v(4pt)
    #grid(columns: (1fr, auto), gutter: 10pt,
      text(size: 8pt, fill: pic.ink-700)[#field-label("Room") #h(3pt) #room],
      text(size: 8pt, fill: pic.ink-700)[#field-label("Distribution") #h(3pt) #distribution #h(8pt) #field-label("Date") #h(3pt) #date],
    )
    #if demo [ #v(4pt) #text(size: 7.5pt, weight: "bold", fill: pic.alert)[DEMO — synthetic numbers, fictional organisation — not a real ask] ]
  ]
}
#let sources-footer(sources, evidence-link: none) = {
  block(width: 100%, inset: (top: 4pt), stroke: (top: 0.75pt + pic.ink-200))[
    #text(size: 7pt, fill: pic.ink-650)[
      #field-label("Sources") #h(3pt) #sources.join(" · ")
      // The URL is a link, not a string to read aloud — a wrapped raw URL is a ship-quality defect.
      #if evidence-link != none [ #h(6pt) #field-label("Detail") #h(3pt) #link(evidence-link)[the evidence room] ]
    ]
  ]
}
// Hero-stat pattern (pic-design §6): a big Aptos Display figure, a short brand-accent rule,
// then the exact line and source in ink-650.
// Each number may carry an optional `figure:` ("3 in 10", "+13 pts", "37") — the hero numeral
// the design system's stat pattern leads with; the ROOM-SCALED phrase then becomes its label.
// Without `figure:` the phrase itself is set large, so the form still works for word-only numbers.
#let number-tiles(numbers) = {
  check-numbers(numbers)
  grid(columns: (1fr,) * numbers.len(), gutter: 8pt,
    ..numbers.map(n => block(fill: pic.ink-100, inset: 8pt, radius: 10pt, width: 100%, {
      // stack() so the 26pt figure does not inherit paragraph spacing scaled to its own size.
      let has-figure = "figure" in n and nonempty(n.figure)
      stack(dir: ttb, spacing: 4pt,
        if has-figure { text(font: display-fonts, size: 26pt, weight: "bold", fill: pic.ink-900, tracking: -0.02em)[#n.figure] }
        else { text(font: display-fonts, size: 18pt, weight: "bold", fill: pic.ink-900, tracking: -0.02em)[#n.scaled] },
        box(width: 24pt, height: 2pt, fill: pic.dark-surface),
        if has-figure { text(size: 8.5pt, weight: "semibold", fill: pic.ink-900)[#n.scaled] } else { none },
        text(size: 7.5pt, fill: pic.ink-650)[#field-label("Exact") #h(2pt) #n.exact],
        text(size: 7pt, fill: pic.ink-650)[#n.source],
      )
    }))
  )
}
// The STAR beat wears the orange chip; every other mark wears action teal #188295 — NEVER brand
// teal #1A8A9E behind white text (TOKENS.mirror.md hard rule: 4.06:1 fails AA).
#let mark-chip(mark) = {
  if mark == none {
    none
  } else {
    box(fill: if mark == "STAR" { pic.alert } else { pic.action },
      inset: (x: 8pt, y: 4pt), radius: 3pt,
      text(fill: white, size: 7.5pt, weight: "bold")[#mark])
  }
}
#let three-acts(situation, complication, resolution) = {
  let hinge(w) = align(center + horizon, text(size: 8pt, style: "italic", fill: pic.ink-650)[#w])
  grid(columns: (1fr, auto, 1fr, auto, 1fr), gutter: 8pt,
    [#field-label("Situation") #v(4pt) #situation],
    hinge("but / and"),
    [#field-label("Complication") #v(4pt) #complication],
    hinge("so"),
    block(fill: pic.ink-100, inset: 4pt, radius: 10pt)[#field-label("Resolution") #v(4pt) #resolution],
  )
}

// =====================================================================================
// ONE-PAGE ASK (funder / board) — Duarte's Recommendation Tree, house-adapted.
// =====================================================================================
#let one-page-ask(
  room: none, distribution: none, date: none,
  big-idea: none,                       // one arguable sentence with the stake in it — the title
  situation: none, complication: none, resolution: none,   // three acts, top band
  ask: none,                            // (decision: "...", by: "YYYY-MM-DD", owner: "...")
  grid-rows: (),                        // ((what: "...", why: "Because...", how: "..."), ...)
  objections: (),                       // ((objection: "...", rebuttal: "supported answer or retained limitation"), ...)  ≥ 1
  abandoned: none,                      // (alternative: "...", why: "...")
  assumptions: (),                      // ("This is true if ...", ...)  ≥ 1
  numbers: (),                          // ≤ 3 × (scaled:, exact:, source:)
  sources: (), evidence-link: none, demo: false, lockup: auto,
) = {
  check-common(room, distribution, sources, demo)
  check-date("DATE", date)
  check-synthetic-everywhere(demo, sources, numbers, evidence-link)
  require(nonempty(big-idea) and not big-idea.trim().ends-with("?"), "BIG IDEA is a complete arguable sentence, not a question or a topic label")
  for (k, v) in (situation: situation, complication: complication, resolution: resolution) { require(nonempty(v), k + " act is required") }
  require(type(ask) == dictionary and "decision" in ask and "by" in ask and nonempty(ask.decision) and nonempty(ask.by),
    "ASK needs a decision and a date (\"reach out\" is not an ask)")
  check-date("ASK by", ask.by)
  require(numbers.len() >= 1, "a one-page ask carries at least one of the THREE NUMBERS, room-scaled and sourced")
  require(grid-rows.len() >= 1, "WHAT / WHY / HOW grid needs at least one sub-action")
  for g in grid-rows {
    require("what" in g and "why" in g and "how" in g, "each grid row needs what, why, how")
    require(g.why.trim().match(regex("^Because\\s+\\S")) != none, "WHY starts with the WORD \"Because\" and names the data that changes: " + g.why)
    require(word-count(g.why) >= 5, "a WHY that short does not name the data that changes: " + g.why)
    require(nonempty(g.what) and nonempty(g.how), "each grid row needs a non-empty WHAT and HOW")
  }
  require(objections.len() >= 1, "state notable objections and supported answers or retained limitations in the artifact")
  for o in objections {
    require(word-count(o.at("objection", default: "")) >= 3, "an objection must be stated in words: " + repr(o.at("objection", default: "")))
    require(word-count(o.at("rebuttal", default: "")) >= 5, "provide a supported answer or retained limitation: " + repr(o.at("rebuttal", default: "")))
  }
  require(type(abandoned) == dictionary and nonempty(abandoned.alternative) and nonempty(abandoned.why), "the abandoned alternative and why you rejected it is required")
  require(assumptions.len() >= 1, "every prediction's assumptions, as \"This is true if…\"")
  for a in assumptions {
    require(a.trim().match(regex("^This is true if\\s+\\S")) != none, "assumption must read \"This is true if …\" AND say what: " + a)
    require(word-count(a) >= 6, "an assumption this short states no condition: " + a)
  }
  check-numbers(numbers)

  set page(paper: "us-letter", margin: (x: 0.6in, y: 0.5in),
    footer: sources-footer(sources, evidence-link: evidence-link), foreground: overflow-stamp())
  base-style(size: 9pt)[
    #band("One-page ask", room, distribution, date, demo: demo, lockup: lockup)
    #v(4pt)
    #text(size: 15pt, weight: "semibold", fill: pic.ink-900, tracking: -0.02em)[#big-idea]
    #v(4pt)
    #three-acts(situation, complication, resolution)
    #v(4pt)
    #block(fill: pic.alert.lighten(88%), stroke: (left: 3pt + pic.alert), inset: 4pt, radius: 10pt, width: 100%)[
      #field-label("The ask") #h(4pt) #text(weight: "bold")[#ask.decision] #h(6pt)
      #field-label("By") #h(2pt) #ask.by
      #if "owner" in ask [ #h(6pt) #field-label("Owner") #h(2pt) #ask.owner ]
    ]
    #v(4pt)
    #if numbers.len() > 0 [ #number-tiles(numbers) #v(4pt) ]
    #grid(columns: (1fr,) * grid-rows.len(), gutter: 8pt,
      ..grid-rows.map(g => block(stroke: 0.75pt + pic.ink-200, inset: 4pt, radius: 10pt, width: 100%)[
        #field-label("What") #v(4pt) #text(weight: "bold")[#g.what] #v(4pt)
        #field-label("Why") #v(4pt) #g.why #v(4pt)
        #field-label("How") #v(4pt) #g.how
      ])
    )
    #v(4pt)
    #grid(columns: (1.3fr, 1fr), gutter: 10pt,
      [
        #field-label("Objections and responses")
        #v(4pt)
        #for o in objections [ #text(weight: "bold")[#o.objection] #h(3pt) #o.rebuttal #linebreak() ]
        #v(4pt)
        #field-label("Abandoned alternative") #v(4pt) #text(weight: "bold")[#abandoned.alternative] #h(3pt) #abandoned.why
      ],
      [
        #field-label("This is true if")
        #v(4pt)
        // Rendered in the form's own words — "This is true if …" is the required syntax, not a prefix to strip.
        #for a in assumptions [ #text(weight: "bold")[This is true if] #a.trim().slice("This is true if".len()).trim() #linebreak() ]
      ],
    )
  ]
  assert-one-page("one-page ask")
}

// =====================================================================================
// EXECUTIVE SUMMARY — the three-act DataStory as prose, conclusion first, one page.
// =====================================================================================
#let executive-summary(
  room: none, distribution: none, date: none,
  datapov: none,                        // the DataPOV titles the deliverable
  situation: none, but: none, complication: none, so: none, resolution: none,  // full sentences, no bullets
  numbers: (),                          // ≤ 3, each with one line of support
  risks: none,                          // costs/risks priced honestly — prose
  objections: (), abandoned: none,
  figure: none,                         // optional: (body: image("…/{stem}.png", width: 78%), caption: "…") — call image() in YOUR file so the path resolves there
  sources: (), evidence-link: none, demo: false, lockup: auto,
) = {
  check-common(room, distribution, sources, demo)
  check-date("DATE", date)
  check-synthetic-everywhere(demo, sources, numbers, evidence-link)
  require(nonempty(datapov), "DataPOV is required: the action the data says to take + the quantified stakes, one sentence")
  for (k, v) in (situation: situation, but: but, complication: complication, so: so, resolution: resolution) {
    require(is-prose(v), k + " must be full sentences, no bullets (DataStory Ch. IV/VIII)")
  }
  require(is-prose(risks), "risks and costs must be priced honestly, in prose")
  if figure != none {
    require(type(figure) == dictionary and "body" in figure and nonempty(figure.at("caption", default: "")),
      "figure must be (body: image(...), caption: \"...\") — an uncaptioned figure carries no claim")
  }
  require(objections.len() >= 1, "objections stated with supported answers or retained limitations")
  for o in objections {
    require(word-count(o.at("objection", default: "")) >= 3, "an objection must be stated in words: " + repr(o.at("objection", default: "")))
    require(word-count(o.at("rebuttal", default: "")) >= 5, "provide a supported answer or retained limitation: " + repr(o.at("rebuttal", default: "")))
  }
  require(type(abandoned) == dictionary and nonempty(abandoned.alternative) and nonempty(abandoned.why), "the abandoned alternative and why you rejected it is required")
  check-numbers(numbers)
  require(numbers.len() == 3, "the executive summary carries THE THREE NUMBERS, each with one line of support — " + str(numbers.len()) + " given")

  set page(paper: "us-letter", margin: (x: 0.75in, y: 0.5in), footer: sources-footer(sources, evidence-link: evidence-link), foreground: overflow-stamp())
  base-style(size: 9.5pt)[
    #band("Executive summary", room, distribution, date, demo: demo, lockup: lockup)
    #v(4pt)
    #text(size: 16pt, weight: "semibold", fill: pic.ink-900, tracking: -0.02em)[#datapov]
    #v(4pt)
    #situation #h(4pt) #text(style: "italic", fill: pic.ink-650)[but] #h(4pt) #but
    #h(4pt) #complication #h(4pt) #text(style: "italic", fill: pic.ink-650)[so] #h(4pt) #so
    #v(4pt)
    #block(fill: pic.alert.lighten(88%), stroke: (left: 3pt + pic.alert), inset: 8pt, radius: 10pt, width: 100%)[
      #field-label("The ask") #h(4pt) #resolution
    ]
    #v(4pt)
    #if figure != none [
      #align(center, figure.body)
      #v(2pt)
      #text(size: 8pt, fill: pic.ink-650)[#figure.caption]
      #v(4pt)
    ]
    #if numbers.len() > 0 [ #field-label("The three numbers") #v(4pt) #number-tiles(numbers) #v(4pt) ]
    #field-label("Risks and costs, priced") #v(4pt) #risks
    #v(4pt)
    #field-label("Objections and the road not taken") #v(4pt)
    #for o in objections [ #text(weight: "bold")[#o.objection] #h(3pt) #o.rebuttal #linebreak() ]
    #text(weight: "bold")[#abandoned.alternative] #h(3pt) #abandoned.why
  ]
  assert-one-page("executive summary")
}

// =====================================================================================
// TEACH-BACK CARD — one card per beat; a NON-PRESENTER can deliver it cold.
// =====================================================================================
#let teach-back-card(
  beat: none,                           // ≤ 8 words
  say: none,                            // 2–4 spoken sentences; interpretation before magnitude; NOT bullets
  if-asked: none,                       // (question: "...", answer: "...")  — mandatory
  guard: none,                          // (exact: ("...", ...), scaled: ("...", ...))  — both lines
  source-tier: none,                    // "gated" | "prototype"
  last-verified: none,                  // date
  do-not-say: (),                       // bans carried on the card
  mark: none,                           // "IS" | "COULD" | "STAR" | "ASK" | "BLISS" (optional)
  lockup: auto,
  demo: false,                          // forced true when the EXACT lines cite synthetic sources
) = {
  require(nonempty(beat) and word-count(beat) <= 8, "BEAT title is 8 words or fewer: \"" + str(beat) + "\"")
  require(is-prose(say), "SAY is the sound bite plus its runway — sentences for the mouth, never a bullet list")
  require(sentence-count(say) >= 2 and sentence-count(say) <= 4, "SAY is 2–4 spoken sentences; " + str(sentence-count(say)) + " found")
  check-date("last-verified", last-verified)
  require(mark == none or mark in ("IS", "COULD", "STAR", "ASK", "SUM", "BLISS"), "mark must be one of IS / COULD / STAR / ASK / SUM / BLISS: " + repr(mark))
  // NO minimum length: room-artifacts.md names "we don't know" as the right answer where true,
  // and a word-count floor would forbid the honest one. Non-empty is the whole requirement.
  require(type(if-asked) == dictionary and "question" in if-asked and "answer" in if-asked
    and nonempty(if-asked.question) and nonempty(if-asked.answer),
    "IF ASKED is mandatory: the hard question this beat invites and its honest answer (\"we don't know\" where true)")
  // Type-check the dictionary BEFORE indexing it, or a `guard: none` call dies with Typst's own
  // "type none has no method at" instead of this form's message.
  require(type(guard) == dictionary and "exact" in guard and "scaled" in guard
    and type(guard.exact) == array and type(guard.scaled) == array
    and guard.exact.len() > 0 and guard.scaled.len() > 0,
    "NUMBER GUARD needs both lines as arrays: EXACT (never drift) and ROOM-SCALED (approximate ONCE, here)")
  for e in guard.exact {
    require(nonempty(e), "an empty EXACT line is not a guard")
    require(e.match(regex("[0-9]")) != none, "each EXACT line carries the derived FIGURE: " + e)
    require(e.contains("(") and e.contains(")"), "each EXACT line carries its source page in parentheses: " + e)
  }
  for s in guard.scaled { require(nonempty(s), "an empty ROOM-SCALED line is not a guard") }
  // A card cites synthetic sources like every other room artifact, so it carries the same band.
  require(demo or not looks-synthetic(guard.exact + guard.scaled + do-not-say + (say, if-asked.answer)),
    "the card cites a synthetic source — pass demo: true so the DEMO chip shows")
  require(source-tier in ("gated", "prototype"), "source-tier must be gated or prototype")
  require(nonempty(last-verified), "last-verified date is the card's hygiene line")

  // The card is index-card sized, so the lockup rides small (0.6in) inline with the top
  // row rather than the band's full 1.1in — a full-width lockup would not fit the format.
  let card = block(width: 100%, stroke: 0.75pt + pic.ink-200, radius: 10pt, inset: 8pt, breakable: false)[
    #set text(font: fonts, size: 9pt, fill: pic.ink-700)
    #grid(columns: (auto, 1fr, auto, auto), gutter: 8pt, align: (left, left, left, horizon),
      mark-chip(mark),
      text(size: 11pt, weight: "semibold", fill: pic.ink-900, tracking: -0.015em)[#beat],
      text(size: 7pt, fill: pic.ink-650)[#if demo [#text(fill: pic.alert, weight: "bold")[DEMO] · ] #source-tier · verified #last-verified],
      room-lockup(lockup, width: 0.9in),
    )
    #v(4pt)
    #field-label("Say") #v(4pt) #say
    #v(4pt)
    #field-label("If asked") #v(4pt) #text(style: "italic")[#if-asked.question] #linebreak() #if-asked.answer
    #v(4pt)
    #block(fill: pic.ink-100, inset: 8pt, radius: 10pt, width: 100%)[
      #field-label("Number guard") #v(4pt)
      #text(size: 8pt)[#text(weight: "bold", fill: pic.dark-surface)[EXACT] #h(4pt) #guard.exact.join(" · ")]
      #linebreak()
      #text(size: 8pt)[#text(weight: "bold", fill: pic.dark-surface)[ROOM-SCALED] #h(4pt) #guard.scaled.join(" · ")]
      #if do-not-say.len() > 0 [
        #linebreak()
        #text(size: 8pt)[#text(weight: "bold", fill: pic.alert)[DO NOT SAY] #h(4pt) #do-not-say.join(" · ")]
      ]
    ]
  ]
  // A card that does not fit its card is not a card: measure against the page's content box and
  // refuse to clip. Fix by cutting the SAY/IF ASKED text, never by shrinking the type.
  layout(sz => {
    let h = measure(block(width: sz.width, card)).height
    if h > sz.height { panic("pic-room: teach-back card \"" + beat + "\" is " + repr(h) + " tall on a " + repr(sz.height) + " page — it would clip. Cut the text, don't shrink it.") }
    card
  })
}

// =====================================================================================
// BRIEFING (FYI, no action) — the DOWNSHIFT form. There is deliberately NO `ask` parameter:
// passing one is a compile error, which is the point.
// =====================================================================================
#let briefing(
  room: none, distribution: none, date: none,
  summary: none,                        // the truest one-line account — accurate, not arguable
  points: (),                           // short prose paragraphs, sound-bite discipline kept
  numbers: (),                          // ≤ 3, room-scaled, traceable
  sources: (), evidence-link: none, demo: false, lockup: auto,
) = {
  check-common(room, distribution, sources, demo)
  check-date("DATE", date)
  check-synthetic-everywhere(demo, sources, numbers, evidence-link)
  require(nonempty(summary), "a briefing opens with the truest one-line summary of the situation")
  require(points.len() >= 1, "a briefing carries at least one point")
  for p in points { require(is-prose(p), "briefing points are prose, not bullets: " + p) }
  check-numbers(numbers)

  // A briefing is read on a screen (posted-after / emailed), and it is short by nature. The page
  // takes the height of its content so the sheet is not half dead canvas (COMPOSITION fill floor).
  set page(width: 8.5in, height: auto, margin: (x: 0.8in, top: 0.6in, bottom: 0.5in), foreground: overflow-stamp())
  base-style(size: 10pt)[
    #band("Briefing — for information, no action requested", room, distribution, date, demo: demo, lockup: lockup)
    #v(8pt)
    #text(size: 14pt, weight: "semibold", fill: pic.ink-900, tracking: -0.02em)[#summary]
    #v(8pt)
    #for p in points [ #p #v(4pt) ]
    #if numbers.len() > 0 [ #v(4pt) #number-tiles(numbers) ]
    #v(8pt)
    #sources-footer(sources, evidence-link: evidence-link)
  ]
}
