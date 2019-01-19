# If not running interactively, don't do anything
[[ -o interactive ]] || return

#
# zplug
#
autoload -U is-at-least
if is-at-least 4.3.9 && [[ -f ~/.zplug/init.zsh ]]; then
  source ~/.zplug/init.zsh

  zplug "simnalamburt/cgitc"
  ZSH_EXPAND_ALL_DISABLE=word
  zplug "simnalamburt/zsh-expand-all"
  zplug "zsh-users/zsh-completions"
  ZSH_AUTOSUGGEST_USE_ASYNC=true
  zplug "zsh-users/zsh-autosuggestions"
  zplug "zsh-users/zsh-syntax-highlighting"
  zplug "zsh-users/zsh-history-substring-search"
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  zplug "mafredri/zsh-async"
  zplug "sindresorhus/pure", use:pure.zsh, as:theme

  zplug load
else
  PS1='%n@%m:%~%(!.#.$) '
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

HISTSIZE=90000
SAVEHIST=90000
HISTFILE=~/.zsh_history


#
# lscolors
#
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedxbagxcad"
export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=30;46:tw=0;42:ow=30;43"
export TIME_STYLE="+%y%m%d"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


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
# zshrc
#
export AWS_SDK_LOAD_CONFIG=true
if [[ -f ~/.fzf.zsh ]]; then source ~/.fzf.zsh; fi
if [[ "$TMUX" = "" ]]; then export TERM="xterm-256color"; fi

# Vim & Neovim
if (( $+commands[vim] )); then
  export EDITOR=vim
elif (( $+commands[nvim] )); then
  export EDITOR=nvim
fi

# exa
if (( $+commands[exa] )); then
  alias l='exa -alh --group-directories-first'
  alias ll='exa -lh --group-directories-first'
fi

# tag
if (( $+commands[tag] )) && (( $+commands[rg] )); then
  export TAG_SEARCH_PROG=rg
  tag() {
    command tag "$@"; source "${TAG_ALIAS_FILE:-/tmp/tag_aliases}" 2>/dev/null
  }
fi


#
# Load local configs
#
if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi
