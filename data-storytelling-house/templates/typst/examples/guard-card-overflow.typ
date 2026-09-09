// NEGATIVE example — MUST FAIL. A teach-back card that does not fit its card would clip on the
// page; clipped text is how a NUMBER GUARD line disappears from the card that exists to carry it.
// Expected:  pic-room: teach-back card "A card with far too much runway" is … tall … would clip
#import "../pic-room.typ": teach-back-card, fonts

#set page(width: 5.5in, height: 4.25in, margin: 0.3in)
#set text(font: fonts)

#teach-back-card(
  demo: true,
  mark: "IS",
  beat: "A card with far too much runway",
  say: "This SAY block is deliberately long enough to overflow an index card. It keeps adding sentences about the retention study, the exit survey, the pilot line, the rotation commitment, the twelve-month usage check and the two-year measurement window. Each one is plausible spoken register, which is exactly why length has to be caught mechanically rather than by eye.",
  if-asked: (
    question: "Why would anyone write a card this long?",
    answer: "Because a card is written while looking at the analysis, not while standing at a podium, and the author cannot feel the page running out. That is what this guard is for, and the fix is always to cut the text rather than to shrink the type until it fits.",
  ),
  guard: (
    exact: ("31 of 118 left within two years (evidence-room/demo/retention)", "84% vs 71%, two firms, n = 48 (evidence-room/demo/retention)"),
    scaled: ("about a quarter of the intake leaves", "13 points better with pilot access"),
  ),
  source-tier: "gated",
  last-verified: "September 2, 2026",
  do-not-say: ("\"everyone leaves\"", "\"every firm that does this\""),
)
