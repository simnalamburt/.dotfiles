hyeonme
--------
1.  apt-get
    * git, vim-nox, zsh, mosh, tmux, silversearcher-ag
    * nginx, htop, speedometer, fail2ban, ntp
    * weechat
    * python, python-dev, python-pip
      * pysha3
    * postfix
      * `v=spf1 a mx ptr ptr:175.197.17.221 -all`
    * debian-goodies, ppa-purge
    * dhex, radare2
1.  PPA
    * mongodb
    * [node](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions)
    * [tmux 2.0](https://launchpad.net/~pi-rho/+archive/ubuntu/dev) (`sudo apt-add-repository ppa:pi-rho/dev`)
    * [ruby 2.2](https://www.brightbox.com/blog/2015/01/05/ruby-2-2-0-packages-for-ubuntu/)
    * deluged, deluge-web (`sudo apt-add-repository ppa:deluge-team/ppa`)
1.  [GitLab](https://github.com/gitlabhq/gitlabhq/blob/master/doc/install/installation.md)

gemini.upnl.org
--------
1.  apt-get
    * git, vim-nox, zsh, mosh, tmux, silversearcher-ag
    * nginx, htop, speedometer, fail2ban, ntp
    * weechat
1.  PPA
    * [ruby2.2, ruby2.2-dev](https://www.brightbox.com/docs/ruby/ubuntu/)
    * [tmux 2.0](https://launchpad.net/~pi-rho/+archive/ubuntu/dev)
1.  [GitLab](https://github.com/gitlabhq/gitlabhq/blob/master/doc/install/installation.md)

Arch Linux
--------
1.  pacman
    * base, grub, sudo, gnome, xf86-input-synaptics
    * dialog, wpa_supplicant *(for wifi-menu)*
    * openssh, wget, lshw, htop
    * git, vim, zsh, tmux, mosh
    * chromium *(remove epiphany)*
    * gnome-tweak-tool, ibus-hangul, adobe-source-han-sans-otc-fonts
1.  yaourt
    * the_platinum_searcher, fasd
    * gtk-theme-arc-git, numix-circle-icon-theme-git

MSYS2
--------
1.  pacman
    * [ca-certificates][ca]
    * git, vim, zsh
    * wget, tar, zip
    * ruby, python2
    * base-devel, gcc, make, gmp-devel, libcrypt-devel, ncurses-devel (required by fzf)
1.  etc
    * [rust][]

[ca]: http://qiita.com/7shi/items/894fdd849658880bf6c9
[rust]: http://doc.rust-lang.org/book/installing-rust.html
