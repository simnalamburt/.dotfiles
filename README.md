dotfiles
=====

Requires `git` and `zsh`

```bash
cd ~
git clone https://github.com/simnalamburt/.dotfiles.git --depth=1
ln -sf .dotfiles/.zshrc
ln -sf .dotfiles/.vimrc
ln -sf .dotfiles/.gitconfig
ln -sf .dotfiles/.gitexclude
ln -sf .dotfiles/.tmux.conf
ln -sf .dotfiles/.gemrc

mkdir -p .ssh && chmod 700 .ssh && ln -sf ../.dotfiles/.ssh/config .ssh
mkdir -p .gradle && ln -s ../.dotfiles/gradle.properties .gradle
ln -sf ~/.dotfiles/karabiner/private.xml "$HOME/Library/Application Support/Karabiner"
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
