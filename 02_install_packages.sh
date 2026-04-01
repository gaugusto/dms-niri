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
cliphist
cups
dms-shell-bin
efibootmgr
eza
firefox
fzf
greetd-dms-greeter-git
intel-ucode
lazygit
limine
linux-zen
mpv
nwg-look
pavucontrol
plymouth
polkit-gnome
snapper
sof-firmware
stow
system-config-printer
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
