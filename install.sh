#!/bin/bash

# Get packages

cd

echo "Getting packages"
sleep 1

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
  awww
  # FONTS
  ttf-googlesanscode-nerd
)

for package in ${packages_pacman[@]}; do
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

# config_directories=(
#   mango
#   hypr
#   kitty
#   rofi
#   kanata
#   wal
# )
#
# for directories in "${config_directories[@]}"; do
#   mkdir -p ~/.config/"${directories}"
# done

# Copy Config Files

cdir="$HOME/Ricing/dotfiles"

for dir_c in "$cdir"/*/; do
  [ -d "$dir_c" ] || continue
  cp -a "$dir_c" "$HOME/.config/"
done
