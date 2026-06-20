#!/usr/bin/env bash
# Double-click this file to launch the M4A → MP3 converter.
# It starts a small local web server and opens the converter in your browser.

cd "$(dirname "$0")" || exit 1

PORT=8000

# Open the converter page in the default browser once the server is up.
( sleep 1; open "http://localhost:$PORT/converter.html" ) &

echo "──────────────────────────────────────────────"
echo "  M4A → MP3 Converter is running."
echo ""
echo "  Your browser should open automatically."
echo "  If not, go to:  http://localhost:$PORT/converter.html"
echo ""
echo "  KEEP THIS WINDOW OPEN while converting."
echo "  When you're done: close this window (or press Ctrl+C)."
echo "──────────────────────────────────────────────"
echo ""

python3 -m http.server "$PORT"
