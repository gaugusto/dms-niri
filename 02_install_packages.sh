#!/bin/bash

# Aborta o script em caso de erro
set -e

PACKAGES=(
  adw-gtk-theme
  base
  bat
  bluez-utils
  bob
  catppuccin-cursors-mocha
  clang
  cliphist
  cups
  dms-shell-bin
  efibootmgr
  eza
  fd
  firefox
  fzf
  greetd-dms-greeter-git
  intel-ucode
  lazygit
  libva-utils
  limine
  linux-zen
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
  walker
  yay
  yay-debug
  zram-generator
)

sudo pacman -Syy

for package in "${PACKAGES[@]}"; do
  yay -S --noconfirm --needed "$package"
done
