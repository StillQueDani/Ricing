#!/bin/bash

# Get packages

cd

echo "Getting packages"
sleep 3

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
  fastfetch
  python
)

for package in ${packages_pacmano[@]}; do
  sudo pacman -S --noconfirm ${package}
done

sudo pacman -S --needed --noconfirm

# Get yay

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

packages_yay=(
  python-pywal16
)

for package in ${packages_yay[@]}; do
  yay -S --noconfirm ${package}
done
# Create Directories

# Copy Config Files
