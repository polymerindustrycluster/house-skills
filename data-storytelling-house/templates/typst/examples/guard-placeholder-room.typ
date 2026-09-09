// NEGATIVE example — MUST FAIL. "stakeholders" is the placeholder the form's own message names.
// Expected:  pic-room: ROOM must be a named, specific audience
#import "../pic-room.typ": briefing

#briefing(
  demo: true,
  room: "stakeholders",
  distribution: "room-only",
  date: "September 4, 2026",
  summary: "A room nobody could walk into.",
  points: ("One point, in prose.",),
  numbers: ((figure: "1", scaled: "one thing", exact: "1 unit", source: "a real source"),),
  sources: ("a real source",),
)
