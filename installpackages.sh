#!/bin/bash

sudo pacman -S --needed tmux alacritty
sudo pacman -S --needed git base-devel

cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
rm -rf yay

yay -Y --gendb
yay -Syu --devel

yay -S google-chrome input-remapper-git
