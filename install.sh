#!/usr/bin/env bash

set -e

INSTALL_DIR="/etc/x-ui/sub"
INSTALL_FILE="$INSTALL_DIR/sub.html"
SOURCE_URL="https://raw.githubusercontent.com/ramin-mahmoodi/3x-hub/main/sub.html"

echo "Installing / Updating 3x-hub..."

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root."
  echo "Example:"
  echo "sudo bash install.sh"
  exit 1
fi

mkdir -p "$INSTALL_DIR"

if [ -f "$INSTALL_FILE" ]; then
  echo "Removing old sub.html..."
  rm -f "$INSTALL_FILE"
fi

echo "Downloading latest 3x-hub..."
curl -fsSL "$SOURCE_URL" -o "$INSTALL_FILE"

chmod 644 "$INSTALL_FILE"

echo ""
echo "============================================================"
echo "  3x-hub installed/updated successfully!"
echo "  Template file: $INSTALL_FILE"
echo "============================================================"
echo ""
echo "CRITICAL STEP FOR 3x-ui (v3.3.0+ / v3.11+):"
echo "1. Open your 3x-ui panel in browser."
echo "2. Go to: Settings -> Subscription -> Information"
echo "3. In 'Sub Theme Directory' (subThemeDir), enter:"
echo "   $INSTALL_DIR"
echo "4. Save settings and restart panel (x-ui restart)."
echo "============================================================"
