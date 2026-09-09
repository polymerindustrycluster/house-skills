// Example: teach-back cards — one card per beat, printable at index-card size.
//   typst compile --root . --font-path "$BRAND_FONTS" examples/teach-back-cards.typ
// Or run the named check, which compiles every example: BRAND_FONTS=... bash ../check.sh
// DEMO — fictional organisation, synthetic numbers. Dataset derivation is in one-page-ask.typ.
#import "../pic-room.typ": teach-back-card, fonts
#let pic-lockup = none   // your mark, e.g. image("../logos/lockup.png", width: 0.9in)

// A FIXED page, deliberately: on an auto-height page the library's clip guard has nothing to
// measure against, so the happy path would never exercise it. 5×7in is the house print size.
#set page(width: 5in, height: 7in, margin: 0.3in)
#set text(font: fonts)

#teach-back-card(
  demo: true,
  lockup: pic-lockup,
  mark:"IS",
  beat: "The leavers change industry, not region",
  say: "Almost none of the engineers we lose go to another polymer employer. Thirty-one of the 118 we hired in 2023 had left their firm two years later, mostly for logistics and software. So this is not a Riverbend-versus-Akron problem — it is a polymer-versus-everything-else problem.",
  if-asked: (
    question: "How do you know where they went?",
    answer: "The 2026 exit survey reached 24 of the 31 leavers, and it is self-reported. Seven of those gave no destination, so treat the split as indicative rather than exact.",
  ),
  guard: (
    exact: ("31 of 118 left within two years (evidence-room/demo/retention)", "15 logistics or software, 2 other polymer employer, 7 unstated (exit survey 2026)"),
    scaled: ("about a quarter of the intake leaves", "most to another industry, almost none to another region"),
  ),
  source-tier: "gated",
  last-verified: "September 2, 2026",
  do-not-say: ("\"nobody goes to Akron\" (two of them did)", "\"they leave the industry\" (they left their FIRM)"),
)

#pagebreak()

#teach-back-card(
  demo: true,
  lockup: pic-lockup,
  mark:"STAR",
  beat: "Two firms already do it differently",
  say: "Two of our member firms put every new hire on a pilot line in their first year. They kept 21 of 25; everyone else kept 66 of 93. Same region, same pay bands, same age of hire. Nobody assigned that access at random, so it is the strongest association we have and not yet a proven cause.",
  if-asked: (
    question: "Are those two firms just better employers in other ways?",
    answer: "Possibly, and we cannot rule it out. That is the pilot's main assumption, written on the one-pager as a this-is-true-if, and running the rotation across members is what would test it.",
  ),
  guard: (
    exact: ("84% (21 of 25) vs 71% (66 of 93), 2023 cohort (evidence-room/demo/retention)",),
    scaled: ("13 points better", "roughly one extra engineer kept for every eight hired"),
  ),
  source-tier: "gated",
  last-verified: "September 2, 2026",
  do-not-say: ("\"every firm that does this\" (we have two)", "\"the pilot line keeps them\" (association, not cause)"),
)
