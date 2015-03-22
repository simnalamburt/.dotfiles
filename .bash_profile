if [ -d $HOME/.local/bin ]; then
  export PATH=$HOME/.local/bin:$PATH
fi

if hash zsh 2>/dev/null; then
  exec zsh -l
fi
