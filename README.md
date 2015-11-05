dotfiles
=====

Requires `git` and `zsh`

```bash
cd ~
mkdir -p .ssh && chmod 700 .ssh
git clone https://github.com/simnalamburt/.dotfiles.git --depth=1
curl -fLo .vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -sf .dotfiles/.vimrc

git clone https://github.com/tarjoilija/zgen.git .zgen/zgen --depth=1
ln -sf .dotfiles/.zshrc
ln -sf .dotfiles/.gemrc
ln -sf .dotfiles/.gitconfig
ln -sf .dotfiles/.gitexclude
ln -sf ../.dotfiles/.ssh/config .ssh

vim +PlugUpdate +qall

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
