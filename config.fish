#
# lscolors
#
set -x LSCOLORS "Gxfxcxdxbxegedabagacad"
set -x LS_COLORS "di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
set -x TIME_STYLE "+%y%m%d"


#
# Fishrc
#
if not set -q TMUX; set TERM xterm-256color; end
set -x PATH "$HOME/.local/bin" $PATH
set -x LANG ko_KR.UTF-8

# Aliases
if type -q tmux; alias irc='tmux attach -t irc'; end

# Ruby
if begin; type -q ruby; and type -q gem; end
  set -x GEM_HOME (ruby -e 'print Gem.user_dir')
  set -x PATH $PATH "$GEM_HOME/bin"
end

# Golang
if type -q go
  set -x GOPATH ~/.go
  mkdir -p "$GOPATH/bin"
  set -x PATH $PATH "$GOPATH/bin"
end

# Rust
if type -q rustc
  set -x RUST_BACKTRACE 1
end
if type -q cargo
  set -x PATH $PATH "$HOME/.cargo/bin" 2> /dev/null
end

# chips
if [ -e ~/.config/chips/build.fish ]; . ~/.config/chips/build.fish ; end

# pyenv
if [ -d ~/.pyenv ]
  set -x PATH "$HOME/.pyenv/bin" $PATH
  . (pyenv init -|psub)
  . (pyenv virtualenv-init -|psub)
end

# exa
if type -q exa
  alias l="exa -alh --group-directories-first"
  alias ll="exa -lh --group-directories-first"
end


# Source local config
if [ -f (status -f).local ]; . (status -f).local; end
