Dotfiles
=====

```bash
cd ~

git clone --recursive git@github.com:simnalamburt/rcm.git .rcm

ln -s ~/.rcm/.ssh/config .ssh
ln -s .rcm/.vim .
ln -s .rcm/.vimrc .
ln -s .rcm/.gemrc .

ln -s .rcm/.gitconfig .
ln -s .rcm/.gitglobalignore .

ln -s .rcm/.zshrc .
ln -s ~/.rcm/custom.zsh .oh-my-zsh/custom
ln -s ~/.rcm/nocontext.zsh .oh-my-zsh/custom

ln -s .rcm/.babunrc .
ln -s .rcm/.minttyrc .
ln -s .rcm/.inputrc .
```

* Hyeon@*HyeonLaptop*
* HyeonKim@*hyeonmac*
* simnalamburt@hyeon.me
* server@upnl.org
* upnl@upnl.org
* git@upnl.org
* simnalamburt@uriel.upnl.org
* toor@mimosa.snucse.org
