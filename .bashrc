# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

PS1='\u@\h:\w\$ '
# Prevent shell from being freezed
stty stop undef
stty -ixon
# Plugins
[[ -d ~/.cgitc ]] && source ~/.cgitc/init.bash
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash


#
# Shell Options
#
# Make bash append rather than overwrite the history on disk
shopt -s histappend
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell


#
# Completion options
#
# Define to avoid stripping description in --option=description of './configure --help'
COMP_CONFIGURE_HINTS=1
# Define to avoid flattening internal contents of tar files
COMP_TAR_INTERNAL_PATHS=1
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
[[ -f /etc/bash_completion ]] && . /etc/bash_completion


#
# History Options
#
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a"


#
# Aliases
#
# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# Default to human readable figures
alias df='df -h'
alias du='du -h'
# Misc :)
alias less='less -R'                          # ANSI color escape characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
# Some shortcuts for different directory listings
alias ls='ls -hF --color=auto'                # classify files in colour
alias ll='ls -lhF --color=auto'               # long list
alias l='ls -AlhF --color=auto'               # show all
