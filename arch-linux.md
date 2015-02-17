Arch Linux
========

[pacman][]           | 설명
---------------------|--------
`# pacman -S <name>` | 패키지 설치
`# pacman -R <name>` | 패키지 제거
`# pacman -Sy`       |
`# pacman -Syy`      |
`# pacman -Syu`      |

[pacman]: https://wiki.archlinux.org/index.php/Pacman

### Installation

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
    PasswordAuthentication no
    PermitRootLogin no
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

### pacman

* sudo, grub, os-prober
* dialog, wpa_supplicant *(for wiki-menu)*
* bash-completion
* openssh
* vim, git, zsh
