# Edit $PATH variable
Path() {
  if [[ :$PATH: != *:"$1":* ]] ; then
    PATH=$PATH:$1
  fi
}

Path "$HOME/.rvm/bin"
Path "$HOME/.local/bin"
if [[ $(uname -s) == "CYGWIN_NT"* ]]; then
  Path "/cygdrive/c/Windows"
  Path "/cygdrive/c/Windows/system32"
fi
export PATH

# Set $TERM variable
TERM=xterm-256color
