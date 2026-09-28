#!/bin/bash

# Directory to save screenshots
SAVE_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SAVE_DIR"

# Timestamp format for file names
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
FILE_PATH="$SAVE_DIR/screenshot_$TIMESTAMP.png"

# Take screenshot of a selected region or clicked window using scrot
# -s turns on interactive selection mode
scrot -s "$FILE_PATH"

# If the file was successfully created, copy it to clipboard and send notification
if [ -f "$FILE_PATH" ]; then
    xclip -selection clipboard -t image/png -i "$FILE_PATH"
    notify-send "Screenshot Captured" "Saved to $FILE_PATH and copied to clipboard." -i camera-photo
fi

