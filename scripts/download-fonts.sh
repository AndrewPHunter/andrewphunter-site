#!/usr/bin/env bash
# Download self-hosted WOFF2 font files from google-webfonts-helper (gwfh.mranftl.com).
# Run this script once before first deployment. Fonts must be present at static/fonts/
# for the site to load correctly — no external font CDN is used.
#
# Usage: bash scripts/download-fonts.sh
# Requires: curl

set -euo pipefail

DEST="static/fonts"
mkdir -p "$DEST"

echo "Downloading Playfair Display..."

curl -fsSL "https://gwfh.mranftl.com/api/fonts/playfair-display?download=zip&subsets=latin&variants=regular,italic,500,500italic,700,700italic&formats=woff2" \
  -o /tmp/playfair.zip
unzip -o /tmp/playfair.zip -d /tmp/playfair/

# Rename files to match expected paths
cp /tmp/playfair/playfair-display-v40-latin-regular.woff2         "$DEST/playfair-display-400.woff2"
cp /tmp/playfair/playfair-display-v40-latin-italic.woff2          "$DEST/playfair-display-400-italic.woff2"
cp /tmp/playfair/playfair-display-v40-latin-500.woff2             "$DEST/playfair-display-500.woff2"
cp /tmp/playfair/playfair-display-v40-latin-500italic.woff2       "$DEST/playfair-display-500-italic.woff2"
cp /tmp/playfair/playfair-display-v40-latin-700.woff2             "$DEST/playfair-display-700.woff2"
cp /tmp/playfair/playfair-display-v40-latin-700italic.woff2       "$DEST/playfair-display-700-italic.woff2"

echo "Downloading EB Garamond..."

curl -fsSL "https://gwfh.mranftl.com/api/fonts/eb-garamond?download=zip&subsets=latin&variants=regular,italic,500,500italic&formats=woff2" \
  -o /tmp/garamond.zip
unzip -o /tmp/garamond.zip -d /tmp/garamond/

cp /tmp/garamond/eb-garamond-v32-latin-regular.woff2      "$DEST/eb-garamond-400.woff2"
cp /tmp/garamond/eb-garamond-v32-latin-italic.woff2       "$DEST/eb-garamond-400-italic.woff2"
cp /tmp/garamond/eb-garamond-v32-latin-500.woff2          "$DEST/eb-garamond-500.woff2"
cp /tmp/garamond/eb-garamond-v32-latin-500italic.woff2    "$DEST/eb-garamond-500-italic.woff2"

echo "Downloading IBM Plex Mono..."

curl -fsSL "https://gwfh.mranftl.com/api/fonts/ibm-plex-mono?download=zip&subsets=latin&variants=300,regular,500&formats=woff2" \
  -o /tmp/plex.zip
unzip -o /tmp/plex.zip -d /tmp/plex/

cp /tmp/plex/ibm-plex-mono-v20-latin-300.woff2      "$DEST/ibm-plex-mono-300.woff2"
cp /tmp/plex/ibm-plex-mono-v20-latin-regular.woff2  "$DEST/ibm-plex-mono-400.woff2"
cp /tmp/plex/ibm-plex-mono-v20-latin-500.woff2      "$DEST/ibm-plex-mono-500.woff2"

rm -rf /tmp/playfair* /tmp/garamond* /tmp/plex*

echo ""
echo "Fonts downloaded to $DEST/"
echo "NOTE: The file version numbers in the zip (e.g. v36, v26, v19) may change as Google"
echo "updates fonts. If the cp commands above fail, inspect the unzipped contents of /tmp/"
echo "and update the filenames in this script accordingly."
