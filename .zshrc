source ~/.dotfiles/zgen.zsh
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh
  zgen oh-my-zsh plugins/cp
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/mosh
  zgen oh-my-zsh plugins/command-not-found
  zgen load zsh-users/zsh-completions src
  zgen load zsh-users/zsh-syntax-highlighting
  zgen oh-my-zsh themes/agnoster
  zgen save
fi


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

if hash tmux 2>/dev/null; then
  alias irc='tmux attach -t irc'
fi

alias mv='mv -i'
alias cp='cp -i'
