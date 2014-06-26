# Edit $PATH variable
path() {
  if [ -d "$1" ]; then
    export PATH="$1:$PATH"
  fi
}

path_weak() {
  if [ -d "$1" ]; then
    if [[ :"$PATH": != *:"$1":* ]]; then
      export PATH="$PATH:$1"
    fi
  fi
}

path "$HOME/.rvm/bin"
path "$HOME/.local/bin"

# Set $TERM variable
export TERM=xterm-256color
