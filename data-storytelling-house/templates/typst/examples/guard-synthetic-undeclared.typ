// NEGATIVE example — MUST FAIL. Sources that name a demo/synthetic origin force the DEMO band:
// the synthetic-data warning must not be opt-in, or a forgotten flag ships a real-looking artifact.
// Expected:  pic-room: SOURCES look synthetic (contain 'demo' or 'synthetic') — pass demo: true
#import "../pic-room.typ": briefing

#briefing(
  room: "Riverbend Materials Consortium board",
  distribution: "room-only",
  date: "September 4, 2026",
  summary: "Synthetic sources without the DEMO band.",
  points: ("One point, in prose.",),
  numbers: ((figure: "1", scaled: "one thing", exact: "1 unit", source: "a real source"),),
  sources: ("evidence-room/demo/retention (synthetic demo data)",),
)
