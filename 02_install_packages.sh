#!/bin/bash

# Aborta o script em caso de erro
set -e

PACKAGES=(
  adw-gtk-theme
  amd-ucode
  archlinux-wallpaper
  base
  bat
  bluez-utils
  cantarell-fonts
  chromium
  cups
  dms-shell-bin
  edk2-shell
  efibootmgr
  eza
  flatpak
  fzf
  gamemode
  gamescope
  helvum
  lazygit
  linux-zen
  networkmanager
  nim
  nvidia-open-dkms
  nwg-look
  pass
  pavucontrol
  plymouth
  polkit-gnome
  rofi
  sbctl
  steam
  stow
  swayidle
  system-config-printer
  timeshift
  ttf-jetbrains-mono-nerd
  wget
  yay
  yay-debug
  zram-generator
)

sudo pacman -Syy

for package in "${PACKAGES[@]}"; do
  yay -S --noconfirm --needed "$package"
done
