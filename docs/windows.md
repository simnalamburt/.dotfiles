Windows
========

### A. Softwares
- FF, Chrome, 구글 행아웃 플러그인
- gVim, MS Office, Adobe CC, VS 2015
- Android Studio, Tizen Studio
- [wsltty]

### B. Windows Subsystem for Linux
#### *Removed* `apt`
- byobu

#### `apt`
- mosh fish git htop
- zsh (with zplug)

#### `apt` PPA
- [nodejs](https://nodejs.org/en/download/package-manager/)
- [yarn](https://yarnpkg.com/en/docs/install#linux-tab)

### etc
- [stack] *(Haskell development)*
- [ripgrep]

### C. [msys2], using `pacman`
- git svn vim tar zip unzip mosh
- winpty msys2-launcher
- mingw-w64-x86_64-gcc base-devel
- python2

<br>

How to Install
--------
1.  Remap [Caps Lock &rarr; Control][caps]
1.  Install [Consolas for Powerline]
1.  [Disable snap assistant](http://i.imgur.com/0O4BgFW.png)

Setup Windows Subsystem for Linux
--------
1.  Update your Windows to the latest one.

    Ensure that you've downloaded the Windows 10 **Creators** Update to get Ubuntu 16.04 LTS.

2.  [Enable Windows Subsystem for Linux.](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide)

3.  Install [wsltty].

4.  Place your `.minttyrc` to `%APPDATA%\mintty\config`.

5.  Install packages.

6.  Copy "WSL Bash ~ in Mintty" shortcut file into "WSL **Fish** ~ in Mintty"
    (or zsh) and change its content like below:

    ```
    %LOCALAPPDATA%\wsltty\bin\mintty.exe --wsl -o Locale=C -o Charset=UTF-8 /bin/wslbridge -C~ -t /usr/bin/fish
    ```

    You'll want to pin it to your taskbar.

7.  Default WSL doesn't give you a proper [`umask`] setting. Add the lines below
    to your shell profile.

    ```bash
    # bash
    if [ "$(umask)" = '0000' ]; then umask 022; fi
    ```
    ```zsh
    # zsh
    if [ "$(umask)" = '000' ]; then umask 022; fi
    ```
    ```fish
    # fish
    if [ (umask) = "0000" ]; umask 022; end
    ```

8.  Add the lines below to your shell profile (`.bashrc`, `.zshrc`, etc) to
    override `$SHELL` environment variable.

    ```zsh
    # See https://github.com/Microsoft/BashOnWindows/issues/846#issuecomment-242910947
    SHELL=/usr/bin/zsh
    ```

9.  If you're going to use **zsh**, create `~/.zshenv` and add the lines below:

    ```zsh
    # See https://github.com/Microsoft/BashOnWindows/issues/1887
    unsetopt BG_NICE
    ```

How to install [msys2]
--------
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

[wsltty]: https://github.com/mintty/wsltty
[msys2]: https://msys2.github.io
[stack]: https://haskell-lang.org/get-started/linux
[ripgrep]: https://github.com/BurntSushi/ripgrep
[caps]: https://gist.github.com/simnalamburt/90965dcb09cec6b82320/raw/58a9f61143273d5226be352d2c29ecf738e5bffd/capslock-to-control.reg
[Consolas for Powerline]: https://gist.github.com/simnalamburt/90965dcb09cec6b82320/raw/58a9f61143273d5226be352d2c29ecf738e5bffd/consola.ttf
[GCMW]: https://github.com/Microsoft/Git-Credential-Manager-for-Windows
[latest GCMW]: https://github.com/Microsoft/Git-Credential-Manager-for-Windows/releases/latest
[`umask`]: http://man7.org/linux/man-pages/man2/umask.2.html
