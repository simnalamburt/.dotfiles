# Edit $PATH variable
Path() {
  if [[ :$PATH: != *:"$1":* ]] ; then
    PATH=$PATH:$1
  fi
}

PathStrongly() {
  if [[ :$PATH: != *:"$1":* ]] ; then
    PATH=$1:$PATH
  fi
}

PathStrongly "$HOME/.rvm/bin"
Path         "$HOME/.local/bin"
export PATH

# Set $TERM variable
TERM=xterm-256color
