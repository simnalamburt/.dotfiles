dotfiles
=====

Requires `git` and `zsh`

```bash
cd ~
git clone https://github.com/simnalamburt/.dotfiles.git --depth=1

# zsh
git clone https://github.com/tarjoilija/zgen.git .zgen/zgen --depth=1
ln -sf .dotfiles/.zshrc

# vim
curl -fLo .vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf .dotfiles/.vimrc
vim +PlugUpdate +qall

ln -sf .dotfiles/.gemrc
ln -sf .dotfiles/.gitconfig
ln -sf .dotfiles/.gitexclude
mkdir -p .ssh && chmod 700 .ssh && ln -sf ../.dotfiles/.ssh/config .ssh

# tmux
git clone https://github.com/tmux-plugins/tpm .tmux/plugins/tpm --depth=1
ln -sf .dotfiles/.tmux.conf

# etc
mkdir -p .gradle && ln -s ../.dotfiles/gradle.properties .gradle
```

* [Cheatsheet of various commands](cheatsheet.md)
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
