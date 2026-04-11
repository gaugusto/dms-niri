#!/bin/bash

# Aborta o script em caso de erro
set -e

PACKAGES=(
  adw-gtk-theme
  bat
  bluez-utils
  catppuccin-cursors-mocha
  clang
  cliphist
  eza
  fd
  firefox
  chromium
  fzf
  lazygit
  lua-argparse
  lua-jsregexp
  luarocks
  mpv
  nwg-look
  pavucontrol
  plymouth
  polkit-gnome
  ripgrep
  snapper
  sof-firmware
  stow
  system-config-printer
  tree
  ttf-jetbrains-mono-nerd
  walker-bin
  zram-generator
)

sudo pacman -Syy

for package in "${PACKAGES[@]}"; do
  yay -S --noconfirm --needed "$package"
done
