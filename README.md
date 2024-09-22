<p align=center>
  <a href="https://github.com/simnalamburt">
    <img alt="dotfiles" src="https://raw.githubusercontent.com/simnalamburt/i/master/.dotfiles/logo.png">
  </a>
  <br>
  <b><a href="docs/">documentation</a></b> | <a href="packages/">packages</a>
</p>

&nbsp;

```shell
# Import or initialize secrets (i.e. SSH private keys, GPG secret keys, etc)

git clone git@github.com:simnalamburt/.dotfiles.git --depth=1 ~/.dotfiles

# wezterm
mkdir -p ~/.config/wezterm
ln -sf ~/.dotfiles/wezterm.lua ~/.config/wezterm

# karabiner
mkdir -p ~/.config/karabiner
ln -sf ~/.dotfiles/karabiner.json ~/.config/karabiner

# zsh
git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
ln -sf ~/.dotfiles/.zshrc ~
cp ~/.dotfiles/.zshrc.local ~
exec zsh
p10k configure

# neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim
ln -s ~/.dotfiles/.vimrc ~/.config/nvim/init.vim
ln -s ~/.dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json
cp ~/.dotfiles/.vimrc.local ~

# ssh
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ln -sf ~/.dotfiles/sshconfig ~/.ssh/config
cp ~/.dotfiles/sshconfig.local ~/.ssh/config.local

# git
ln -sf ~/.dotfiles/.gitconfig ~
ln -sf ~/.dotfiles/.gitexclude ~
cp ~/.dotfiles/.gitconfig.local ~

# lsd
mkdir -p ~/.config/lsd
ln -sf ~/.dotfiles/lsd.yaml ~/.config/lsd/config.yaml

# tmux (^Q I to install plugins)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/.dotfiles/.tmux.conf ~
```

#### Check out my vim/zsh/tmux plugins
- [simnalamburt/vim-mundo     ](https://github.com/simnalamburt/vim-mundo) - Vim undo tree visualizer
- [simnalamburt/cgitc         ](https://github.com/simnalamburt/cgitc) - Close Git Combat
- [simnalamburt/zsh-expand-all](https://github.com/simnalamburt/zsh-expand-all) - Automatically expands all glob expressions, subcommands, and aliases
- [simnalamburt/ctrlf         ](https://github.com/simnalamburt/ctrlf) - Ctrl+F for your shell
- [simnalamburt/tmux-pane     ](https://github.com/simnalamburt/tmux-pane) - My key-bindings for tmux pane resizing and splitting
- [simnalamburt/shellder      ](https://github.com/simnalamburt/shellder) - Simple and feature-rich zsh/fish shell theme

&nbsp;

--------
*.dotfiles* is primarily distributed under the terms of both the [MIT license]
and the [Apache License (Version 2.0)]. See [COPYRIGHT] for details.

[MIT license]: LICENSE-MIT
[Apache License (Version 2.0)]: LICENSE-APACHE
[COPYRIGHT]: COPYRIGHT
