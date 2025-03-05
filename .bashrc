#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1="\[\033[1;32m\]\w:\[\033[0m\]\$ "
#PS1="\e[1;32m\w:\e[m\$ "

export EDITOR=nvim

bind 'set enable-bracketed-paste off'
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
source /usr/share/nvm/init-nvm.sh
