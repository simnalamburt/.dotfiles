#
# zplug
#
source ~/.zplug/zplug

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", use:zsh-syntax-highlighting.zsh
zplug "simnalamburt/cgitc"
zplug "simnalamburt/shellder"

zplug load


# zsh-sensible
stty stop undef
alias mv='mv -i'
alias cp='cp -i'
if hash ledit 2>/dev/null; then
  alias ocaml='ledit ocaml'
  alias racket='ledit racket'
fi


# zshrc
export RUST_BACKTRACE=1
if [ -f ~/.fzf.zsh ]; then; source ~/.fzf.zsh; fi
if [ "$TMUX" = "" ]; then; export TERM="xterm-256color"; fi
export DEFAULT_USER="$USER" # TODO: https://github.com/simnalamburt/shellder/issues/10

# Aliases
if hash nvim 2>/dev/null; then; alias vim='nvim'; fi # neovim
if hash tmux 2>/dev/null; then; alias irc='tmux attach -t irc'; fi

# Ruby
if hash ruby 2>/dev/null && hash gem 2>/dev/null; then
  export GEM_HOME=$(ruby -e 'print Gem.user_dir')
  export PATH="$PATH:$GEM_HOME/bin"
fi

# Golang
if hash go 2>/dev/null; then
  export GOPATH=~/.go
  mkdir -p $GOPATH
  export PATH="$PATH:$GOPATH/bin"
fi
