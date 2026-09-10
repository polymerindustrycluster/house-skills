// Generated from tokens.json by scripts/assert_palette_matches_tokens.py. Do not edit.
// Template contract for Typst forms: `tokens` is keyed by ROLE (accent, dark-surface, action, ...),
// then by brand colour name, then ink-NNN and paper. `fonts` and `display-fonts` are stacks of
// INSTALLED families (typography.family + fallbacks); the CSS view's --font-sans is the browser
// stack (typography.web_stack) and differs by medium on purpose.
// `lockup-path` is the pack's first footer mark, relative to the pack (keep logos/ beside the forms).
// Keys that are Typst keywords are quoted; read them with tokens.at("context").
#let tokens = (
  accent: rgb("#1A8A9E"),
  highlight-fill: rgb("#B8D637"),
  alert: rgb("#E5673E"),
  research: rgb("#995480"),
  text: rgb("#585955"),
  "context": rgb("#CDCFCA"),
  dark-surface: rgb("#0C6473"),
  action: rgb("#188295"),
  blue: rgb("#1A8A9E"),
  light-blue: rgb("#66D7DE"),
  green: rgb("#B8D637"),
  orange: rgb("#E5673E"),
  yellow: rgb("#FFAE3B"),
  purple: rgb("#995480"),
  charcoal: rgb("#585955"),
  light-gray: rgb("#E6E7E8"),
  blue-dark: rgb("#0C6473"),
  action-teal: rgb("#188295"),
  tech-hubs-navy: rgb("#193958"),
  ink-900: rgb("#2B2C2A"),
  ink-800: rgb("#404140"),
  ink-700: rgb("#585955"),
  ink-650: rgb("#656661"),
  ink-600: rgb("#6D6E6A"),
  ink-500: rgb("#888A85"),
  ink-400: rgb("#A8AAA5"),
  ink-300: rgb("#CDCFCA"),
  ink-200: rgb("#E6E7E8"),
  ink-100: rgb("#F1F2F0"),
  paper: rgb("#FFFFFF"),
)
#let fonts = ("Aptos", "Arial", "Calibri", "Helvetica Neue", "DejaVu Sans")
#let display-fonts = ("Aptos Display", "Aptos", "Arial", "Calibri", "Helvetica Neue", "DejaVu Sans")
#let lockup-path = none
