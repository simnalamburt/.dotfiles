#
# Auto installation
#
if ! [ -f ~/.zplug/zplug ]; then
  printf "Installing \e[33mzplug\e[0m ... "
  git clone https://github.com/b4b4r07/zplug ~/.zplug --depth=1 2>/dev/null
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


#
# zplug
#
source ~/.zplug/zplug

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/fasd", from:oh-my-zsh
# oh-my-zsh/lib/clipboard.zsh
zplug "rimraf/k", of:k.sh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", of:zsh-syntax-highlighting.zsh
zplug "simnalamburt/shellder"
zplug "simnalamburt/16b755de2b20a08e3534", from:gist, of:cpv.sh

if ! zplug check; then; zplug install; fi
zplug load


# zsh-sensible
stty stop undef
alias mv='mv -i'
alias cp='cp -i'
if hash ledit 2>/dev/null; then
  alias ocaml='ledit ocaml'
  alias racket='ledit racket'
fi


# zshrc
export RUST_BACKTRACE=1
if [ -f ~/.fzf.zsh ]; then; source ~/.fzf.zsh; fi
if [ "$TMUX" = "" ]; then; export TERM="xterm-256color"; fi
export DEFAULT_USER="$USER" # TODO: https://github.com/simnalamburt/shellder/issues/10

# Aliases
if hash nvim 2>/dev/null; then; alias vim='nvim'; fi # neovim
if hash tmux 2>/dev/null; then; alias irc='tmux attach -t irc'; fi
if hash ag 2>/dev/null; then; if ! hash pt 2>/dev/null; then; alias pt='ag'; fi; fi

# Golang
export GOPATH=~/.go
mkdir -p $GOPATH
export PATH="$PATH:$GOPATH/bin"
