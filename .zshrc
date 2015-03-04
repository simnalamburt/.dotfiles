#
# oh-my-zsh
#
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
CASE_SENSITIVE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh


#
# Basic configs
#
export TERM=xterm-256color
export DEFAULT_USER="$USER"
export RUST_BACKTRACE=1

# fzf
if [ -f ~/.fzf.zsh ]; then; source ~/.fzf.zsh; fi

# etc
cmd() { if eval "hash $2" 2>/dev/null; then; alias $1=$2; fi }
path() { if [ -d "$1" ]; then; export PATH="$1:$PATH"; fi }

if [ $(hostname) = "hyeonmac.local" ]; then
  path "/usr/local/bin"               # brew
  cmd ml 'ledit ocaml'                # ocaml
  eval `/usr/libexec/path_helper -s`  # mactex
fi

if [ $(hostname) = "hyeonme" ]; then
  path "$HOME/.tmux-do/bin"
fi

unset -f cmd path
