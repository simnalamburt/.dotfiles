# Edit $PATH variable
Path() {
  if [[ :$PATH: != *:"$1":* ]] ; then
    PATH=$PATH:$1
  fi
}

Path "$HOME/.rvm/bin"
Path "$HOME/.local/bin"
export PATH

# Set $TERM variable
TERM=xterm-256color
