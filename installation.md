OS X
--------
1.  Apple ID
    * Apple ID 생성, iTunes로 계정 활성화
    * iTunes로 카드번호 입력해놓기
1.  Upgrade OS
1.  Configure Mac
    * 키 반복속도, 마우스 속도, 트랙패드 설정 변경
    * Finder 초기 디렉토리 경로 변경
    * Caps Lock → Command Key
1.  iTerm2 설정
    * [Solarized](https://github.com/altercation/solarized/blob/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors)
    * [Access for assistive device](http://www.tekrevue.com/how-to-enable-access-for-assistive-devices-in-os-x-mavericks/)
    * Left Command Key          → Ctrl
    * Option Key                → +Esc
    * Alt + Enter               → Toggle Fullscren
    * Command + (Space, Enter)  → Do not remap Modifier
    * Cmd + (-, \)              → Split pane horizontal, vertical
    * 쓰지않는 단축키 삭제

Arch Linux
--------
1.  [Install Arch Linux](http://www.linuxveda.com/2014/06/07/arch-linux-tutorial)
1.  `sudo usermod -p '!' root`
1.  Clone [dotfiles](https://github.com/simnalamburt/dotfiles), symlink those to `/root`
1.  `vim +PlugInstall`
1.  Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh), customize it
1.  [Configure `ssh`](https://wiki.archlinux.org/index.php/Secure_Shell)

    ```sh
    sudo systemctl start sshd.service
    sudo systemctl enable sshd.service
    ```

    ```
    # /etc/ssh/sshd_config
    PermitRootLogin no
    PasswordAuthentication no
    PrintLastLog no
    ```

1.  [Disable lid sleep](http://unix.stackexchange.com/a/52645)

    ```
    # /etc/systemd/login.conf
    HandlePowerKey=ignore
    HandleSuspendKey=ignore
    HandleHibernateKey=ignore
    HandleLidSwitch=ignore
    ```

    ```sh
    sudo systemctl restart systemd-logind
    ```

MSYS2
--------
1.  Install [**Powerlined Consolas**](https://github.com/nicolalamacchia/powerline-consolas)
1.  Change the `Caps Lock` key into a `Ctrl` Key

    Find `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout`

    Create a new binary key named `Scancode Map` with the hex values below:

    ```
    0000   00 00 00 00 00 00 00 00   ........
    0008   02 00 00 00 1D 00 3D 00   ......:.
    0010   00 00 00 00               ....
    ```

1.  [Install msys2](http://msys2.github.io).

    If `pacman` fails, download it from [SourceForge][] [(reference)][pacman-fail].

1.  Use `zsh` as default shell [(reference)][chsh].

    ```sh
    vim /msys2_shell.bat
    vim /mingw64_shell.bat
    # Replace /usr/bin/bash into /usr/bin/zsh
    ```
    ```sh
    vim /etc/profile
    # Add "SHELL=`which zsh`" line below "PS1='(%n@%m)[%h] %~ %% '" line.
    ```

1.  Enable symlink [(reference)][symlink]

    ```sh
    vim /msys2_shell.bat
    vim /mingw64_shell.bat
    # Find 'symlink'
    ```

1.  Clone [dotfiles](https://github.com/simnalamburt/dotfiles).
1.  Install vim plugins [(reference)][ca-cert].

    ```sh
    pacman -S ca-certificates python2
    vim +PlugInstall
    ```

[SourceForge]: http://sourceforge.net/projects/msys2/files/REPOS/MSYS2/x86_64
[pacman-fail]: http://qiita.com/k-takata/items/fcb2f1f9ca564fd78597
[chsh]: http://qiita.com/magichan/items/7702d7865deaaca2ad44
[ca-cert]: http://qiita.com/7shi/items/894fdd849658880bf6c9
[symlink]: http://sourceforge.net/p/msys2/mailman/message/33004178/
