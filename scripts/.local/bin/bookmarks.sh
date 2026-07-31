#!/usr/bin/env bash

exec > /dev/null 2>&1 

BROWSER="brave-origin"
BOOKMARKS="$HOME/.local/share/bookmarks"

SEL="$(awk '{print $1}' "$BOOKMARKS" | rofi -i -dmenu -format d -p "Bookmarks:")"
[ -n "$SEL" ] && setsid -f "$BROWSER" "$(sed -n "$SEL"p "$BOOKMARKS" | awk '{print $NF}')"

