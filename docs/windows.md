Windows
========
### A. Softwares
- FF, Chrome, 구글 행아웃 플러그인
- gVim, MS Office, Adobe CC, VS 2015
- Android Studio, Tizen Studio
- MPC-HC
- [wsltty]


### B. Windows Subsystem for Linux
#### *Removed* `apt`
- byobu snapd

#### `apt`
- mosh git htop traceroute
- zsh (with zplug)
- libsqlite3-dev

#### `apt` PPA
- [python3.6 python3.6-venv](https://launchpad.net/~fkrull/+archive/ubuntu/deadsnakes)
- [ruby2.4 ruby2.4-dev](https://www.brightbox.com/docs/ruby/ubuntu/) ([bundler])
- [nodejs](https://nodejs.org/en/download/package-manager/)
- [yarn](https://yarnpkg.com/en/docs/install#linux-tab)

### etc in the user space
- [`rustup` and Rust toolchains](https://www.rust-lang.org)
- [tpm](https://github.com/tmux-plugins/tpm)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [zplug](https://github.com/zplug/zplug)

### etc in `/usr/local/bin`
- [ripgrep]

<br>

Setup note
========

### A. Basic customization
1.  Remap [Caps Lock &rarr; Control][caps]
1.  Install [Consolas for Powerline]
1.  [Disable snap assistant](http://i.imgur.com/0O4BgFW.png)

<br>

### B. Setup Windows Subsystem for Linux
1.  Update your Windows to the latest one.

    Ensure that you've downloaded the Windows 10 **Creators** Update to get Ubuntu 16.04 LTS.

2.  [Enable Windows Subsystem for Linux.](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide)

3.  Install [wsltty].

4.  Place or symlink your `.minttyrc` to `%APPDATA%\mintty\config`.

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

10. If you're using zsh and mosh shell completion doesn't work, add the line
    below to your zsh profile.

    ```zsh
    compdef mosh=ssh
    ```

**NOTE**: Do not try to run haskell program (e.g. [chips], [stack], etc) in WSL.
Since GHC 8.0.1, haskell binaries require 1TB of virtual memory. With most
modern generalised operating systems, it's completely OK because of [memory
overcommitment] but Windows Subsystem for Linux does not support this yet. You
need to build your own GHC binary with a [`--disable-large-address-space`]
configure option to workaround this problem.

[chips]: https://github.com/xtendo-org/chips
[stack]: https://www.haskellstack.org
[memory overcommitment]: https://en.wikipedia.org/wiki/Memory_overcommitment
[`--disable-large-address-space`]: https://ghc.haskell.org/trac/ghc/ticket/10791

###### References
- [Microsoft/BashOnWindows#1671](https://github.com/Microsoft/BashOnWindows/issues/1671)

<br>

[wsltty]: https://github.com/mintty/wsltty
[bundler]: https://bundler.io/
[ripgrep]: https://github.com/BurntSushi/ripgrep
[caps]: https://gist.github.com/simnalamburt/90965dcb09cec6b82320/raw/58a9f61143273d5226be352d2c29ecf738e5bffd/capslock-to-control.reg
[Consolas for Powerline]: https://gist.github.com/simnalamburt/90965dcb09cec6b82320/raw/58a9f61143273d5226be352d2c29ecf738e5bffd/consola.ttf
[`umask`]: http://man7.org/linux/man-pages/man2/umask.2.html
