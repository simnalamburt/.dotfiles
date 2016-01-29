set -x RUST_BACKTRACE=1
if not set -q TMUX; set TERM xterm-256color; end

# Aliases
if type nvim >/dev/null; alias vim='nvim'; end # neovim
if type tmux >/dev/null; alias irc='tmux attach -t irc'; end
if type ag >/dev/null; if not hash pt 2>/dev/null; alias pt='ag'; end; end

# Golang
set -x GOPATH ~/.go
mkdir -p $GOPATH
set -x PATH $PATH "$GOPATH/bin"
