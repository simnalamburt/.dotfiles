<p align=center>
  <a href="https://github.com/simnalamburt">
    <img alt="dotfiles" src="https://raw.githubusercontent.com/simnalamburt/i/master/.dotfiles/logo.png">
  </a>
  <br>
  <b><a href="docs/">documentation</a></b> | <a href="packages/">packages</a>
</p>

<br>

```shell
git clone https://github.com/simnalamburt/.dotfiles.git --depth=1 ~/.dotfiles

# zinit         https://github.com/zdharma/zinit
# vim-plug      https://github.com/junegunn/vim-plug
# tpm           https://github.com/tmux-plugins/tpm

ln -sf ~/.dotfiles/.zshrc ~
ln -sf ~/.dotfiles/.vimrc ~
ln -sf ~/.dotfiles/.tmux.conf ~

# git
ln -sf ~/.dotfiles/.gitconfig ~
ln -sf ~/.dotfiles/.gitexclude ~
cp ~/.dotfiles/.gitconfig.local ~

# ssh
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ln -sf ~/.dotfiles/.ssh/config ~/.ssh
cp ~/.dotfiles/.ssh/config.local ~/.ssh

# neovim
mkdir -p ~/.config/nvim
ln -s ~/.dotfiles/.vimrc ~/.config/nvim/init.vim

# Misc
mkdir -p ~/.gnupg && cp ~/.dotfiles/gpg-agent.conf ~/.gnupg
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
