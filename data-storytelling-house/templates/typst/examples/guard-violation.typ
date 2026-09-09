// NEGATIVE example — this file is SUPPOSED to fail to compile. It proves the guards fire.
// Expected error:  pic-room: THREE NUMBERS cap: 4 given; a room retains about three
//   typst compile --root . examples/guard-violation.typ   →  exit code 1
#import "../pic-room.typ": briefing

#briefing(
  room: "Riverbend Materials Consortium board",
  distribution: "room-only",
  date: "September 4, 2026",
  summary: "Four numbers is one too many.",
  points: ("One point.",),
  numbers: (
    (scaled: "one", exact: "1 unit", source: "a real source"),
    (scaled: "two", exact: "2 units", source: "a real source"),
    (scaled: "three", exact: "3 units", source: "a real source"),
    (scaled: "four", exact: "4 units", source: "a real source"),
  ),
  sources: ("a real source",),
)
