#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

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
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow  --exclude .git'
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

is_git() {
  git rev-parse --is-inside-work-tree &>/dev/null
}

git_branch() {
  is_git || return 1

  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return 1

  printf "%s" "$branch"
}

print_open_bracket_if_git() {
  is_git && printf "["
}

print_close_bracket_if_git() {
  is_git && printf "]"
}

# --- Colors ---
YELLOW="\[\e[33m\]"
LIGHT_BLUE="\[\e[94m\]"
RED="\[\e[31m\]"
RESET="\[\e[0m\]"

# --- PS1 ---
PS1="${YELLOW}❯ ${LIGHT_BLUE}\W ${LIGHT_BLUE}\$(print_open_bracket_if_git)${RED}\$(git_branch)${LIGHT_BLUE}\$(print_close_bracket_if_git)${LIGHT_BLUE}: ${RESET}"
