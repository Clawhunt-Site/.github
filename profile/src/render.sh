#!/usr/bin/env bash
# Render the organization-profile artwork from banner.html to PNG (2x, transparent corners).
# usage: render.sh <out dir>          (run from the folder that holds banner.html, fonts/ and img/)
set -euo pipefail
OUT="${1:?out dir}"
CHROME="${CHROME:-$LOCALAPPDATA/ms-playwright/chromium_headless_shell-1247/chrome-headless-shell-win64/chrome-headless-shell.exe}"
HERE="$(cd "$(dirname "$0")" && pwd -W 2>/dev/null || pwd)"
mkdir -p "$OUT"
OUTW="$(cd "$OUT" && pwd -W 2>/dev/null || pwd)"

shot() { # view theme height
  local view="$1" theme="$2" h="$3"
  "$CHROME" --headless --disable-gpu --hide-scrollbars --no-sandbox \
    --force-device-scale-factor=2 --default-background-color=00000000 \
    --window-size="880,$h" --virtual-time-budget=4000 \
    --screenshot="$OUTW/$view-$theme.png" \
    "file:///$HERE/banner.html?view=$view&theme=$theme" >/dev/null 2>&1
  echo "$view-$theme.png $(wc -c < "$OUT/$view-$theme.png")B"
}

shot hero light 400
shot hero dark 400
shot order light 348
shot order dark 348
