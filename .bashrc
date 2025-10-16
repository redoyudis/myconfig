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

# -----------------------------
# fzf + ripgrep + fd integration
# -----------------------------

# Use ripgrep to list files by default (fast and respects .gitignore)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Prefer fd if available (even faster)
if command -v fd >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# Nice preview window with bat (fallback to head)
if command -v bat >/dev/null 2>&1; then
  export FZF_DEFAULT_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}' \
                           --bind 'ctrl-/:toggle-preview' --height 40%"
else
  export FZF_DEFAULT_OPTS="--preview 'head -n 100 {}' \
                           --bind 'ctrl-/:toggle-preview' --height 40%"
fi

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# Optional: fuzzy search inside files (ripgrep + fzf + nvim)
fif() {
  if [ $# -eq 0 ]; then
    echo "Usage: fif <search term>"
    return 1
  fi
  rg --color=always --line-number --no-heading "$1" |
    fzf --ansi --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' |
    awk -F: '{print "+"$2" "$1}' |
    xargs -r nvim
}

# -----------------------------
# Other tools and startup stuff
# -----------------------------

source /usr/share/nvm/init-nvm.sh

if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
  exec tmux new-session -A -s ${USER} >/dev/null 2>&1
fi

neofetch

set -o vi
