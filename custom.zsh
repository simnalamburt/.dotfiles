# Edit $PATH variable
Path() {
  if [ -d "$1" ]; then
    if [[ :"$PATH": != *:"$1":* ]]; then
      export PATH="$PATH:$1"
    fi
  fi
}

PathStrongly() {
  if [ -d "$1" ]; then
    if [[ :"$PATH": != *:"$1":* ]]; then
      export PATH="$1:$PATH"
    fi
  fi
}

PathStrongly "/usr/local/opt/ruby/bin"
PathStrongly "$HOME/.rvm/bin"
Path         "$HOME/.local/bin"

# Set $TERM variable
export TERM=xterm-256color
