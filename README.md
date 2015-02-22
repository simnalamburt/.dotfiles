dotfiles
=====

```bash
cd ~
git clone --depth=1 git@github.com:simnalamburt/dotfiles.git .dotfiles
git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh

ln -sf .dotfiles/.vim .
ln -sf .dotfiles/.vimrc .
ln -sf .dotfiles/.zshrc .
ln -sf .dotfiles/.gemrc .
ln -sf .dotfiles/.gitconfig .
ln -sf .dotfiles/.gitexclude .
ln -sf ~/.dotfiles/.ssh/config .ssh

ln -sf .dotfiles/.weechat .
ln -sf .dotfiles/.babunrc .
ln -sf .dotfiles/.minttyrc .
ln -sf .dotfiles/.inputrc .

# tmux
ln -sf .dotfiles/.tmux .
ln -sf .dotfiles/.tmux.conf .
cd .dotfiles && git submodule update --init --depth=1 --recursive
```

### Prerequisites

1.  git
2.  zsh

--------

* Hyeon@*HyeonLaptop*
* HyeonKim@*hyeonmac*
* simnalamburt@hyeon.me
* server@upnl.org
* upnl@upnl.org
* git@upnl.org
* simnalamburt@uriel.upnl.org
