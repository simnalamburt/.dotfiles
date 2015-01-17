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

cmd() { if eval "hash $2" 2>/dev/null; then; alias $1=$2; fi }
cmd ml 'ledit ocaml'
cmd py python3
cmd vi nvim
cmd vim nvim
if hash nvim 2>/dev/null; then; export GIT_EDITOR=nvim; fi

path() { if [[ -d "$1" ]]; then; export PATH="$1:$PATH"; fi }
path "/usr/local/bin"
path "$HOME/.tmux-do/bin"
path "$HOME/.linuxbrew/bin"

export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

unset -f cmd path
