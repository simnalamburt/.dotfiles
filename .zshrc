# If not running interactively, don't do anything
[[ -o interactive ]] || return


#
# zplugin
#
autoload -U is-at-least
if is-at-least 4.3.9 && [[ -d ~/.zplugin ]]; then
  source '/Users/hyeon/.zplugin/bin/zplugin.zsh'
  autoload -Uz _zplugin
  (( ${+_comps} )) && _comps[zplugin]=_zplugin

  zplugin light simnalamburt/cgitc
  ZSH_EXPAND_ALL_DISABLE=word
  zplugin light simnalamburt/zsh-expand-all
  zplugin light zsh-users/zsh-completions
  ZSH_AUTOSUGGEST_USE_ASYNC=true
  zplugin light zsh-users/zsh-autosuggestions
  zplugin light zdharma/fast-syntax-highlighting
  zplugin light zsh-users/zsh-history-substring-search
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  zplugin ice pick"async.zsh" src"pure.zsh"
  zplugin light sindresorhus/pure
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
export DOCKER_BUILDKIT=1
export AWS_SDK_LOAD_CONFIG=true
if [[ -f ~/.fzf.zsh ]]; then source ~/.fzf.zsh; fi
if [[ "$TMUX" = "" ]]; then export TERM="xterm-256color"; fi

# Vim & Neovim
#
# EDITOR이나 VISUAL 환경변수 안에 'vi' 라는 글자가 들어있으면 자동으로
# emacs-like 키바인딩들이 해제되어서, ^A ^E 등을 모조리 쓸 수 없어진다.
# 무슨짓이냐...
#
# References:
#   https://stackoverflow.com/a/43087047
#   https://github.com/zsh-users/zsh/blob/96a79938010073d14bd9db31924f7646968d2f4a/Src/Zle/zle_keymap.c#L1437-L1439
if (( $+commands[vim] )); then
  export EDITOR=vim
  bindkey '^A' beginning-of-line
  bindkey '^E' end-of-line
elif (( $+commands[nvim] )); then
  export EDITOR=nvim
  bindkey '^A' beginning-of-line
  bindkey '^E' end-of-line
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
