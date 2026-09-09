// NEGATIVE example — MUST FAIL. A briefing has NO ask slot: an FYI that smuggles an ask is a
// real ask dressed as a briefing to dodge the gates.
// Expected:  error: unexpected argument: ask
#import "../pic-room.typ": briefing

#briefing(
  demo: true,
  room: "Riverbend Materials Consortium board",
  distribution: "room-only",
  date: "September 4, 2026",
  summary: "This briefing tries to carry an ask.",
  points: ("One point, in prose.",),
  ask: (decision: "Approve something", by: "October 31, 2026"),
  numbers: ((figure: "1", scaled: "one thing", exact: "1 unit", source: "a real source"),),
  sources: ("a real source",),
)
