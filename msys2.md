MSYS2
========

[Mintty][]                  | 설명
----------------------------|------------------
`Ctrl`  + `Insert`          | GUI 복사
`Shirt` + `Insert`          | GUI 붙여넣기
echi 'hi' > /dev/clipboard  | CLI 복사
cat /dev/clipboard          | CLI 붙여넣기
`Alt` + `F2`                | 새 Mintty
`Alt` + `Enter`             | 전체화면
`Win` + `←`                 | 왼쪽 반
`Win` + `→`                 | 오른쪽 반
`Ctrl` + `Tab`              | Mintty 전환 (앞)
`Ctrl` + `Shift` + `Tab`    | Mintty 전환 (뒤)

[Mintty]: http://mintty.googlecode.com/svn-history/r1065/trunk/docs/mintty.1.html#20

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
    # Replace /usr/bin/bash into /usr/bin/zsh
    ```
    ```sh
    vim /etc/profile
    # Add "SHELL=`which zsh`" line below "PS1='(%n@%m)[%h] %~ %% '" line.
    ```

1.  Enable symlink [(reference)][symlink]

    ```sh
    vim /msys2_shell.bat
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

### pacman

* git, vim, zsh
* wget, tar, zip
* ca-certificates
* python2
