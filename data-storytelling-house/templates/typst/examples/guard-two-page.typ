// NEGATIVE example — MUST FAIL. The one-page assertion is the library's headline guard, and it was
// the ONE guard the named check never exercised: disabling it left every check passing.
// Expected:  pic-room: executive summary ran to 2 pages
#import "../pic-room.typ": executive-summary

#executive-summary(
  demo: true,
  room: "Riverbend Materials Consortium board",
  distribution: "room-only",
  date: "September 4, 2026",
  datapov: "This summary is deliberately too long to fit on one page.",
  situation: "Riverbend's polymer employers hired 118 early-career engineers in 2023, and the consortium has tracked every one of them since. " * 6,
  but: "the summary you are reading now repeats itself until it cannot possibly fit inside a single sheet of US Letter paper. " * 6,
  complication: "The one-page rule exists because a reader must reach the ask without turning anything over, and this text defeats that. " * 6,
  so: "the guard should panic rather than quietly emit a second page that nobody intended to ship. " * 6,
  resolution: "If this compiles, the one-page assertion is not doing its job and the named check is lying. " * 6,
  numbers: (
    (figure: "31", scaled: "left their member firm", exact: "31 of the 118 hired in 2023", source: "a real source"),
    (figure: "13 points", scaled: "retention gap", exact: "84% (21 of 25) vs 71% (66 of 93)", source: "a real source"),
    (figure: "7", scaled: "kept at an 80% target", exact: "7 = 94 − 87", source: "a real source"),
  ),
  // Overflow must not depend on the band's lockup (2026-09-09: with no mark the band lost 1.1in
  // of height and this file fit on one page, reporting the guard as broken). Fill past any margin.
  risks: "The pilot costs money and time, and this sentence exists only to fill the page further. " * 14,
  objections: ((objection: "\"This will not fit.\"", rebuttal: "That is exactly the point of this negative example."),),
  abandoned: (alternative: "A shorter summary", why: "was rejected because this file must overflow to prove the guard."),
  sources: ("a real source",),
)
