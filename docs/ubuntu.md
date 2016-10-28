Ubuntu
========

gemini.upnl.org
--------
### apt
- git vim-nox zsh fish mosh tmux silversearcher-ag
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
- vim mosh fish git htop silversearcher-ag
- dhex radare2
- postfix
- debian-goodies ppa-purge
- linux-generic-lts-xenial *(높은버전 커널 쓰려고 깔음)*
- linux-image-extra-virtual *(도커 돌릴때 AUFS 쓰려고 깔음)*

### apt PPA
- gitlab-ce
- tmux
- mongodb
- [node](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions)
- [ruby2.2](https://www.brightbox.com/blog/2015/01/05/ruby-2-2-0-packages-for-ubuntu/)
- [weechat-curses weechat-plugins](https://weechat.org/download/debian/#instructions)
- [docker-engine](https://docs.docker.com/engine/installation/linux/ubuntulinux/#/update-your-apt-sources)

### pip2
- pysha3

<br>

cse.snu.ac.kr
--------
### apt
- mosh htop zsh fish tmux
- fail2ban



<br>

--------

<br>



Memo
========
### DNS Setting
메일을 보내려면 SPF 레코드가 똑바로 설정되어있어야 한다.

    v=spf1 a mx ptr ptr:175.197.17.221 -all
