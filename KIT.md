# The house kit

Everything in this repository, plus the `pic-charts` package, is the craft layer of a small
organisation's evidence and presentation practice: how to turn a dataset and a question into a
published article, how to turn verified evidence into a room, and how to draw a chart that survives
review. None of it depends on the Polymer Industry Cluster's brand. **Your brand is a directory of
data you supply**; the code, the templates and the doctrine stay shared.

## What is in the box

| Piece | What it is | Licence |
|-|-|-|
| `data-journalism-house/` | the article craft: pitch gate, storyboarding, chart law, review gauntlet | CC BY-SA 4.0 |
| `data-storytelling-house/` | the room craft: decks, briefings, asks, teach-backs; Slidev theme + Typst forms | CC BY-SA 4.0 |
| `design-starter/` | the reusable half of a design system: composition law, slide types, a brand-card template, the token schema | CC BY-SA 4.0 |
| [`pic-charts`](https://github.com/polymerindustrycluster/pic-charts) | the chart package with accessibility and provenance gates; reads a brand pack | Apache-2.0 |

Your marks, fonts and photographs are yours and never enter any of these.

## Install, in order

1. **The two skills.** Copy `data-journalism-house/` and `data-storytelling-house/` into your
   agent's skills directory (`~/.claude/skills/`, `~/.codex/skills/`, or wherever your harness
   looks). They are prose; nothing to build.
2. **The chart package.**
   ```
   git clone https://github.com/polymerindustrycluster/pic-charts
   cd pic-charts && uv sync --extra dev && uv run pic-charts doctor
   ```
3. **Your brand pack.** Copy `pic-charts/brand-packs/_template/` somewhere private, fill every
   `null` in `tokens.json`, put your licensed font files in `fonts/` and your trimmed lockups in
   `logos/`, then from the pic-charts directory:
   ```
   uv run python scripts/brand_pack_check.py /path/to/your-brand
   uv run python scripts/assert_palette_matches_tokens.py --pack /path/to/your-brand --write
   ```
   The check exits 0 only when every gate passes; the second command writes `tokens.css`,
   `theme-tokens.css` and `tokens.typ` beside your `tokens.json`. The full procedure, including how
   to derive an accessible data palette from your logo colours, is `brand-packs/_template/README.md`.
4. **Point the consumers at the pack.**
   - Charts: `export PIC_CHARTS_BRAND_PACK=/path/to/your-brand` (or set it per command).
   - Slidev theme (`data-storytelling-house/templates/slidev/theme-pic/`): copy your
     `theme-tokens.css` over `styles/tokens.css`; write your `@font-face` rules into
     `styles/fonts.css` (the shipped file is a stub that falls back to `system-ui`); put your logos
     under your deck's `public/brand/` and name them in the deck headmatter as `brandLogo`,
     `brandLogoWhite` and `brandName`.
   - Typst forms (`data-storytelling-house/templates/typst/`): copy your `tokens.typ` over the one
     beside `pic-room.typ`, and run `check.sh` with `BRAND_FONTS=/path/to/your-brand/fonts`.
5. **Your design skill.** `design-starter/README.md` walks through assembling an organisation
   design skill from your brand book, the pack, the brand card and the slide types.

## What you still have to do yourselves

Derive the data palette (the check measures it, it does not invent it), look at every rendered
chart before shipping, and decide what your brand looks like. A palette that passes every gate and
looks wrong is still wrong.

## Provenance

Built for the Polymer Industry Cluster's evidence room and shared with its NEO-SMART partners in
September 2026. The canonical copies live in the maintainers' private tree; this repository is a
tagged snapshot. Report problems in the issue tracker of the repository you found them in.
