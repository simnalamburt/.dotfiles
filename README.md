dotfiles
=====

Requires `git` and `zsh`

```bash
cd ~
mkdir -p .ssh
chmod 700 .ssh

ln -sf .dotfiles/.vim
ln -sf .dotfiles/.vimrc
ln -sf .dotfiles/.zshrc
ln -sf .dotfiles/.gemrc
ln -sf .dotfiles/.gitconfig
ln -sf .dotfiles/.gitexclude
ln -sf ~/.dotfiles/.ssh/config .ssh

git clone https://github.com/simnalamburt/.dotfiles.git --depth=1
curl -fLo .vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugUpdate +qall

# tmux
git clone https://github.com/tmux-plugins/tpm .tmux/plugins/tpm --depth=1
ln -sf .dotfiles/.tmux.conf
```

* [Cheatsheat of various commands](cheatsheat.md)
* [Making various development environments](installation.md)
* [Don't forget what you've installed](packages.md)

--------

* **OS X**
* **MSYS2**
* **Arch Linux**
* hyeon.me
* upnl.org (server, upnl, root)
* uriel.upnl.org

--------

BSD 2-Clause
