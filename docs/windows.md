Setup note
========
### A. Basic customization
1.  Remap [Caps Lock &rarr; Control][caps]
1.  Install [Consolas for Powerline]
1.  [Disable snap assistant](http://i.imgur.com/0O4BgFW.png)

<br>

### B. Setup Windows Subsystem for Linux
1.  Update your Windows to the latest one. Make sure that you're using Windows
    build 16215 or later, so that you can install latest WSL via Windows Store.

    Otherwise, you'll get WSL with outdated Ubuntu 14.04 even if you succeed.

1.  [Install WSL.](https://docs.microsoft.com/en-us/windows/wsl/install-win10)

1.  Edit `/etc/profile`, `/etc/bashrc`, or `/etc/bash.bashrc` and uncomment or add the line below:

    ```bash
    umask 022
    ```

1.  Install [wsltty].

1.  Place or symlink your `.minttyrc` to `%APPDATA%\mintty\config`.

1.  Install packages.

1.  Change the default shell and override `$SHELL` environment variable.

    ```bash
    chsh -s /bin/zsh
    ```

    ```zsh
    # In '.zshrc' or somewhere
    SHELL=/bin/zsh

    # Reference https://github.com/Microsoft/BashOnWindows/issues/846#issuecomment-242910947
    ```

1.  If you're going to use **zsh**, create `~/.zshenv` and add the lines below:

    ```zsh
    # See https://github.com/Microsoft/BashOnWindows/issues/1887
    unsetopt BG_NICE
    ```

**NOTE**: Do not try to run haskell program (e.g. [chips], [stack], etc) in WSL.
Since GHC 8.0.1, haskell binaries require 1TB of virtual memory. With most
modern generalised operating systems, it's completely OK because of [memory
overcommitment] but Windows Subsystem for Linux does not support this yet. You
need to build your own GHC binary with a [`--disable-large-address-space`]
configure option to workaround this problem. This problem will be fixed in
Windows build 17063.

###### References
- [Microsoft/BashOnWindows#1671](https://github.com/Microsoft/BashOnWindows/issues/1671)

[chips]: https://github.com/xtendo-org/chips
[stack]: https://www.haskellstack.org
[memory overcommitment]: https://en.wikipedia.org/wiki/Memory_overcommitment
[`--disable-large-address-space`]: https://ghc.haskell.org/trac/ghc/ticket/10791
[wsltty]: https://github.com/mintty/wsltty
[bundler]: https://bundler.io/
[ripgrep]: https://github.com/BurntSushi/ripgrep
[caps]: https://gist.github.com/simnalamburt/90965dcb09cec6b82320/raw/58a9f61143273d5226be352d2c29ecf738e5bffd/capslock-to-control.reg
[Consolas for Powerline]: https://gist.github.com/simnalamburt/90965dcb09cec6b82320/raw/58a9f61143273d5226be352d2c29ecf738e5bffd/consola.ttf
[`umask`]: http://man7.org/linux/man-pages/man2/umask.2.html
