set -x RUST_BACKTRACE=1
if not set -q TMUX; set TERM xterm-256color; end

# Aliases
if hash nvim 2>/dev/null; alias vim='nvim'; end # neovim
if hash tmux 2>/dev/null; alias irc='tmux attach -t irc'; end
if hash ag 2>/dev/null; if not hash pt 2>/dev/null; alias pt='ag'; end; end

# Golang
set -x GOPATH "~/.go"
mkdir -p $GOPATH
set -x PATH $PATH "$GOPATH/bin"
