<p align=center>
  <a href="https://github.com/simnalamburt">
    <img alt="dotfiles" src="https://raw.githubusercontent.com/simnalamburt/i/master/.dotfiles/logo.png">
  </a>
  <br>
  <b><a href="docs/">documentation</a></b> | <a href="packages/">packages</a>
</p>

<br>

```shell
# Import or initialize secrets:
#   SSH private keys, GPG secret keys, AWSCLI API keys, Terraform API keys,
#   Docker tokens, Cargo tokens, Bundle tokens, NPM tokens, PIP tokens, ...

git clone git@github.com:simnalamburt/.dotfiles.git --depth=1 ~/.dotfiles

# neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim
ln -s ~/.dotfiles/.vimrc ~/.config/nvim/init.vim
cp ~/.dotfiles/.vimrc.local ~

# zsh
git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
ln -sf ~/.dotfiles/.zshrc ~
p10k configure

# ssh
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ln -sf ~/.dotfiles/.ssh/config ~/.ssh
cp ~/.dotfiles/.ssh/config.local ~/.ssh

# git
ln -sf ~/.dotfiles/.gitconfig ~
ln -sf ~/.dotfiles/.gitexclude ~
cp ~/.dotfiles/.gitconfig.local ~

# gpg
mkdir -p ~/.gnupg
cp ~/.dotfiles/gpg-agent.conf ~/.gnupg
# Trust my key
gpg --edit-key 0F85F46EE242057F
# gpg> uid 1
# gpg> trust
# Your decision? 5
# Do you really want to set this key to ultimate trust? (y/N) y
# gpg> save

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/.dotfiles/.tmux.conf ~

# sway
mkdir -p ~/.config/sway
ln -s ~/.dotfiles/swayconfig ~/.config/sway/config

# alacritty
mkdir -p ~/.config/alacritty
ln -s ~/.dotfiles/alacritty.yml ~/.config/alacritty/.

# sirula
mkdir -p ~/.config/sirula
ln -s ~/.dotfiles/sirula.toml ~/.config/sirula/config.toml
ln -s ~/.dotfiles/sirula.css  ~/.config/sirula/style.css
```

#### Check out my vim/zsh/tmux plugins
- [simnalamburt/vim-mundo     ](https://github.com/simnalamburt/vim-mundo) - Vim undo tree visualizer
- [simnalamburt/cgitc         ](https://github.com/simnalamburt/cgitc) - Close Git Combat
- [simnalamburt/zsh-expand-all](https://github.com/simnalamburt/zsh-expand-all) - Automatically expands all glob expressions, subcommands, and aliases
- [simnalamburt/ctrlf         ](https://github.com/simnalamburt/ctrlf) - Ctrl+F for your shell
- [simnalamburt/tmux-pane     ](https://github.com/simnalamburt/tmux-pane) - My key-bindings for tmux pane resizing and splitting
- [simnalamburt/shellder      ](https://github.com/simnalamburt/shellder) - Simple and feature-rich zsh/fish shell theme

<br>

--------
*dotfiles* is primarily distributed under the terms of both the [MIT license]
and the [Apache License (Version 2.0)]. See [COPYRIGHT] for details.

[MIT license]: LICENSE-MIT
[Apache License (Version 2.0)]: LICENSE-APACHE
[COPYRIGHT]: COPYRIGHT
