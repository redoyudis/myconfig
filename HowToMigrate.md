# My Dev Tool Configuration File

run install packages.sh
run createlink.sh on $HOME

## tmux
M-a I to install package

## font
download JetBrainsMonoNerd
```sh
mkdir -p ~/.local/share/fonts/JetBrainsMonoNerd
cd ~/.local/share/fonts/JetBrainsMonoNerd
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -fv
```


## dbeaver:
1. install dbeaver
2. install vimium
3. change SQL Editor > Script > Script Pattern
4. Key > delete line > remove this shortcut
5. change keys "Next editor" -> "alt+shift+k"
6. change keys "Prev editor" -> "alt+shift+j"
