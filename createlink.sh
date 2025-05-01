#!/bin/bash

rm -rf ~/.bashrc ~/.config/nvim ~/.tmux ~/.tmux.conf

ln -s ~/myconfig/.bashrc ~/.bashrc
ln -s ~/myconfig/alacritty.toml ~/.config/alacritty
ln -s ~/myconfig/nvim ~/.config/nvim
ln -s ~/myconfig/.tmux ~/.tmux
ln -s ~/myconfig/.tmux.conf ~/.tmux.conf
ln -s ~/myconfig/neofetch/config.conf ~/.config/neofetch/config.conf

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
