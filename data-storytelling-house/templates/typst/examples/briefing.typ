// Example: FYI briefing — the DOWNSHIFT form. No ask slot exists; adding `ask:` will not compile.
//   typst compile --root . examples/briefing.typ
// DEMO — fictional organisation, synthetic numbers.
#import "../pic-room.typ": briefing
#let pic-lockup = none   // your mark, e.g. image("../logos/lockup.png", width: 1.1in)

#briefing(
  demo: true,
  lockup: pic-lockup,
  room: "Riverbend Materials Consortium members — monthly update email, September 8, 2026",
  distribution: "posted-after",
  date: "September 4, 2026",
  summary: "The retention study is complete, 87 of the 118 engineers hired in 2023 are still with us, and the board considers a pilot-line proposal on September 18, 2026.",
  points: (
    "The study followed the 118 early-career engineers hired in 2023, the only cohort with two full years behind it. Of those, 31 had left their member firm.",
    "Most leavers went to logistics or software; almost none went to another polymer employer. That is why the proposal on the table is about production exposure rather than pay.",
    "Nothing is being asked of members in this update. If the board approves the pilot in September, a separate note will set out what participation involves.",
  ),
  numbers: (
    (figure: "31", scaled: "of the 2023 cohort left their firm", exact: "31 of 118 hired in 2023", source: "evidence-room/demo/retention"),
  ),
  sources: ("evidence-room/demo/retention (gated)", "member exit survey 2026, 24 of the 31 leavers replied"),
)
