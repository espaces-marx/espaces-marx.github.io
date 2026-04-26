#!/usr/bin/env bash
set -euo pipefail

DEST="$(dirname "$0")/../tools/lia-restoration.html"
URL="https://raw.githubusercontent.com/espaces-marx/lia-restoration/refs/heads/main/lia-restoration.html"
HEADER="<!-- Auto-synced from https://github.com/espaces-marx/lia-restoration — do not edit directly in espaces-marx.github.io -->"

tmp=$(mktemp)
curl -fsSL "$URL" -o "$tmp"

{ echo "$HEADER"; cat "$tmp"; } > "$DEST"
rm "$tmp"

echo "Synced lia-restoration.html from upstream."
