// Example: one-page ask. Compile from the templates/typst dir (--font-path is REQUIRED — the hero
// figures set in the brand's display face, which lives in the brand pack's fonts/ folder rather
// than system-wide, and Typst falls back SILENTLY without it):
//   typst compile --root . --font-path "$BRAND_FONTS" examples/one-page-ask.typ
// Or just run the named check, which compiles every example: BRAND_FONTS=... bash ../check.sh
// DEMO — fictional organisation. The dataset is deliberately TINY and stated as INTEGER COUNTS,
// because percentages invented for a demo can be internally consistent and still describe no
// possible group of people (a refute council proved "84% of 48" is unreachable at any split).
// The whole dataset, which every artifact draws from:
//   118 engineers hired in 2023 — the only cohort with two full years behind it by September 2026
//   25 of them got first-year pilot-line time: 21 stayed (84%)
//   the other 93 did not: 66 stayed (71%)
//   87 stayed in all; 31 left their member firm (26%)
//   at an 80% target the cohort would keep 94, which is 7 more than 87
#import "../pic-room.typ": one-page-ask
// The mark is the DOCUMENT's to supply (no mark is bundled with the form). Internally this is the
// PIC lockup; a brand pack points at its own, e.g. image("../logos/lockup.png", width: 1.1in).
#let pic-lockup = none   // your mark, e.g. image("../logos/lockup.png", width: 1.1in)

#one-page-ask(
  demo: true,
  lockup: pic-lockup,
  room: "Riverbend Materials Consortium board — 7 members, quarterly meeting, September 18, 2026",
  distribution: "forwarded-freely",
  date: "September 4, 2026",
  big-idea: "Riverbend is not losing its young polymer engineers to other regions. It is losing them to other industries, and a shared pilot line is modelled to keep seven of every thirty-one who go.",
  situation: "Riverbend's polymer employers hired 118 early-career engineers in 2023, the strongest intake in a decade. Their own survey says the hiring pipeline works.",
  complication: "Two years on, 31 of those 118 had left their member firm. Almost none went to another polymer employer; they went to logistics and software.",
  resolution: "Fund a shared process pilot line so early-career engineers touch real production in year one. At an 80% target the cohort keeps 94 rather than 87 — seven more engineers.",
  ask: (decision: "Approve a $150,000 pilot-line budget for FY27", by: "October 31, 2026", owner: "Executive Committee"),
  numbers: (
    (figure: "31", scaled: "of the 2023 cohort left their firm", exact: "31 of 118 hired in 2023", source: "evidence-room/demo/retention"),
    (figure: "13 points", scaled: "the retention gap", exact: "84% (21 of 25) vs 71% (66 of 93)", source: "evidence-room/demo/retention"),
    (figure: "7", scaled: "more engineers kept at an 80% target", exact: "7 = 94 − 87", source: "pilot-model/demo v0.3"),
  ),
  grid-rows: (
    (what: "Stand up the shared pilot line", why: "Because the leavers cite \"never touched production\" as the top reason, and the survey item moves with pilot exposure", how: "Lease bay at the Riverbend incubator; two shift technicians; open to all member firms by rota"),
    (what: "Rotate every first-year hire through it", why: "Because retention in the two firms with in-house pilot access is 84% against 71% elsewhere — an association, not yet a tested cause", how: "Members commit 4 weeks per hire in year one; consortium tracks completion"),
    (what: "Measure at 24 months, report at 12", why: "Because a two-year rate cannot be known in one; the 12-month check catches a pilot that is not being used", how: "Quarterly headcount pull from members; board sees the 12-month read in Q4 FY27"),
  ),
  objections: (
    (objection: "\"They'd leave anyway; it's a generational thing.\"", rebuttal: "The two firms with pilot access have the same age profile and 13 points better retention. Generation is constant; access is not."),
    (objection: "\"$150k is a lot for a maybe.\"", rebuttal: "Replacing one early-career engineer costs about $45k; keeping four pays for the pilot."),
  ),
  abandoned: (alternative: "A retention bonus at 18 months", why: "$1.2M across the cohort, and pay is the fourth reason for leaving, not the first."),
  assumptions: (
    "This is true if the two pilot-access firms are not different in some other way that drives retention.",
    "This is true if member firms actually release hires for the four-week rotation.",
  ),
  sources: ("evidence-room/demo/retention (gated)", "member exit survey 2026, 24 of the 31 leavers replied", "pilot-model/demo v0.3 (prototype)"),
  evidence-link: "https://example.org/evidence-room/demo/retention",
)
