---
name: {{org-short-slug}}-brand-guidelines
description: Apply the official {{Organization Name}} brand — colors, typography, and logo usage — to documents, decks, web artifacts, dashboards, letterhead, and printables. Use whenever producing {{Organization Name}}-branded material, or when brand colors, typography, or logo rules apply.
---

# {{Organization Name}} Brand Guidelines

## How to fill this in

This is a one-page reference card, not the brand pack itself. Fill every
`{{placeholder}}` from the organization's actual brand book and its
`tokens.json` brand pack (see `tokens.schema.md` in this kit). Where the brand
book is silent on something this template asks for, decide it once here
rather than letting it get re-decided ad hoc on every artifact. Keep this
card in sync with the tokens pack — if they disagree, whichever is easier to
regenerate automatically should be treated as the mirror, and the other as
the source of truth; say which is which.

Apply the official **{{Organization Name}}** brand identity to any artifact.
{{One-line description of what the organization is and, if relevant, who it
reports to or is powered by.}} When in doubt, the authoritative source is
{{the organization's brand book file name/location}} and the official logo
files.

**Keywords**: branding, {{org name}} brand, visual identity, brand colors,
typography, logo usage, letterhead, co-branding.

## Colors

{{If the organization has only one palette, delete the "two color sets"
framing below and use a single table. Many organizations end up with two:
a palette for documents/web/promotional use, and a second, narrower set of
exact fills used only inside a logo mark's artwork. If both exist, they will
not be identical — say so plainly rather than letting someone assume they
match.}}

### 1. Main brand palette — for copy, promotionals, web, design

{{State the hierarchy rule: do these colors carry equal weight, or is one a
primary anchor with the rest as accents? Say which color is the neutral
ink/body-copy color and which is the light neutral for backgrounds and
dividers — every brand needs both, and neither should be pure black or pure
white if the brand book says otherwise.}}

| Color | Hex | RGB | CMYK | Role |
|---|---|---|---|---|
| {{Color name}} | `{{#HEXHEX}}` | {{r g b}} | {{c m y k}} | {{primary / accent / etc.}} |
| {{Color name}} | `{{#HEXHEX}}` | {{r g b}} | {{c m y k}} | {{role}} |
| {{Color name}} | `{{#HEXHEX}}` | {{r g b}} | {{c m y k}} | {{role}} |
| **{{Neutral ink name, e.g. Charcoal}}** | `{{#HEXHEX}}` | {{r g b}} | {{c m y k}} | **all body copy (not pure black)** |
| **{{Light neutral name}}** | `{{#HEXHEX}}` | {{r g b}} | {{c m y k}} | **backgrounds, dividers** |

### 2. Logo mark colors — only for reproducing the mark artwork

{{Delete this section if the organization's mark uses the exact same fills as
the main palette. Keep it if the actual SVG/vector artwork for the logo mark
uses slightly different values than the promotional palette — this happens
more often than not, and it is a real, intentional gap between art file and
brand system, not an error to "fix" by making them match.}}

These are the actual fills in the mark artwork. They differ from the main
brand palette **by design** — use these **only** when recreating the mark
itself, never as the general document/design palette.

| Element | Hex |
|---|---|
| {{mark element, e.g. primary shape}} | `{{#HEXHEX}}` |
| {{mark element}} | `{{#HEXHEX}}` |
| {{outline / ink}} | `{{#HEXHEX}}` |

## Typography — pick by surface

{{Most brands end up needing at least two type choices: one for web (an
open-license or system-safe webfont) and one for print/slides (often a
licensed or OS-bundled font not meant to ship on the open web). If the
organization uses one typeface everywhere, delete the surface split and say
so — but check first; a single-font system is the exception, not the rule.}}

- **Web → {{Web typeface}}** (weights {{list}}). For web UI, HTML artifacts,
  or anything meant to read as the live site. {{License note — e.g. open
  license and embeddable, or a paid webfont license the org holds.}} Stack:
  `"{{Web typeface}}", {{fallback stack}}`.
- **Print / slides / documents → {{Print typeface}}** {{+ a display cut, if
  one exists}}. {{License note — desktop/OS-bundled fonts are not
  redistributable; note where the licensed files actually live, and do not
  bundle them in anything meant to be shared or open-sourced.}} Stack:
  `"{{Print typeface}}", {{fallback stack}}`.
- **Weights/usage:** {{headings weight}}; large display titles may use
  {{light/other weight}}. Body {{regular weight}}. Body color: **{{neutral
  ink name}}**, not pure black. {{Fallback font}} is a fallback only, never
  the intended face.

## Logo usage

- **Primary logo** = {{describe the full lockup — mark + wordmark + any
  tagline}}.
- **Secondary logo** = {{describe any stacked or co-brand lockup, and when
  it's preferred over the primary}}.
- The words **"{{organization's full name}}" must always appear**, unless
  {{the mark/icon alone}} is being used as a standalone design element.
- {{Any tagline}} may be removed only when {{the condition — usually a
  minimum-size threshold}}.
- **Minimum sizes:** full lockup **{{X}} wide**; mark alone **{{Y}} wide**.
- **Clearspace:** keep clear space on all sides at least equal to
  {{the clearspace rule — often defined relative to a letterform in the
  wordmark}} — the logo must never be obstructed.
- **Variants allowed:** {{list: full color, single-tone dark, single-tone
  light/white, grayscale, etc.}}
- **Co-sponsorship:** when sharing equal billing with another entity, all
  logos should be **similar in size**.

## Where the rest of the brand lives

This card is the brand-fundamentals extract. Other places carry the same
brand values, and they must agree with each other:

| You need | Go to |
|---|---|
| Full token set (palette, ink scale, semantic roles, type scale, dataviz palette) | the organization's **brand pack** `tokens.json` — see `tokens.schema.md` in this kit for the schema |
| Charts, figures, maps, tables in the organization's style | the org's **chart package**, whose palette should derive from the same `tokens.json` and be checked against it programmatically |
| Proof they still agree | {{a parity-check script or manual review step, if one exists — build one before the brand pack and the chart package can drift apart silently}} |

## Official logo / mark assets

Authoritative source = {{where the master brand book and logo files live —
a shared drive, a design-system project, a vendor deliverable}}.

| Asset | Path |
|---|---|
| Mark — color | {{path}} |
| Mark — single-tone (dark) | {{path}} |
| Mark — single-tone (light/white) | {{path}} |
| Wordmark | {{path}} |
| Co-brand lockup | {{path}} |
| Brand book (authoritative) | {{path}} |

{{If there are known-stale duplicate copies elsewhere, name them here and say
not to use them — a stale asset that nobody flags gets reused by the next
person who finds it first.}}

## Applying to artifacts

- **Documents / printables / slides (ink-on-white):** {{print typeface}};
  {{neutral ink}} body text; use brand colors as **accents** (headers, rules,
  keys) — not large fills, unless the brand book explicitly calls for bold
  color blocking. Generous whitespace. {{Any standard footer/attribution
  line the org uses.}}
- **Web / HTML artifacts / dashboards:** {{web typeface}}; brand colors can
  be used more boldly; {{light neutral}} for backgrounds and dividers.
- **Always** include the organization's name or wordmark per the rules above,
  and use the designated neutral ink color (not pure black) for copy.
