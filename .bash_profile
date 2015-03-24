if [ -d $HOME/.local/bin ]; then
  export PATH=$HOME/.local/bin:$PATH
fi

if [ -d $HOME/.local/lib ]; then
  export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH
fi

if hash zsh 2>/dev/null; then
  exec zsh -l
fi
