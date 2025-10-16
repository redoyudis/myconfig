#!/bin/bash

sudo pacman -S --needed git base-devel
sudo pacman -S --needed tmux alacritty ripgrep fzf fd

cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
rm -rf yay

yay -Y --gendb
yay -Syu --devel

yay -S google-chrome input-remapper-git
