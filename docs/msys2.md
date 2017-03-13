[msys2]
========
#### `pacman`
- git svn vim tar zip unzip mosh
- winpty msys2-launcher
- mingw-w64-x86_64-gcc base-devel
- python2

#### `.msi`
- FF, Chrome
- gVim, MS Office, Adobe CC, VS 2015
- Android Studio, Tizen Studio
- [Rust][] [Node.js][] [Go][]
- [git-lfs]

<br>

How to Install
--------
1.  Remap [Caps Lock &rarr; Control][caps]
1.  Install [Consolas for Powerline]
1.  [Disable snap assistant](http://i.imgur.com/0O4BgFW.png)
1.  Install **[msys2]**
1.  Install packages
1.  Edit `/msys2.ini`, `/mingw32.ini` and `/mingw64.ini`

    ```ini
    MSYS=winsymlinks:nativestrict
    MSYS2_PATH_TYPE=inherit
    SHELL=/usr/bin/zsh
    # ...
    ```

1.  Clone [dotfiles](../README.md)
1.  Execute `zplug install`

Setup [GCMW] for msys2
--------
1.  Download [latest GCMW]. Please download `gcmw-VERSION.zip` and unzip it.
2.  Copy all EXEs and DLLs into the `/usr/lib/git-core/` directory.
3.  Update the git configs.

    ```bash
    git config --global credential.helper manager
    ```

###### References
- https://github.com/Microsoft/Git-Credential-Manager-for-Windows/issues/146#issuecomment-211944606
- [git-credential-manager for Windows を入れて認証を省略](http://qiita.com/ymdymd/items/9c90e060de1c4393e6fa#git-credential-manager-for-windows-%E3%82%92%E5%85%A5%E3%82%8C%E3%81%A6%E8%AA%8D%E8%A8%BC%E3%82%92%E7%9C%81%E7%95%A5)

[Rust]: https://www.rust-lang.org/
[Node.js]: https://nodejs.org/
[Go]: https://golang.org/
[git-lfs]: https://git-lfs.github.com/
[ack]: https://github.com/petdance/ack2/tree/2.15_02
[file-next]: https://github.com/petdance/file-next/tree/1.12
[msys2]: https://msys2.github.io
[caps]: https://gist.github.com/simnalamburt/90965dcb09cec6b82320/raw/58a9f61143273d5226be352d2c29ecf738e5bffd/capslock-to-control.reg
[Consolas for Powerline]: https://gist.github.com/simnalamburt/90965dcb09cec6b82320/raw/58a9f61143273d5226be352d2c29ecf738e5bffd/consola.ttf
[fzf]: https://github.com/junegunn/fzf
[GCMW]: https://github.com/Microsoft/Git-Credential-Manager-for-Windows
[latest GCMW]: https://github.com/Microsoft/Git-Credential-Manager-for-Windows/releases/latest
