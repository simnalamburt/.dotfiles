# If not running interactively, don't do anything
[[ -o interactive ]] || return

# There configs should be set before p10k instant prompt
stty stop undef
export GPG_TTY=$(tty)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-${HOME}/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-${HOME}/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



#
# zinit
#
autoload -U is-at-least
if is-at-least 5.1 && [[ -d ~/.zinit ]]; then
  source ~/.zinit/bin/zinit.zsh
  zinit ice depth=1
  zinit light romkatv/powerlevel10k
  zinit light simnalamburt/cgitc
  zinit light zdharma/fast-syntax-highlighting
  zinit light zsh-users/zsh-completions

  # zsh-autosuggestions
  ZSH_AUTOSUGGEST_USE_ASYNC=1
  if is-at-least 5.3; then
    zinit ice silent wait'1' atload'_zsh_autosuggest_start'
  fi
  zinit light zsh-users/zsh-autosuggestions

  # zsh-expand-all
  ZSH_EXPAND_ALL_DISABLE=word
  zinit light simnalamburt/zsh-expand-all

  # zsh-history-substring-search
  zinit light zsh-users/zsh-history-substring-search
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down

  autoload -Uz compinit bashcompinit
  compinit
  bashcompinit
  zinit cdreplay
else
  # Default terminal
  case "${TERM}" in
    xterm-color|*-256color)
      PS1=$'\e[1;32m%n@%m\e[0m:\e[1;34m%~\e[0m%(!.#.$) ';;
    *)
      PS1='%n@%m:%~%(!.#.$) ';;
  esac

  autoload -Uz compinit bashcompinit
  compinit
  bashcompinit
fi


#
# powerlevel10k. To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
#
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Show me exit codes
typeset -g POWERLEVEL9K_STATUS_ERROR=true
# Less distractive colorscheme
typeset -g POWERLEVEL9K_TIME_FOREGROUND=238
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=242
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=226


# EDITOR이나 VISUAL 환경변수 안에 'vi' 라는 글자가 들어있으면 자동으로
# emacs-like 키바인딩들이 해제되어서, ^A ^E 등을 모조리 쓸 수 없어진다.
# 무슨짓이냐...
#
# References:
#   https://stackoverflow.com/a/43087047
#   https://github.com/zsh-users/zsh/blob/96a79938010073d14bd9db31924f7646968d2f4a/Src/Zle/zle_keymap.c#L1437-L1439
#   https://github.com/yous/dotfiles/commit/c29bf215f5a8edc6123819944e1bf3336a4a6648
if (( $+commands[vim] )); then
  export EDITOR=vim
elif (( $+commands[nvim] )); then
  export EDITOR=nvim
fi
bindkey -e


#
# Load local configs
#
if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi


#
# zsh-sensible
#
if (( $+commands[lsd] )); then
  alias l='lsd -Al'
  alias ll='lsd -l'
  alias lt='lsd --tree --depth=2'
else
  alias l='ls -alh'
  alias ll='ls -lh'
fi
alias mv='mv -i'
alias cp='cp -i'

HISTSIZE=90000
SAVEHIST=90000
HISTFILE=~/.zsh_history

setopt auto_cd histignorealldups sharehistory
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
# Substring completion
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Unset ctrl-s key
clear_screen() { tput clear }
zle -N clear_screen
bindkey '^s' clear_screen

# Fix home/end/delete
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char


#
# lscolors
#
export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=30;46:tw=0;42:ow=30;43"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

export LSCOLORS="Gxfxcxdxbxegedxbagxcad"
export TIME_STYLE='long-iso'
autoload -U colors && colors


#
# zsh-substring-completion
#
setopt complete_in_word
setopt always_to_end
WORDCHARS=''
zmodload -i zsh/complist


#
# WSL support
#
if [[ -f /proc/sys/fs/binfmt_misc/WSLInterop ]]; then
  umask 022
  alias open=explorer.exe
  alias pbcopy=clip.exe
  alias pbpaste='powershell.exe Get-Clipboard | sed "s/\r$//" | head -c -1'
fi


#
# zshrc
#
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export DOCKER_BUILDKIT=1

# Terraform
if (( $+commands[terraform] )); then
  alias tf='terraform'
  export TF_PLUGIN_CACHE_DIR="${HOME}/.terraform.d/plugin-cache"
fi

# Golang
if (( $+commands[go] )); then
  export GOPATH="${HOME}/.go"
fi
