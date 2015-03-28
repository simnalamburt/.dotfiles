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

if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

if [ $(hostname) = "hyeonmac.local" ]; then
  alias ml='ledit ocaml'                # ocaml
  eval `/usr/libexec/path_helper -s`    # brew, mactex
fi

if [ $(hostname) = "rilakkuma" ]; then
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
fi

if [ $(hostname) = "hyeonme" ]; then
  export PATH="$PATH:$HOME/.tmux-do/bin"
fi
