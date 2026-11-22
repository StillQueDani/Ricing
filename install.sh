#!/bin/bash

# Get packages

packages_pacman=(
  btop
  yazi
  hyprland
  mangowm
  firefox
  nvim
  kitty
  waybar
  rofi
  base-devel
)

for package in ${packages_pacman[@]}; do
  sudo pacman -S --noconfirm ${package}
done

sudo pacman -S --needed --noconfirm

# Get yay

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Create Directories

# Copy Config Files
