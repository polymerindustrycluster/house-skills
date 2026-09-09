// NEGATIVE example — MUST FAIL. An objection listed but not answered is worse than one omitted:
// the reader sees their concern named and dismissed.
// Expected:  pic-room: a rebuttal must actually answer the objection
#import "../pic-room.typ": executive-summary

#executive-summary(
  demo: true,
  room: "Riverbend Materials Consortium board",
  distribution: "room-only",
  date: "September 4, 2026",
  datapov: "Approve the pilot line and hold seven more engineers per intake.",
  situation: "The consortium hired 118 early-career engineers in 2023.",
  but: "31 of the 2023 cohort left their firm within two years.",
  complication: "Two-year retention stands at 87 of 118 across that cohort.",
  so: "the consortium should give every first-year hire production exposure.",
  resolution: "Approve a $150,000 FY27 budget by October 31, 2026.",
  numbers: (
    (figure: "1 in 4", scaled: "left their firm", exact: "26% attrition (31 of 118)", source: "a real source"),
    (figure: "13 points", scaled: "higher with line time", exact: "84% (21 of 25) vs 71% (66 of 93)", source: "a real source"),
    (figure: "7", scaled: "kept per intake", exact: "7 = 94 − 87", source: "a real source"),
  ),
  risks: "The pilot costs $150,000 in the first year and roughly $60,000 a year after that.",
  objections: ((objection: "\"They'd leave anyway.\"", rebuttal: "."),),
  abandoned: (alternative: "A retention bonus", why: "costs $1.2M across the cohort and pay ranks fourth."),
  sources: ("a real source",),
)
