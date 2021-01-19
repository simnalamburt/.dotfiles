# See https://github.com/simnalamburt/.dotfiles/blob/master/.bashrc

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Prevent shell from being freezed
stty stop undef
stty -ixon


#
# History Options
#
# Make bash append rather than overwrite the history on disk
shopt -s histappend
# Unlimited history length
HISTSIZE=
HISTFILESIZE=
# Don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoreboth
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a"


#
# Shell Options
#
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color)
    PS1='\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ ';;
  *)
    PS1='\u@\h:\w\$ ';;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi


#
# Completion options
#
# Define to avoid stripping description in --option=description of './configure --help'
COMP_CONFIGURE_HINTS=1
# Define to avoid flattening internal contents of tar files
COMP_TAR_INTERNAL_PATHS=1
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#
# Aliases
#
# Interactive operation...
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
# Some shortcuts for different directory listings
alias ls='ls -hF --color=auto'                # classify files in colour
alias ll='ls -lhF --color=auto'               # long list
alias l='ls -AlhF --color=auto'               # show all
# Default to human readable figures
alias df='df -h'
alias du='du -h'
# Misc :)
alias less='less -R'                          # ANSI color escape characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour


#
# Plugins
#
[[ -d ~/.cgitc ]] && source ~/.cgitc/init.bash


#
# Load local configs
#
if [[ -f ~/.bashrc.local ]]; then
  source ~/.bashrc.local
fi
