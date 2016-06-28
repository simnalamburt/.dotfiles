#
# zplug
#
source ~/.zplug/zplug
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", use:zsh-syntax-highlighting.zsh
zplug "simnalamburt/cgitc"
zplug "simnalamburt/shellder"
zplug load


#
# zsh-sensible
#
stty stop undef
alias l='ls -lah'
alias mv='mv -i'
alias cp='cp -i'
if hash ledit 2>/dev/null; then
  alias ocaml='ledit ocaml'
  alias racket='ledit racket'
fi
# TODO: 중간에 있는 글자+<tab>으로 자동완성이 안됨


#
# dircolor
#
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]
then
  # Find the option for using colors in ls, depending on the version: Linux or BSD
  if [[ "$(uname -s)" == "NetBSD" ]]; then
    # On NetBSD, test if "gls" (GNU ls) is installed (this one supports colors);
    # otherwise, leave ls as is, because NetBSD's ls doesn't support -G
    gls --color -d . &>/dev/null 2>&1 && alias ls='gls --color=tty'
  elif [[ "$(uname -s)" == "OpenBSD" ]]; then
    # On OpenBSD, "gls" (ls from GNU coreutils) and "colorls" (ls from base,
    # with color and multibyte support) are available from ports.  "colorls"
    # will be installed on purpose and can't be pulled in by installing
    # coreutils, so prefer it to "gls".
    gls --color -d . &>/dev/null 2>&1 && alias ls='gls --color=tty'
    colorls -G -d . &>/dev/null 2>&1 && alias ls='colorls -G'
  else
    ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
  fi
fi


#
# zshrc
#
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

# Rust
if hash rustc 2>/dev/null; then
  export RUST_BACKTRACE=1
fi
if hash cargo 2>/dev/null; then
  export PATH="$PATH:$HOME/.cargo/bin"
fi
