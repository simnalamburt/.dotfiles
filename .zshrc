# If not running interactively, don't do anything
[[ -o interactive ]] || return

#
# zplug
#
autoload -U is-at-least
if is-at-least 4.3.9 && [ -f ~/.zplug/init.zsh ]; then
  source ~/.zplug/init.zsh
  zplug zsh-users/zsh-completions
  zplug zsh-users/zsh-syntax-highlighting
  zplug simnalamburt/cgitc
  zplug simnalamburt/shellder, as:theme
  zplug load
else
  PS1='%n@%m:%~%# '
fi


#
# zsh-sensible
#
stty stop undef

alias l='ls -lah'
alias mv='mv -i'
alias cp='cp -i'

setopt auto_cd histignorealldups sharehistory
zstyle ':completion:*' menu select

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history


#
# lscolors
#
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
export TIME_STYLE="+%y%m%d"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

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


#
# zsh-substring-completion
#
setopt complete_in_word
setopt always_to_end
WORDCHARS=''
zmodload -i zsh/complist

# Substring completion
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


#
# fzy.zsh
#
if hash fzy 2>/dev/null; then
  function fzy-history-widget() {
    echo
    setopt localoptions pipefail
    BUFFER=$(fc -l 1 | perl -pe 's/^\s*\d+\s+/  /' | tac | awk '!a[$0]++' | fzy -l25 --query=$LBUFFER | cut -c3-)
    CURSOR=$#BUFFER
    local ret=$?
    zle reset-prompt
    return $ret
  }
  zle     -N    fzy-history-widget
  bindkey '^R'  fzy-history-widget
fi


#
# zshrc
#
if [ -f ~/.fzf.zsh ]; then source ~/.fzf.zsh; fi
if [ "$TMUX" = "" ]; then; export TERM="xterm-256color"; fi
if [ -d ~/.local/bin ]; then; export PATH="$HOME/.local/bin:$PATH"; fi
export DEFAULT_USER="$USER" # TODO: https://github.com/simnalamburt/shellder/issues/10

# Aliases
if hash tmux 2>/dev/null; then; alias irc='tmux attach -t irc'; fi

# Ruby
if hash ruby 2>/dev/null && hash gem 2>/dev/null; then
  export GEM_HOME=$(ruby -e 'print Gem.user_dir')
  export PATH="$PATH:$GEM_HOME/bin"
fi

# cargo install
if [ -d ~/.cargo/bin ]; then
  export PATH="$PATH:$HOME/.cargo/bin"
fi
# yarn global
if hash yarn 2>/dev/null; then
  export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"
fi


#
# Load local configs
#
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
