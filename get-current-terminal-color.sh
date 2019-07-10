#!/usr/bin/env bash

BG_COLOR=$(osascript -e "tell application \"Terminal\" to get background color of window 1")
NORMAL_TEXT_COLOR=$(osascript -e "tell application \"Terminal\" to get normal text color of window 1")
BOLD_TEXT_COLOR=$(osascript -e "tell application \"Terminal\" to get bold text color of window 1")

echo "{$BG_COLOR}:{$NORMAL_TEXT_COLOR}:{$BOLD_TEXT_COLOR}"
