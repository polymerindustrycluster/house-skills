# Design starter

This is a reusable craft layer for a branded design system. It holds the parts
of a design system that do not change from one organization to the next: how a
slide earns its canvas, what makes a composition read as finished instead of
generated, the vocabulary of slide types, and the shape of a brand card. It
does not hold any organization's brand. There is no palette, no logo, no font
file, and no voice guide in this kit — those come from the organization that
adopts it.

Think of it as the grammar, not the sentence. The grammar transfers. The words
do not.

## What's in the kit

- `COMPOSITION.md` — the composition law: density ceilings, the canvas-fill
  floor, dominance rules, color-blocking rhythm, chart-on-slide rules, and the
  three-step review protocol. Every rule refers to a token role ("the
  dark-surface token", "the action accent"), never a literal color.
- `SLIDE-TYPES.md` — the seven sanctioned slide types as a vocabulary: each
  type's job, its dominant element, its density budget, its surface, its
  footer chrome, and its most common composition trap.
- `BRAND-CARD.template.md` — a fill-in-the-blanks brand card: palette table,
  typography by surface, logo rules, and pointers to where the rest of the
  brand lives.
- `tokens.schema.md` — the schema for a brand pack's `tokens.json`, documented
  key by key, with the accessibility gates a real pack must pass.

## What this kit is not

It is not a brand. It will not tell you what color your primary accent is,
what your logo's minimum size is, or what your organization's voice sounds
like. Those facts belong to the organization, live in its own brand book, and
get filled into the template files here.

It is also not complete on its own. A working design system needs four more
things this kit does not and cannot supply:

- **Font files.** Most brand typefaces are licensed for specific uses (a
  desktop license, a webfont license, an app-embedding license). A shareable
  kit cannot legally bundle someone else's paid or restricted font. Reference
  the family name and fallback stack; ship the actual files separately, inside
  the organization's own private brand pack, under whatever license the
  organization holds.
- **Logos.** A logo is a trademark, not a copyrightable asset an open-source
  license covers. Even a permissive code license does not grant permission to
  reproduce someone's mark. Keep logo files out of anything you intend to
  share or open-source; reference them by path and usage rule instead.
- **Photography with credit obligations.** Stock or licensed photography
  usually carries a required credit line, a usage-scope limit (web only, one
  campaign, non-commercial), or both. Don't bundle the images; note the credit
  requirement in the brand card so whoever uses a photo later knows to honor
  it.
- **Third-party partner marks.** Co-branding lockups, funder logos, sponsor
  marks — anything that isn't the organization's own identity — carry their
  owner's usage rules, not yours. Keep them out of a shareable kit for the
  same reason as your own logo, doubled.

If you're assembling a kit to hand to another team, or open-sourcing one,
strip all four of the above before you publish. What's left — the composition
law, the slide vocabulary, the brand card shape, the token schema — is safe to
share because it's craft, not a claimed identity.

## How to assemble an org design system from this starter

Do this in order. Each step needs the one before it.

1. **Brand book.** Start with whatever the organization already has: an
   official brand guidelines PDF, a style guide, or a founder's word on colors
   and type. If none exists, this is the point to write one — even a short one
   with a palette table, a type choice, and logo rules. Everything downstream
   depends on this being decided once, in one place, rather than re-decided on
   every artifact.

2. **A brand pack `tokens.json`.** Turn the brand book into data using the
   schema in `tokens.schema.md`. This is the step that makes the brand
   machine-readable: hex values, a neutral ink scale, semantic role mappings,
   a type scale, and — if the organization does data visualization — a
   dataviz palette that passes contrast and colorblind-safety gates. Fill in
   every field; a null value fails the pack check by design; do not leave a
   role unset and assume a default will cover it.

3. **The brand card.** Fill in `BRAND-CARD.template.md` from the tokens pack
   and the brand book. This becomes the one-page reference a person (or a
   generating model) checks before touching any brand surface: which color is
   which, which typeface goes on which surface, what the logo rules are, and
   where the fuller token pack and any chart-color package live.

4. **A slide theme.** Point `SLIDE-TYPES.md` and `COMPOSITION.md` at the new
   tokens: swap the token role names in this kit's composition law for the
   organization's actual CSS custom properties or theme variables, and build
   the seven slide types as real templates (HTML, PowerPoint master, Keynote
   theme — whatever the organization presents in). The slide vocabulary and
   the composition law do not change; only the token bindings do.

5. **Review protocol.** Adopt the three-step review protocol in
   `COMPOSITION.md` as-is: build and render, self-score every slide against
   the ceilings and the fill floor, then get a second, adversarial pass before
   anything ships. This step is cheap to skip and expensive to skip badly —
   it's the one that catches a technically-compliant slide that still reads as
   dead space, or a chart that shipped without its takeaway written on it.

Steps 1-3 are a few hours of work for someone who already knows the brand.
Step 4 is the bulk of the effort and scales with how many slide types and
surfaces the organization actually uses. Step 5 costs nothing once adopted and
catches the failures the first four steps can't — the ones only visible in a
rendered slide, not in the code that generated it.
