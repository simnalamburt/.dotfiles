Windows
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

Installation
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

1.  Install [**Babun**](http://babun.github.io)

1.  git

    ```bash
    git config --global user.name "Your Name"
    git config --global user.email you@example.com
    ```

1.  **Hotfix** for babun; Fix `babun-core`

    ```bash
    cd /usr/local/etc/babun/source/babun-core/tools
    grhh

    echo '' > git.sh
    gca -m "Hotfix 1: don't change push.default config"

    chmod +x welcome.sh
    gca -m "Hotfix 2: chmod +x welcome.sh"
    ```

1.  **Hotfix** for cygwin; Change the primary group of the users from `None` into `Users`

    ```bash
    cat /etc/group | egrep '^Users:' | cut -f3 -d':'
    vim /etc/passwd
    # 4번째 필드 (primary group) 수정

    chgrp Users -R ~
    chmod g-w -R ~
    ```

    Reference: http://stackoverflow.com/a/13755101

1.  Configuration

    ```bash
    cd ~

    # upgrade git (http://stackoverflow.com/a/25547715)
    pact remove git && pact install git

    # remove unused files
    rm .bash* .profile /etc/vimrc

    # workspace
    ln -s '/cygdrive/c/Users/Hyeon/Google 드라이브' ~/drive
    mkdir ~/workspace
    ```

1.  Import [**dotfiles**](https://github.com/simnalamburt/dotfiles)

1.  Import `id_rsa` to `~/.ssh` and `chmod 400` it
