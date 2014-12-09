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

cmd() { if eval "hash $2" 2>/dev/null; then; alias $1=$2; fi }
cmd ml 'ledit ocaml'
cmd py python3
cmd vi nvim
cmd vim nvim

path() { if [[ -d "$1" ]]; then; export PATH="$1:$PATH"; fi }
path "/usr/local/bin"
path "$HOME/.tmux-do/bin"
path "$HOME/.rvm/bin"

src() { if [[ -s "$1" ]]; then; source "$1"; fi }
src "$HOME/.rvm/scripts/rvm"

unset -f cmd path src
