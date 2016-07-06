if not set -q TMUX; set TERM xterm-256color; end
set -x PATH $PATH "$HOME/.local/bin"

# Aliases
if type -q nvim; alias vim='nvim'; end # neovim
if type -q tmux; alias irc='tmux attach -t irc'; end

# Ruby
if begin; type -q ruby; and type -q gem; end
  export GEM_HOME=(ruby -e 'print Gem.user_dir')
  set -x PATH $PATH "$GEM_HOME/bin"
end

# Golang
if type -q go
  set -x GOPATH ~/.go
  mkdir -p $GOPATH
  set -x PATH $PATH "$GOPATH/bin"
end

# Rust
if type -q rustc
  set -x RUST_BACKTRACE 1
end
if type -q cargo
  set -x PATH $PATH "$HOME/.cargo/bin" 2> /dev/null
end

# React Native
if [ -d ~/Library/Android/sdk ];
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  set -x PATH "$HOME/Library/Android/sdk/tools" "$HOME/Library/Android/sdk/platform-tools" $PATH
end

# chips
if [ -e ~/.config/chips/build.fish ] ; source ~/.config/chips/build.fish ; end

# pyenv
if [ -d ~/.pyenv ];
  set -x PATH "$HOME/.pyenv/bin" $PATH
  . (pyenv init -|psub)
  . (pyenv virtualenv-init -|psub)
end

# exa
if type -q exa
  alias l="exa -alh --group-directories-first --git"
  alias ll="exa -lh --group-directories-first --git"
end
