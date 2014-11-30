dotfiles
=====

```bash
cd ~

git clone --recursive git@github.com:simnalamburt/dotfiles .dotfiles

ln -sf ~/.dotfiles/.ssh/config .ssh
ln -sf .dotfiles/.vim .
ln -sf .dotfiles/.vimrc .
ln -sf .dotfiles/.gemrc .

ln -sf .dotfiles/.gitconfig .
ln -sf .dotfiles/.gitglobalignore .

ln -sf .dotfiles/.zshrc .
ln -sf ~/.dotfiles/custom.zsh .oh-my-zsh/custom
ln -sf ~/.dotfiles/nocontext.zsh .oh-my-zsh/custom

ln -sf .dotfiles/.babunrc .
ln -sf .dotfiles/.minttyrc .
ln -sf .dotfiles/.inputrc .
```

* Hyeon@*HyeonLaptop*
* HyeonKim@*hyeonmac*
* simnalamburt@hyeon.me
* server@upnl.org
* upnl@upnl.org
* git@upnl.org
* simnalamburt@uriel.upnl.org
* toor@mimosa.snucse.org
