// NEGATIVE example — MUST FAIL. A well-formatted date can still be an impossible one.
// Expected:  pic-room: DATE must be a spelled-out date like "October 31, 2026"
#import "../pic-room.typ": briefing

#briefing(
  demo: true,
  room: "Riverbend Materials Consortium board",
  distribution: "room-only",
  date: "February 31, 2026",
  summary: "February has no 31st.",
  points: ("One point, in prose.",),
  numbers: ((figure: "1", scaled: "one thing", exact: "1 unit", source: "a real source"),),
  sources: ("a real source",),
)
