set -x RUST_BACKTRACE 1
if not set -q TMUX; set TERM xterm-256color; end
set -x PATH $PATH "$HOME/.local/bin"

# Aliases
if type -q nvim; alias vim='nvim'; end # neovim
if type -q tmux; alias irc='tmux attach -t irc'; end

# Golang
if type -q go
  set -x GOPATH ~/.go
  mkdir -p $GOPATH
  set -x PATH $PATH "$GOPATH/bin"
end

# chips
if [ -e ~/.config/chips/build.fish ] ; source ~/.config/chips/build.fish ; end
