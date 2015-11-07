OS X
--------
1.  설치
    * Apple ID 생성, iTunes로 계정 활성화
    * iTunes로 카드번호 입력해놓기
    * OS 업데이트
1.  Configuration
    * 키 반복속도, 마우스 속도, 트랙패드 설정 변경
    * Finder 초기 디렉토리 경로 변경
    * Caps Lock → Command Key
1.  iTerm2 설정
    * [Access for assistive device](http://www.tekrevue.com/how-to-enable-access-for-assistive-devices-in-os-x-mavericks/)
    * Left Command Key          → Ctrl
    * Option Key                → +Esc
    * Alt + Enter               → Toggle Fullscren
    * Command + (Space, Enter)  → Do not remap Modifier
    * Cmd + (-, \)              → Split pane horizontal, vertical
    * 쓰지않는 단축키 삭제

Arch Linux
--------
1.  Install Arch Linux
    * [linuxveda tutorial](http://www.linuxveda.com/2014/06/07/arch-linux-tutorial)
    * [Archlinux wiki tutorial](https://wiki.archlinux.org/index.php/Installation_guide)

    ```sh
    # 인터넷 연결
    wifi-menu

    # 디스크 파티셔닝
    fdisk /dev/sda

    # 파티션 포맷
    mkfs.ext4 /dev/sda1

    # 파티션 마운트
    mount /dev/sda1 /mnt

    # 미러 우선순위 변경
    vim /etc/pacman.d/mirrorlist

    # Install Archlinux
    pacstrap /mnt base
    genfstab -p /mnt >> /mnt/etc/fstab
    arch-chroot /mnt

    # hostname
    echo 'rilakkuma' > /etc/hostname

    # Timezone
    ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

    # Locale
    nano /etc/locale.gen
    locale-gen
    echo LANG=en_US.UTF-8 > /etc/locale.conf
    export LANG=en_US.UTF-8

    # Grub
    pacman -S grub
    grub-install --recheck /dev/sda
    grub-mkconfig -o /boot/grub/grub.cfg

    # New user
    useradd -m -G wheel -s /bin/bash simnalamburt
    passwd simnalamburt
    passwd root -dl
    pacman -S sudo
    EDITOR=nano visudo # 특정 라인 주석해제

    # Gnome desktop environment
    pacman -S gnome xf86-input-synaptics
    systemctl enable gdm
    systemctl enable NetworkManager

    exit
    umount -R /mnt
    ```

1.  Grub 대기시간 줄이기

    ```
    # /etc/default/grub
    GRUB_TIMEOUT=1
    ```
    ```sh
    grub-mkconfig -o /boot/grub/grub.cfg
    ```

1.  Clone [dotfiles](https://github.com/simnalamburt/dotfiles), symlink those to `/root`
1.  [Configure `ssh`](https://wiki.archlinux.org/index.php/Secure_Shell)

    ```sh
    sudo systemctl start sshd
    sudo systemctl enable sshd
    ```
    ```
    # /etc/ssh/sshd_config
    PermitRootLogin no
    PasswordAuthentication no
    PrintLastLog no
    ```

1.  [Install Yaourt](https://archlinux.fr/yaourt-en)

1.  *(optional)* [Disable lid sleep](http://unix.stackexchange.com/a/52645)

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

1.  Install packages.
1.  Open `/msys2_shell.bat`

    1. Add `set LANG=ko_KR.UTF-8`.
    1. Enable [symlink][].
    1. Replace `/usr/bin/bash` into `/usr/bin/zsh`.

1.  Open `/etc/profile`, Add "SHELL=`which zsh`" line below "PS1='(%n@%m)[%h] %~ %% '" line.
1.  Clone [dotfiles](https://github.com/simnalamburt/dotfiles).
1.  Invoke zgen, and fix symlinks of the plugins manually.

[SourceForge]: http://sourceforge.net/projects/msys2/files/REPOS/MSYS2/x86_64
[pacman-fail]: http://qiita.com/k-takata/items/fcb2f1f9ca564fd78597
[symlink]: http://sourceforge.net/p/msys2/mailman/message/33004178/
