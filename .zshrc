# If not running interactively, don't do anything
[[ -o interactive ]] || return


#
# zplugin
#
autoload -U is-at-least
if is-at-least 4.3.9 && [[ -d ~/.zplugin ]]; then

  source ~/.zplugin/bin/zplugin.zsh
  autoload -Uz _zplugin
  (( ${+_comps} )) && _comps[zplugin]=_zplugin

  # kube-ps1
  zplugin light jonmosco/kube-ps1
  KUBE_PS1_SYMBOL_ENABLE='false'
  KUBE_PS1_PREFIX=''
  KUBE_PS1_SUFFIX=''
  KUBE_PS1_DIVIDER=' '
  KUBE_PS1_CTX_COLOR=238
  KUBE_PS1_NS_COLOR=242

  # theme
  zplugin ice pick"async.zsh" src"pure.zsh"
  zplugin light sindresorhus/pure
  zstyle :prompt:pure:prompt:success color 242
  zstyle :prompt:pure:prompt:error color 226
  zstyle :prompt:pure:path color 033
  # Visualize the running background jobs
  PROMPT='%F{226}%(1j.%j .)'$PROMPT
  # VIsualize the non-zero exit code of previous tasks
  precmd_pipestatus() {
    local STAT=${(j.|.)pipestatus}
    if [[ "$STAT" = 0 ]]; then
      RPROMPT='$(kube_ps1) %F{238}%*'
    else
      RPROMPT='%F{242}'"$STAT"' $(kube_ps1) %F{238}%*'
    fi
  }
  add-zsh-hook precmd precmd_pipestatus

  # expand aliases
  ZSH_EXPAND_ALL_DISABLE=word
  zplugin light simnalamburt/zsh-expand-all

  # autosuggestions
  ZSH_AUTOSUGGEST_USE_ASYNC=1
  if is-at-least 5.3; then
    zplugin ice silent wait'1' atload'_zsh_autosuggest_start'
  fi
  zplugin light zsh-users/zsh-autosuggestions

  # Easily access the directories you visit most often.
  #
  # Usage:
  #   $ z work
  #   $ <CTRL-G>work
  zplugin light agkozak/zsh-z
  zplugin light andrewferrier/fzf-z
  export FZFZ_SUBDIR_LIMIT=0

  # etc
  zplugin light simnalamburt/cgitc
  zplugin light zdharma/fast-syntax-highlighting
  zplugin light zsh-users/zsh-history-substring-search
  zplugin light zsh-users/zsh-completions

  autoload -Uz compinit
  compinit
  zplugin cdreplay

  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
else
  # Default terminal
  case "$TERM" in
    xterm-color|*-256color)
      PS1=$'\e[1;32m%n@%m\e[0m:\e[1;34m%~\e[0m%(!.#.$) ';;
    *)
      PS1='%n@%m:%~%(!.#.$) ';;
  esac

  autoload -Uz compinit
  compinit
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
export TIME_STYLE='long-iso'
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


#
# Load local configs
#
if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi
