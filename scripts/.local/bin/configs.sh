#!/usr/bin/env bash

EDITOR="kitty -e nvim"

CONFIGS=(
  "Hyprland         ~/.config/hypr/hyprland.conf"
  "Hyprland Configs ~/.config/hypr/configs/."
  "Niri             ~/.config/niri/."
  "Waybar           ~/.config/waybar/."
  "kitty            ~/.config/kitty/."
  "Matugen          ~/.config/matugen/."
  "Vim              ~/.config/vim/."
  "Walker           ~/.config/walker/."
  "Swaync           ~/.config/swaync/."
  "Rofi             ~/.config/rofi/."
  "Rofi Themes      ~/.local/share/rofi/."
  "Scripts          ~/.local/bin/."
  "Dotfiles         ~/dotfiles/."
)

CHOICE=$(printf '%s\n' "${CONFIGS[@]}" | walker -d -H)

# Se o usuário cancelar, sai do script
[ -z "$CHOICE" ] && exit 1

# 1. Pega apenas o caminho (último campo)
RAW_PATH=$(printf '%s\n' "${CHOICE}" | awk '{print $NF}')

# 2. Troca o ~ pelo caminho real da sua home
FINAL_PATH="${RAW_PATH/#\~/$HOME}"

$EDITOR "$FINAL_PATH"
