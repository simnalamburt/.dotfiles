Ubuntu
========

gemini.upnl.org
--------
### apt
- git vim-nox zsh mosh tmux silversearcher-ag
- nginx htop speedometer fail2ban ntp
- weechat

### apt PPA
- [ruby2.3 ruby2.3-dev ruby-switch](https://www.brightbox.com/docs/ruby/ubuntu/) (`sudo apt-add-repository ppa:brightbox/ruby-ng`)
- [tmux](https://launchpad.net/~pi-rho/+archive/ubuntu/dev) (`sudo apt-add-repository ppa:pi-rho/dev`)
- [GitLab](https://about.gitlab.com/downloads/#ubuntu1404)
- [mono](http://www.mono-project.com/docs/getting-started/install/linux/)

<br>

hyeon.me
--------
### apt
- python python-dev python-pip
- postfix
- debian-goodies ppa-purge
- dhex radare2
- linux-generic-lts-wily *(높은버전 커널 쓰려고 깔음)*
- mosh htop silversearcher-ag

### apt PPA
- mongodb
- [node](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions)
- [ruby2.2](https://www.brightbox.com/blog/2015/01/05/ruby-2-2-0-packages-for-ubuntu/)
- neovim (`sudo apt-add-repository ppa:neovim-ppa/unstable`)

### pip2
- pysha3

### pip3
- neovim

<br>

cse.snu.ac.kr
--------
### apt
- mosh htop zsh fish
- fail2ban



<br>

--------

<br>



Documentation
========
### DNS Setting
메일을 보내려면 SPF 레코드가 똑바로 설정되어있어야 한다.

    v=spf1 a mx ptr ptr:175.197.17.221 -all

### Use neovim as a default text editor
```shell
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
```
