Ubuntu
========

gemini.upnl.org
--------
### apt
- git vim-nox zsh fish mosh tmux silversearcher-ag
- nginx htop speedometer fail2ban ntp
- weechat

### apt PPA
- ruby2.3 ruby2.3-dev ruby-switch - [ppa:brightbox/ruby-ng](https://launchpad.net/~brightbox/+archive/ubuntu/ruby-ng)
- tmux                            - [ppa:pi-rho/dev](https://launchpad.net/~pi-rho/+archive/ubuntu/dev)
- gitlab-ce                       - [packages.gitlab.com](https://about.gitlab.com/downloads/#ubuntu1404)
- mono-complete                   - [download.mono-project.com](http://www.mono-project.com/docs/getting-started/install/linux/)

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
- tmux                           - [ppa:pi-rho/dev](https://launchpad.net/~pi-rho/+archive/ubuntu/dev)
- nginx                          - [ppa:nginx/stable](https://launchpad.net/~nginx/+archive/ubuntu/stable)
- gitlab-ce                      - [packages.gitlab.com](https://about.gitlab.com/downloads/#ubuntu1404)
- mongodb-org                    - [repo.mongodb.org](https://docs.mongodb.com/master/tutorial/install-mongodb-on-ubuntu/)
- weechat-curses weechat-plugins - [weechat.org/ubuntu](https://weechat.org/download/debian/#instructions)

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
