// NEGATIVE example — MUST FAIL. The hero figure is deliberately approximate, but "9 in 10" over
// a 26% EXACT line is not an approximation; it is a different number.
// Expected:  pic-room: the hero figure "9 in 10" (90%) contradicts its EXACT line
#import "../pic-room.typ": briefing

#briefing(
  demo: true,
  room: "Riverbend Materials Consortium board",
  distribution: "room-only",
  date: "September 4, 2026",
  summary: "The hero figure disagrees with the exact line.",
  points: ("One point, in prose.",),
  numbers: ((figure: "9 in 10", scaled: "left their firm", exact: "26% two-year attrition (31 of 118)", source: "a real source"),),
  sources: ("a real source",),
)
