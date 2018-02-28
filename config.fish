if not status --is-interactive; exit; end

function __path
  switch (count $argv)
  case 1
    if perl -e "exit(!(grep(m{^$argv[1]\$},split(':', \$ENV{PATH}))) > 0)"; return; end

    # Append to $PATH
    set PATH $PATH "$argv[1]" ^/dev/null
  case 2
    if perl -e "exit(!(grep(m{^$argv[1]\$},split(':', \$ENV{PATH}))) > 0)"; return; end
    if [ "$argv[2]" != "--force" ]; return 1; end

    # Prepend to $PATH
    set PATH "$argv[1]" $PATH ^/dev/null
  case '*'
    return 1
  end
end

if printf '%s\n' '2.2.0' $FISH_VERSION | sort --check=silent --version-sort
  # Current version ≥ 2.2.0
  function __available -a name
    command -v "$name" ^/dev/null >&2
  end
else
  # Current version < 2.2.0
  function __available -a name
    type "$name" ^/dev/null >&2
  end
end


#
# notify
#
if __available osascript
  function notify -d 'Create a notification'
    osascript -e "
      display notification \"$argv\" sound name \"Glass\" with title \"Shell Notification\"
      say \"$argv\"
    "
  end
end


#
# lscolors
#
set -x LSCOLORS 'Gxfxcxdxbxegedxbagxcad'
set -x LS_COLORS 'di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=30;46:tw=0;42:ow=30;43'
set -x TIME_STYLE '+%y%m%d'


#
# Fishrc
#
if not set -q TMUX; set TERM xterm-256color; end
set -x LANG ko_KR.UTF-8

# ~/.local/bin
if [ -d ~/.local/bin ]
  __path "$HOME/.local/bin" --force
end

# Aliases
if __available tmux; alias irc='tmux attach -t irc'; end

# Neovim
if __available nvim
  set -x EDITOR nvim
end

# Terraform
if __available terraform
  set -x TF_PLUGIN_CACHE_DIR "$HOME/.terraform.d/plugin-cache"
end

# Golang
if __available go; and [ -d "$HOME/.go" ]
  set -x GOPATH "$HOME/.go"
  __path "$GOPATH/bin"
end

# Ruby
if __available ruby; and __available gem
  set -x GEM_HOME (ruby -e 'print Gem.user_dir')
  __path "$GEM_HOME/bin"
end

# cargo install
if [ -d ~/.cargo/bin ]
  __path "$HOME/.cargo/bin"
end
# yarn global
if __available yarn
  __path "$HOME/.config/yarn/global/node_modules/.bin"
end

# exa
if __available exa
  alias l='exa -alh --group-directories-first'
  alias ll='exa -lh --group-directories-first'
end

# Couchbase tools
if [ -d '/Applications/Couchbase Server.app/Contents/Resources/couchbase-core/bin/' ]
  __path '/Applications/Couchbase Server.app/Contents/Resources/couchbase-core/bin/'
end

# chips <https://github.com/xtendo-org/chips>
if [ -f ~/.config/chips/build.fish ] ; . ~/.config/chips/build.fish ; end


functions --erase __path __available


#
# Load local configs
#
if [ -f ~/.config/fish/config-local.fish ]
  source ~/.config/fish/config-local.fish
end
