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
- tmux *from* [ppa:pi-rho/dev](https://launchpad.net/~pi-rho/+archive/ubuntu/dev)
- nginx *from* [ppa:nginx/stable](https://launchpad.net/~nginx/+archive/ubuntu/stable)
- ruby2.2 *from* [ppa:brightbox/ruby-ng](https://launchpad.net/~brightbox/+archive/ubuntu/ruby-ng) ([blog article](https://www.brightbox.com/blog/2016/01/06/ruby-2-3-ubuntu-packages/))

- gitlab-ce *from* [packages.gitlab.com](https://about.gitlab.com/downloads/#ubuntu1404)
- mongodb-org *from* [repo.mongodb.org](https://docs.mongodb.com/master/tutorial/install-mongodb-on-ubuntu/)
- nodejs *from* [deb.nodesource.com](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)
- weechat-curses weechat-plugins *from* [weechat.org/ubuntu](https://weechat.org/download/debian/#instructions)
- docker-engine *from* [apt.dockerproject.org](https://docs.docker.com/engine/installation/linux/ubuntulinux/#/update-your-apt-sources)

### etc
- pyenv

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
