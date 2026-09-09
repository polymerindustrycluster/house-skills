#!/usr/bin/env bash
# check.sh — the named check for pic-room.typ. Run from anywhere:
#   BRAND_FONTS=/path/to/your-brand/fonts bash templates/typst/check.sh
# Exit 0 only if: every positive example compiles, the one-page forms are ONE page, the
# teach-back cards are one card per page, and every negative example FAILS with its expected
# message. A negative example that compiles is a broken guard, and this script says so loudly.
set -u
here="$(cd "$(dirname "$0")" && pwd)"
# Font directory: BRAND_FONTS (a brand pack's fonts/), else the legacy PIC_FONTS, else the PIC
# design skill's bundled Aptos when this tree sits beside it. Typst needs the files, not the name.
fonts="${BRAND_FONTS:-${PIC_FONTS:-$here/../../../pic-design/fonts}}"
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
fail=0
say() { printf '%-28s %s\n' "$1" "$2"; }

pages() { pdfinfo "$1" 2>/dev/null | awk '/^Pages:/{print $2}'; }

# ---- positive examples: name, expected page count ----
while read -r name want; do
  if typst compile --root "$here" --font-path "$fonts" "$here/examples/$name.typ" "$tmp/$name.pdf" >"$tmp/$name.log" 2>&1; then
    got="$(pages "$tmp/$name.pdf")"
    if [ "$got" = "$want" ]; then say "$name" "ok ($got page(s))"; else say "$name" "WRONG PAGE COUNT: $got, want $want"; fail=1; fi
  else
    say "$name" "COMPILE FAILED: $(grep -m1 -E 'error|panicked' "$tmp/$name.log")"; fail=1
  fi
done <<'EOF'
one-page-ask 1
executive-summary 1
teach-back-cards 2
briefing 1
EOF

# ---- negative examples: name, substring the panic MUST contain ----
while read -r name want; do
  if typst compile --root "$here" --font-path "$fonts" "$here/examples/$name.typ" "$tmp/$name.pdf" >"$tmp/$name.log" 2>&1; then
    say "$name" "GUARD BROKEN: compiled but must fail"; fail=1
  elif grep -q -- "$want" "$tmp/$name.log"; then
    say "$name" "fails as required"
  else
    say "$name" "FAILED FOR THE WRONG REASON: $(grep -m1 -E 'error|panicked' "$tmp/$name.log")"; fail=1
  fi
done <<'EOF'
guard-violation THREE NUMBERS cap: 4 given
guard-numeric-date must be a spelled-out date
guard-impossible-date must be a spelled-out date
guard-briefing-ask unexpected argument: ask
guard-synthetic-undeclared look synthetic
guard-card-overflow would clip
guard-placeholder-room named, specific audience
guard-figure-contradicts contradicts its EXACT line
guard-empty-rebuttal supported answer or retained limitation
guard-say-too-long 2–4 spoken sentences
guard-two-page ran to 2 pages
EOF

# ---- the debug switch must stamp, never silently pass ----
if typst compile --root "$here" --font-path "$fonts" --input allow-overflow=yes "$here/examples/one-page-ask.typ" "$tmp/stamp.pdf" >/dev/null 2>&1 \
   && pdftotext "$tmp/stamp.pdf" - 2>/dev/null | grep -q "DO NOT SHIP"; then
  say "allow-overflow stamp" "present"
else
  say "allow-overflow stamp" "MISSING — a debug compile could be mistaken for a deliverable"; fail=1
fi

# ---- the fonts must actually be embedded ----
# Without --font-path Typst falls back to Helvetica with only a WARNING, so a check that ignores
# fonts passes while the hero figures render in the wrong face. Assert the real thing shipped.
if command -v pdffonts >/dev/null 2>&1; then
  # Match the font NAME exactly after the subset prefix: a bare "Aptos" grep is satisfied by
  # "AptosDisplay", so a missing regular face would have passed.
  faces=$(pdffonts "$tmp/one-page-ask.pdf" 2>/dev/null | awk 'NR>2{sub(/^[A-Z]{6}\+/,"",$1); print $1}' | sort -u)
  missing=""
  for want in Aptos Aptos-Bold AptosDisplay-Bold; do
    printf '%s\n' "$faces" | grep -qx "$want" || missing="$missing $want"
  done
  if [ -z "$missing" ]; then say "fonts embedded" "$(printf '%s' "$faces" | tr '\n' ' ')"; else say "fonts embedded" "MISSING:$missing — compiled without --font-path?"; fail=1; fi
else
  # A check that cannot run is a FAILED check, not a passing one: a silent pass is worse than none.
  say "fonts embedded" "CANNOT VERIFY — pdffonts not installed; install poppler"; fail=1
fi

[ "$fail" = 0 ] && echo "ALL CHECKS PASS" || { echo "CHECKS FAILED"; exit 1; }
