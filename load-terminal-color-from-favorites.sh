#!/usr/bin/env bash

FILE="/Users/$USER/scripts/TerminalColors/.fav-terminal-background-colors"

COLORS=$(sort -R "$FILE" | head -1)

BG_COLOR=$(echo "$COLORS" | cut -d ':' -f 1)
NORMAL_TEXT_COLOR=$(echo "$COLORS" | cut -d ':' -f 2)
BOLD_TEXT_COLOR=$(echo "$COLORS" | cut -d ':' -f 3)

# set background color
osascript -e "tell application \"Terminal\" to set background color of window 1 to $BG_COLOR"

# set normal text color
osascript -e "tell application \"Terminal\" to set normal text color of window 1 to $NORMAL_TEXT_COLOR"

# set bold text color
osascript -e "tell application \"Terminal\" to set bold text color of window 1 to $BOLD_TEXT_COLOR"

echo "Switched colors to $COLORS"
