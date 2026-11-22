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
  zsh
  starship
  # FONTS
  ttf-googlesanscode-nerd
)

for package in "${packages_pacman[@]}"; do
  sudo pacman -S --noconfirm "${package}"
done

sudo pacman -S --needed --noconfirm

# Get yay

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

packages_yay=(
  python-pywal16
)

for package in "${packages_yay[@]}"; do
  yay -S --noconfirm "${package}"
done

# Copy Config Files

cdir="$HOME/Ricing/dotfiles"

for dir_c in "$cdir"/*/; do
  [ -d "$dir_c" ] || continue
  cp -a "$dir_c" "$HOME/.config/"
done

# Copy Wallpapers

mkdir -p ~/Pictures
cp -r ~/Ricing/Wallpapers ~/Pictures/

# wal 1st setup
wal -i ~/Pictures/Wallpapers/NVDAS.png --cols16 dual

# Shell setup

cp ~/Ricing/.zshrc ~
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp ~/Ricing/starship.toml ~/.config
