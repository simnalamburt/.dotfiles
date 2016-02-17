MSYS2
========
### `pacman`
- ca-certificates
- git, vim, zsh
- wget, tar, zip
- ruby, python2
- base-devel, gcc, make, gmp-devel, libcrypt-devel, ncurses-devel (required by fzf)

### `.msi`
- rust, go

<br>

--------

<br>

How to Install
--------
1.  Remap [Caps Lock &rarr; Control][remap]
1.  Install [Consolas for Powerline][consolas]
1.  [Disable snap assistant](http://i.imgur.com/0O4BgFW.png)
1.  Install **[msys2](https://msys2.github.io)**
1.  Install packages
1.  Edit `/msys2_shell.bat`

    1. Enable symlink
    1. Add `set LANG=ko_KR.UTF-8`
    1. Replace `/usr/bin/bash` into `/usr/bin/zsh`

1.  Edit `/etc/profile`

    ```
    # ...
    PS1='(%n@%m)[%h] %~ %% '
    SHELL=$(which zsh) # <- Add this!!
    ```

1.  Clone [dotfiles](../README.md)
1.  Invoke zplug with `exec zsh`, then fix symlinks manually

[remap]: https://gist.github.com/simnalamburt/90965dcb09cec6b82320/raw/58a9f61143273d5226be352d2c29ecf738e5bffd/capslock-to-control.reg
[consolas]: https://gist.github.com/simnalamburt/90965dcb09cec6b82320/raw/58a9f61143273d5226be352d2c29ecf738e5bffd/consola.ttf

