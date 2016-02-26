[msys2]
========
#### `pacman`
- ca-certificates
- git vim zsh wget tar zip
- ruby python2

#### `.msi`
- [rust][] [go][]
- [git-lfs]

#### Manual Installed
- [ack][] [file-next][]

<br>

--------

<br>

How to Install
--------
1.  Remap [Caps Lock &rarr; Control][caps]
1.  Install [Consolas for Powerline]
1.  [Disable snap assistant](http://i.imgur.com/0O4BgFW.png)
1.  Install **[msys2]**
1.  Install packages
1.  Edit `/msys2_shell.bat`, `/mingw32_shell.bat`, `/mingw64_shell.bat`

    1. Enable symlink
    1. Replace `/usr/bin/bash` into `/usr/bin/zsh`

1.  Edit `/etc/profile`

    ```
    # ...
    PS1='(%n@%m)[%h] %~ %% '
    SHELL=$(which zsh) # <- Add this!!
    ```

1.  Clone [dotfiles](../README.md)
1.  Invoke zplug with `exec zsh`, then fix symlinks manually

[rust]: https://www.rust-lang.org/
[go]: https://golang.org/
[git-lfs]: https://git-lfs.github.com/
[ack]: https://github.com/petdance/ack2/tree/2.15_02
[file-next]: https://github.com/petdance/file-next/tree/1.12
[msys2]: https://msys2.github.io
[caps]: https://gist.github.com/simnalamburt/90965dcb09cec6b82320/raw/58a9f61143273d5226be352d2c29ecf738e5bffd/capslock-to-control.reg
[Consolas for Powerline]: https://gist.github.com/simnalamburt/90965dcb09cec6b82320/raw/58a9f61143273d5226be352d2c29ecf738e5bffd/consola.ttf
[fzf]: https://github.com/junegunn/fzf
