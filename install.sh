#!/bin/bash

packages=(
  btop
  yazi
  hyprland
  mangowm
  firefox
  nvim
  kitty
  waybar
  rofi
)

for package in ${packages[@]}; do
  sudo pacman -S --noconfirm ${package}
done
