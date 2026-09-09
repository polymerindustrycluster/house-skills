// Example: executive summary (first page of the Slidedoc / standalone handoff).
//   typst compile --root . examples/executive-summary.typ
// DEMO — fictional organisation, synthetic numbers. The figure is a pic-charts bundle image.
#import "../pic-room.typ": executive-summary
#let pic-lockup = none   // your mark, e.g. image("../logos/lockup.png", width: 1.1in)

#executive-summary(
  demo: true,
  lockup: pic-lockup,
  room: "Riverbend Materials Consortium — executive handoff",
  distribution: "forwarded-freely",
  date: "September 4, 2026",
  datapov: "Approve a $150,000 shared pilot line, and the model puts Riverbend seven engineers ahead in each year's intake.",
  situation: "Riverbend's polymer employers hired 118 early-career engineers in 2023, the strongest intake in a decade.",
  but: "two years on, 31 of them had left their member firm — most for logistics or software, almost none for another polymer employer.",
  complication: "The number that has to move is two-year retention, 87 of 118. The two member firms whose hires get pilot-line time in year one held 21 of 25; everyone else held 66 of 93.",
  so: "the consortium should give every first-year hire that same exposure through a shared pilot line, open to all members by rota.",
  resolution: "The ask is a $150,000 FY27 budget, decided by October 31, 2026. An 80% cohort is 94 engineers rather than 87, and the pilot pays for itself at four.",
  figure: (body: image("figures/retention.png", width: 46%), caption: "The 2023 cohort, two years on. Synthetic demo data."),
  numbers: (
    (figure: "31", scaled: "of the 2023 cohort left their firm", exact: "31 of 118 hired in 2023", source: "evidence-room/demo/retention"),
    (figure: "13 points", scaled: "the retention gap", exact: "84% (21 of 25) vs 71% (66 of 93)", source: "evidence-room/demo/retention"),
    (figure: "7", scaled: "more engineers kept at an 80% target", exact: "7 = 94 − 87", source: "pilot-model/demo v0.3"),
  ),
  risks: "The pilot costs $150,000 in FY27 and roughly $60,000 a year after, plus four weeks of each hire's first year. If members do not release hires, the money buys a bay nobody uses; the 12-month usage check catches that. Pilot access was never assigned at random, so the 13-point gap is an association this pilot is designed to test, and the 80% figure is a target rather than a measurement.",
  objections: (
    (objection: "\"They'd leave anyway.\"", rebuttal: "The two firms with pilot access have the same age profile and 13 points better retention, so age is not what separates them."),
  ),
  abandoned: (alternative: "An 18-month retention bonus", why: "was rejected: $1.2M across the cohort, and the exit survey ranks pay fourth among reasons for leaving."),
  sources: ("evidence-room/demo/retention (gated)", "member exit survey 2026, 24 of the 31 leavers replied", "pilot-model/demo v0.3 (prototype)"),
  evidence-link: "https://example.org/evidence-room/demo/retention",
)
