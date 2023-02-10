#!/usr/bin/env bash

# Dependencies : scrot, zbar

# Cache Dir
mkdir -p $HOME/.cache/qrcode

TEMP_DIR="$HOME/.cache/qrcode"

# Take Screenshot
scrot -s -o -F $TEMP_DIR/image.png

# Check for Qr-Code
result=$(zbarimg --raw $TEMP_DIR/image.png 2>/dev/null)

if [ $result ]; then
  echo $result | xclip -selection clipboard
  notify-send "👍 copied content to clipboard"
else
  notify-send "😥 no qr code detected"
fi
