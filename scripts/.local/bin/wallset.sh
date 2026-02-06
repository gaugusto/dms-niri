#!/usr/bin/env bashu

WALL_DIR="$HOME/.config/backgrounds"

CWD="$(pwd)"

cd "$WALL_DIR" || exit

# Handle spaces in filenames
IFS=$'\n'

SELECTED_WALL=$(for a in *.jpg *.png *.webp; do echo -en "$a\0icon\x1f$a\n"; done | walker -d -H)

if [ -n "$SELECTED_WALL" ]; then
  ${HOME}/.local/bin/wallset-backend.sh "$SELECTED_WALL"
fi

cd "$CWD" || exit
