#!/bin/bash

# Aborta o script em caso de erro
set -e

PACKAGES=(
  adw-gtk-theme
  bat
  eza
  fzf
  lazygit
  lua-argparse
  lua-jsregexp
  luarocks
  mpv
  nwg-look
  polkit-gnome
  ripgrep
  tree
  ttf-jetbrains-mono-nerd
  brave-origin-bin
)

sudo pacman -Syy

for package in "${PACKAGES[@]}"; do
  yay -S --noconfirm --needed "$package"
done
