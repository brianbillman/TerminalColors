#!/usr/bin/env bash

FILE="/Users/$USER/scripts/TerminalColors/.fav-terminal-background-colors"
COLORS=$(/Users/$USER/scripts/TerminalColors/get-current-terminal-color.sh)

# append new color to file
echo "$COLORS" >> "$FILE"

# sort & remove duplicates in file
sort -u -o "$FILE" "$FILE"
chmod 664 "$FILE"

echo "Added colors $COLORS to favorites"
