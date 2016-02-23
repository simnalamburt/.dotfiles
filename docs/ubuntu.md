Ubuntu
========

gemini.upnl.org
--------
### `apt-get`
- git, vim-nox, zsh, mosh, tmux, silversearcher-ag
- nginx, htop, speedometer, fail2ban, ntp
- weechat

### `apt-get` PPA
- [ruby2.2, ruby2.2-dev](https://www.brightbox.com/docs/ruby/ubuntu/) (`sudo apt-add-repository ppa:brightbox/ruby-ng`)
- [tmux](https://launchpad.net/~pi-rho/+archive/ubuntu/dev) (`sudo apt-add-repository ppa:pi-rho/dev`)
- [GitLab](https://about.gitlab.com/downloads/#ubuntu1404)
- [mono](http://www.mono-project.com/docs/getting-started/install/linux/)

<br>

hyeon.me
--------
### `apt-get`
- python, python-dev, python-pip
    * pysha3
- postfix
- debian-goodies, ppa-purge
- dhex, radare2
- linux-generic-lts-wily *(높은버전 커널 쓰려고 깔음)*

### `apt-get` PPA
- mongodb
- [node](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions)
- [ruby2.2](https://www.brightbox.com/blog/2015/01/05/ruby-2-2-0-packages-for-ubuntu/)
- deluged, deluge-web (`sudo apt-add-repository ppa:deluge-team/ppa`)

### DNS Setting
메일을 보내려면 SPF 레코드가 똑바로 설정되어있어야 한다.

    v=spf1 a mx ptr ptr:175.197.17.221 -all
