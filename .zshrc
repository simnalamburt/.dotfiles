source ~/.zgen/zgen/zgen.zsh
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh
  zgen oh-my-zsh plugins/cp
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/mosh
  zgen oh-my-zsh plugins/command-not-found
  zgen load zsh-users/zsh-completions src
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load simnalamburt/shellder shellder
  zgen save
fi


#
# Basic configs
#
stty stop undef

export DEFAULT_USER="$USER"
export RUST_BACKTRACE=1

alias mv='mv -i'
alias cp='cp -i'
alias ocaml='ledit ocaml'
alias racket='ledit racket'

if [ -f ~/.fzf.zsh ]; then; source ~/.fzf.zsh; fi
if [ "$TMUX" = "" ]; then; export TERM="xterm-256color"; fi
if [ -d /usr/local/opt/go/libexec/bin ]; then; export PATH=$PATH:/usr/local/opt/go/libexec/bin; fi

if hash tmux 2>/dev/null; then; alias irc='tmux attach -t irc'; fi
if hash ag 2>/dev/null; then; if ! hash pt 2>/dev/null; then; alias pt='ag'; fi; fi

# Arch Linux specific
if [ $(hostname) = "rilakkuma" ]; then
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
fi
