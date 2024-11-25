#!/bin/bash

rm -rf ~/.bashrc ~/.config/alacritty ~/.config/nvim ~/.tmux ~/.tmux.conf

ln -s ~/myconfig/.bashrc ~/.bashrc
ln -s ~/myconfig/alacritty ~/.config/alacritty
ln -s ~/myconfig/nvim ~/.config/nvim
ln -s ~/myconfig/.tmux ~/.tmux
ln -s ~/myconfig/.tmux.conf ~/.tmux.conf
