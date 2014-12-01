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
export rvmsudo_secure_path=0

alias ml='ledit ocaml'
alias py=python3

path() { [[ -d "$1" ]] && export PATH="$1:$PATH" }
path "/usr/local/bin"             # OS X
path "$HOME/.tmux-do/bin"         # tmux-do
path "$HOME/.rvm/bin"             # rvm

src()  { [[ -s "$1" ]] && source "$1" }
src  "$HOME/.rvm/scripts/rvm"
