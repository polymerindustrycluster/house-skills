---
theme: ./
canvasWidth: 1920
title: slidev-theme-pic — layout smoke test
info: Renders every sanctioned layout once so a broken layout fails loudly instead of silently.
layout: pic-title
eyebrow: Theme check
headline: Every sanctioned PIC slide type, rendered once.
subtitle: If a layout is broken, it is broken here — not in a real deck.
date: September 4, 2026
meta: slidev-theme-pic · layout smoke test
# brandName: Your Organisation
# brandLogo: /brand/your-logo-color.svg
# brandLogoWhite: /brand/your-logo-white.svg
---

---
layout: pic-section
label: Theme check · masters
number: "01"
eyebrow: Section
headline: Dark masters run on deep teal.
---

Never white text on brand teal #1a8a9e. Dark surfaces are #0c6473 only.

---
layout: pic-content
label: Theme check · content
eyebrow: Content
headline: One assertion, a rule, and a body.
columns: 2
---

- **Assertion headline** — a sentence with a verb, never a topic label.
- **One dominant element** — at least twice the visual weight of anything else.
- **Footer chrome** — section label plus page, on every content slide.
- **One accent colour** per slide; the brand rainbow only where it encodes a system.

---
layout: pic-two-up
label: Theme check · compare
eyebrow: Compare
headline: Two column-blocked panels, full height.
leftLabel: Left panel
leftTitle: For the first audience
rightLabel: Right panel
rightTitle: For the second audience
---

- Column blocking is the FILL move
- Panels stretch, they do not float
- Four bullets is the ceiling

::right::

- The alternate rule runs purple
- Cards are for true cards only
- Never a box around the slide's primary content

---
layout: pic-quote
label: Theme check · quote
who: Marcus Reyes
where: VP Operations, Acme Polymers · PIC member since 2023
size: 84
quote: The cluster isn't a directory — it's a working group.
---

---
layout: pic-quote
dark: true
label: Theme check · sound bite
quote: A hero sound bite runs at one hundred and twenty pixels.
---

---
layout: pic-stat-grid
label: Theme check · numbers
eyebrow: By the numbers
headline: One hero numeral carries the slide.
hero:
  eyebrow: Award
  value: $51
  unit: M
  label: Federal Tech Hubs Phase 2 implementation award
stats:
  - eyebrow: Members
    value: "200"
    unit: +
    label: Member companies, labs, and workforce partners
  - eyebrow: Jobs
    value: 38K
    label: Regional jobs in polymer-related industries
note: Density ceiling — at most five numerals on a presented slide.
---

---
layout: pic-chart
label: Theme check · chart
eyebrow: Evidence
headline: The figure is the dominant element, not a decoration.
figure: ../figures/retention.png
alt: "Horizontal bar chart comparing two-year retention: 84% with first-year pilot-line access versus 71% without."
source: Two-year retention by first-year pilot-line access, 2023–25 cohorts.
limitation: Two firms, n = 48 — not yet a consortium-wide result.
---

The panel bleeds to the left and bottom edges.

The rail carries the reading, then **one source and one limitation**.

---
layout: pic-thank-you
from: From the Polymer Industry Cluster.
links:
  - label: Web
    value: polymerindustrycluster.org
  - label: Email
    value: hello@example.org
---
