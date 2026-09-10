# Brand pack `tokens.json` schema

This documents the shape of a brand pack: the single JSON file that turns an
organization's brand book into data a design system can consume
programmatically — for chart palettes, slide themes, web tokens, and the
brand card in this kit.

**Merge behavior.** A pack is validated against a set of defaults. Most dicts
(objects) deep-merge over the defaults, so you only specify the keys you are
overriding: the ink scale, the surface roles and the type scale come for free.
Two branches are the exception and REPLACE the defaults wholesale when you
supply them: `brand` and `dataviz.tokens`. A brand is the pack's whole
statement, not a patch on someone else's, so none of the default organization's
colours survive into your palette or your generated views. Lists replace the
default outright as well; specifying any `categorical` list, for example,
replaces the whole default list rather than appending to it. **A `null` value
anywhere, at any depth, including inside a list, means "unfilled" and fails
the pack check by naming its path.** A value whose type disagrees with the
default (a list where an object belongs) is refused the same way. Do not leave
a role null and assume a default silently covers it; either supply a real
value or omit the key so the default applies. If you replace `brand`, every
name in `roles`, `categorical` and `accessible_lines` must be one of yours,
and a dangling one is refused by role name at load.

## `schema_version`

The schema version this pack was written against, currently `1`. Bump this
only when the schema itself changes shape, not when brand values change.

## `pack`

Identity of the pack itself.

| Key | Meaning | Constraints |
|---|---|---|
| `org` | Full organization name | Free text |
| `short` | Short name or common abbreviation | Used in generated file headers and comments |
| `prefix` | CSS custom-property prefix | e.g. `prefix: "acme"` emits variables as `--acme-*`; must be a valid CSS identifier fragment, lowercase, no spaces |

## `brand`

The named brand hexes — the organization's actual palette, as literal color
values with human-readable names. This is the **chrome palette**: used for
title bars, accents, and lockups. It is never used directly for data
encoding in a chart — that's what `dataviz` is for, derived from these seeds
but held to its own contrast and colorblind-safety gates.

| Constraint | Detail |
|---|---|
| Each entry | A name (e.g. `blue`, `accent`) mapped to a hex string |
| Do not | Reuse a `brand` name as a `dataviz` categorical color without checking it against the dataviz gates below — a brand hex chosen for logo fidelity is not guaranteed to pass fill contrast or CVD separation |

## `ink`

The neutral scale, keyed `"900"` down to `"100"` (darkest to lightest),
anchored on the organization's chosen body-copy neutral (a warm charcoal, a
cool gray, etc.) rather than pure black or pure white.

| Constraint | Detail |
|---|---|
| Text usage | Only `900`, `700`, and `650` are sanctioned as text colors. Lighter steps (`500` and below) are fill/background tones, not text — a lighter gray is not a valid way to express a third tier of text hierarchy; use size or weight instead |
| Full range | Should span from a near-black anchor down to a near-white background tone, giving enough steps for borders, disabled states, and subtle fills without inventing one-off grays elsewhere |

## `roles`

Semantic role names, each pointing at either a `brand` name or an `ink.NNN`
step — never a raw hex. This indirection is what lets the underlying palette
shift without hunting down every place a color was used directly.

| Role | Typical use |
|---|---|
| `accent` | Primary interactive color — links, default buttons, focus rings |
| `highlight_fill` | A secondary emphasis fill, distinct from the primary accent |
| `alert` | Errors, destructive actions, urgent states |
| `research` | Or any other domain-specific semantic role the organization needs — name it for what it means, not what it looks like |
| `text` | Should point at an `ink` step, not a `brand` color |
| `context` | Muted/secondary information — captions, metadata, timestamps |

Add roles as the organization's system needs them; the list above is a
starting set, not a ceiling.

## `type_scale`

| Key | Meaning | Constraints |
|---|---|---|
| `ratio` | The modular scale ratio driving step sizes | A number, e.g. `1.25` |
| `steps` | Named size steps: `source`, `label`, `body`, `title` (extend as needed) | Each resolves to a size derived from `ratio`, or an explicit override |

## `typography`

| Key | Meaning | Constraints |
|---|---|---|
| `family` | The body/UI typeface name | Must have a real `web_stack` fallback chain even if a licensed desktop font is preferred |
| `display_family` | The display/headline typeface, if distinct from `family` | May equal `family` if the organization uses one typeface everywhere |
| `files` | Paths to font files: `regular`, `semibold`, `bold`, `display_bold` | **Never bundle licensed font files in a shareable/open-sourced copy of the pack** — reference them by path in the organization's private pack only |
| `fallbacks` | Ordered list of system-safe fallback font names | Used when the primary files aren't available (web rendering, missing install) |
| `web_stack` | The full CSS `font-family` stack for web use | Should degrade gracefully to a system font, never to serif-default |

## `footer`

| Key | Meaning | Constraints |
|---|---|---|
| `logo_paths` | List of logo file paths for footer/lockup use, relative to the pack | An empty list means no lockup is applied by default — this is a valid, intentional state, not a missing value |

## `categorical`

An ordered list of token names (pointing into `dataviz`, see below) to cycle
through when a chart needs a series color per category, in the order they
should be assigned.

## `accessible_lines`

An ordered list of token names suitable for line/stroke encodings (chart
lines, not fills) — kept separate from `categorical` because line-contrast
requirements against a background differ from fill-contrast requirements.

## `dataviz`

The chart-safe palette, derived from the `brand` seeds but held to gates the
raw brand colors are not guaranteed to pass. This is the block a chart
package should read from — never `brand` directly.

| Key | Meaning |
|---|---|
| `tokens` | The full named set of dataviz-safe colors this palette defines |
| `categorical` | Ordered list for category/series encoding (may mirror the top-level `categorical` or define its own) |
| `accessible_lines` | Ordered list for line encodings |
| `safe_n` | The number of categorical colors guaranteed to be colorblind-distinguishable from each other, in order — beyond this count, colors may still be usable but are no longer guaranteed CVD-separable |
| `roles` | Semantic dataviz roles (e.g. a highlight color, a comparison color) distinct from generic `roles` above |
| `grays` | A dataviz-specific gray ramp, for non-data chart chrome (gridlines, axis text) |
| `sequential` | A 7-stop ramp for ordered/continuous data (e.g. low-to-high) |
| `diverging` | A 7-stop ramp for data with a meaningful midpoint (e.g. below/above average) |
| `binary` | A 2-color set for strictly binary encodings (yes/no, pass/fail) |
| `no_data` | The token used to represent missing/null data points, visually distinct from every real data value |

**Gates every `dataviz` palette must pass** before it ships:

- **3:1 minimum fill contrast** — every categorical/sequential/diverging
  color against the surfaces it will actually render on.
- **CVD separation for the first `safe_n` colors** — the first `safe_n`
  entries in `categorical` must remain distinguishable under common
  color-vision-deficiency simulations, in the stated order.
- **4.5:1 text-on-fill contrast** — wherever a dataviz color is used as a
  fill behind text (a stat card, a labeled chip), not just as a bare chart
  mark.
- **Monotonic sequential luminance** — each `sequential` ramp must move
  luminance in one consistent direction end to end, with no step that
  reverses or plateaus, so the ramp still reads as ordered in grayscale.

## `surfaces`

Canvas-relative roles — colors defined by their relationship to a background,
not as standalone brand colors.

| Key | Meaning |
|---|---|
| `paper` | The light/default surface: background, text, and border roles for a light canvas |
| `dark` | The dark/inverse surface: the same role set, redefined for a dark canvas |

Both `paper` and `dark` may be partially or fully inherited from schema
defaults — a pack only needs to override what differs from the default
light/dark pair.
