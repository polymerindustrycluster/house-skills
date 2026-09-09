// NEGATIVE example — MUST FAIL. House style spells dates out; a numeric date is a compile error.
// Expected:  pic-room: DATE must be a spelled-out date like "October 31, 2026"
#import "../pic-room.typ": briefing

#briefing(
  demo: true,
  room: "Riverbend Materials Consortium board",
  distribution: "room-only",
  date: "2026-09-04",
  summary: "An ISO date is not house style.",
  points: ("One point, in prose.",),
  numbers: ((figure: "1", scaled: "one thing", exact: "1 unit", source: "a real source"),),
  sources: ("a real source",),
)
