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

path "/usr/local/bin"
path "$HOME/.local/bin"
path "$HOME/.rvm/bin"

# Set a rvm env variable
export rvmsudo_secure_path=0

# Set $TERM variable
export TERM=xterm-256color
