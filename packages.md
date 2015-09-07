OS X
--------
1.  Applications
    * Firefox
    * Google Drive
    * iTerm2, xCode
    * 카톡, 라인, InsomniaX, GarageBand, OBS
1.  [brew](http://brew.sh)
    * vim, git, mosh, wget, xz, pt
    * ruby, iojs, python, python3
    * p7zip, htop, gtar, nmap, binutils
    * haskell(ghc, cabal-install), ocaml, ledit
    * pandoc
    * w3m, peco
    * ffmpeg (--with-libvpx)
1.  [caskroom/cask](http://caskroom.io)
    * xquartz
    * horndis
    * mactex
    * dropbox
1.  manastech/crystal
    * crystal-lang
1.  폰트
    * [Monaco for powerline.otf](https://gist.github.com/baopham/1838072)
1.  etc
    * [rust][]

Ubuntu Server
--------
1.  apt-get
    * git, vim-nox, zsh, mosh
    * tmux
    * weechat
    * nginx
    * htop, speedometer, fail2ban, ntp
    * silversearcher-ag, mosh
    * python, python-dev, python-pip
      * pysha3
    * postfix
      * `v=spf1 a mx ptr ptr:175.197.17.221 -all`
    * debian-goodies
1.  PPA
    * mongodb
    * [nodejs](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions)
    * [ruby2.1, ruby2.1-dev](https://www.brightbox.com/docs/ruby/ubuntu/)
1.  etc
    * [gitlab](https://github.com/gitlabhq/gitlabhq/blob/master/doc/install/installation.md)

Arch Linux
--------
1.  pacman
    * base, grub, sudo, gnome, xf86-input-synaptics
    * openssh, wget, git, vim, zsh, tmux, mosh
    * chromium *(remove epiphany)*
    * gnome-tweak-tool, ibus-hangul, adobe-source-han-sans-otc-fonts
    * dialog, wpa_supplicant *(for wifi-menu)*
1.  yaourt
    * the_platinum_searcher
    * gtk-theme-arc-git, numix-circle-icon-theme-git

MSYS2
--------
1.  pacman
    * [ca-certificates][ca]
    * git, vim, zsh
    * wget, tar, zip
    * ruby, python2
    * mingw-w64-x86_64-gcc, make
    * base-devel, gcc, gmp-devel, libcrypt-devel, ncurses-devel (required by fzf)
1.  etc
    * [rust][]

[ca]: http://qiita.com/7shi/items/894fdd849658880bf6c9
[rust]: http://doc.rust-lang.org/book/installing-rust.html
