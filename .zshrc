#
# Auto installation
#
if ! [ -f ~/.zplug/zplug ]; then
  printf "Installing \e[33mzplug\e[0m ... "
  curl -fLo ~/.zplug/zplug --create-dirs https://git.io/zplug 2>/dev/null
  echo "Done"
fi

if ! [ -f ~/.vim/autoload/plug.vim ]; then
  printf "Installing \e[33mplug.vim\e[0m ... "
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 2>/dev/null
  echo "Done"

  printf " - Will you link \e[33m.vimrc\e[0m now? [y/N]: "
  if read -q; then
    ln -sf .dotfiles/.vimrc ~
    vim +PlugUpdate +qall
  fi
fi

if (! [ -d ~/.tmux/plugins/tpm ]) && hash tmux 2>/dev/null; then
  printf "Installing \e[33mtpm\e[0m ... "
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm --depth=1 2>/dev/null
  echo "Done"
fi

# Remove legacy
if [ -d ~/.oh-my-zsh ]; then
  printf "Detected unused \e[31moh-my-zsh\e[0m, Remove? [y/N]: "
  if read -q; then
    rm -rf ~/.oh-my-zsh
    echo "\bDone"
  fi
fi

if [ -d ~/.zgen ]; then
  printf "Detected unused \e[31mzgen\e[0m, Remove? [y/N]: "
  if read -q; then
    rm -rf ~/.zgen
    echo "\bDone"
  fi
fi


#
# zplug
#
source ~/.zplug/zplug

zplug "plugins/cp", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh, if:"which git"
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "simnalamburt/shellder"

if ! zplug check; then; zplug install; fi
zplug load


#
# zshrc
#
stty stop undef

export DEFAULT_USER="$USER"
export RUST_BACKTRACE=1

alias mv='mv -i'
alias cp='cp -i'
alias ocaml='ledit ocaml'
alias racket='ledit racket'

if [ -f ~/.fzf.zsh ]; then; source ~/.fzf.zsh; fi
if [ "$TMUX" = "" ]; then; export TERM="xterm-256color"; fi
if [ -d /usr/local/opt/go/libexec/bin ]; then; export PATH=$PATH:/usr/local/opt/go/libexec/bin; fi

if hash tmux 2>/dev/null; then; alias irc='tmux attach -t irc'; fi
if hash ag 2>/dev/null; then; if ! hash pt 2>/dev/null; then; alias pt='ag'; fi; fi

# Arch Linux specific
if [ $(hostname) = "rilakkuma" ]; then
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
fi
