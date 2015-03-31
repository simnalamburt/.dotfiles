dotfiles
=====

Requires `git` and `zsh`

```bash
cd ~
git clone --depth=1 git@github.com:simnalamburt/dotfiles.git .dotfiles
git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh

ln -sf .dotfiles/.vim .
ln -sf .dotfiles/.vimrc .
ln -sf .dotfiles/.zshrc .
ln -sf .dotfiles/.gitconfig .
ln -sf .dotfiles/.gitexclude .
ln -sf ~/.dotfiles/.ssh/config .ssh

ln -sf .dotfiles/.hushlogin
ln -sf .dotfiles/.bash_profile

ln -sf .dotfiles/.gemrc .
ln -sf .dotfiles/.weechat .
ln -sf .dotfiles/.minttyrc .

# tmux
ln -sf .dotfiles/.tmux .
ln -sf .dotfiles/.tmux.conf .
cd .dotfiles && git submodule update --init --depth=1 --recursive
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
