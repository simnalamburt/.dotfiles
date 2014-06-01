# Edit $PATH variable
Path() {
  if [[ :$PATH: != *:"$1":* ]] ; then
    export PATH=$PATH:$1
  fi
}

PathStrongly() {
  if [[ :$PATH: != *:"$1":* ]] ; then
    export PATH=$1:$PATH
  fi
}

PathStrongly "$HOME/.rvm/bin"
Path         "$HOME/.local/bin"

# Set $TERM variable
export TERM=xterm-256color
