# Edit $PATH variable
path() {
  if [ -d "$1" ]; then
    export PATH="$1:$PATH"
  fi
}

path "/usr/local/bin"
path "$HOME/.local/bin"
path "$HOME/.rvm/bin"

# Set a rvm env variable
export rvmsudo_secure_path=0

# Set a $TERM variable
export TERM=xterm-256color
