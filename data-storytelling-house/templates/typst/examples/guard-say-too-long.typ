// NEGATIVE example — MUST FAIL. Five sentences, the last with no full stop — the exact shape that
// slipped the SAY cap before the counter learned to count an unterminated trailing sentence.
// Expected:  pic-room: SAY is 2–4 spoken sentences; 5 found
#import "../pic-room.typ": teach-back-card, fonts

#set page(width: 5in, height: 7in, margin: 0.3in)
#set text(font: fonts)

#teach-back-card(
  demo: true,
  mark: "IS",
  beat: "Too many sentences",
  say: "One sentence here. Two sentences here. Three sentences here. Four sentences here. Five without a period",
  if-asked: (question: "Why does this fail?", answer: "Because the SAY block is capped at four spoken sentences."),
  guard: (exact: ("26% attrition, 31 of 118 (a real source)",), scaled: ("about a quarter",)),
  source-tier: "gated",
  last-verified: "September 2, 2026",
)
