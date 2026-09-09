// NOTE: @slidev/client/styles/layouts-base.css is deliberately NOT imported.
// Its element rules (`.slidev-layout h1 { @apply text-4xl }`, specificity 0-1-1)
// outrank this theme's type-scale classes (0-1-0) and silently flatten every
// headline to 36px. The theme supplies its own markdown defaults instead.
//
// Three layers, in this order:
//   tokens.css  GENERATED from a brand pack's tokens.json (theme-tokens.css); PIC's by default.
//               Copy your pack's theme-tokens.css over it.
//   fonts.css   @font-face for the brand typeface. Internal copy bundles Aptos; the public cut
//               ships a stub that falls back to system-ui. Your pack writes its own.
//   theme.css   the rules. Reads only --brand-<role>, --brand-<name>, --ink-NNN, --paper,
//               --font-sans, --font-display, --font-mono; never a brand colour by name.
import './tokens.css'
import './fonts.css'
import './theme.css'
