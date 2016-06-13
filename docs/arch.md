kuma.hyeon.me
--------
### `pacman`
- base grub sudo openssh *(리눅스 기본)*
- base-devel binutils
- mosh git tmux fish wget upx zip the_silver_searcher *(필수 툴)*
- neovim python2-neovim python-neovim
- htop *(서버 관리도구)*
- clang rust ruby python python2 nodejs npm *(언어)*
- nginx certbot certbot-nginx *(서비스)*
- keybase weechat

> *TODO*
>
> ### `pacman`
> - stack
>
> ### AUR
> - [nullidentdmod][irc] *(Enable & Start `nullidentdmod.socket` with systemctl)*
> - libtinfo *([Required by stack][libtinfo])*
>
> #### nginx
> - DHE 끄기 ([Logjam Attack](https://weakdh.org))
> - [HSTS](https://scotthelme.co.uk/setting-up-hsts-in-nginx) 강제하기

[irc]: https://wiki.archlinux.org/index.php/Identd_Setup
[libtinfo]: https://github.com/commercialhaskell/stack/issues/1012

<br>

--------

<br>

How to Install
--------
부팅미디어에서 할 일
```bash
wifi-menu                             # 인터넷 연결
ping google.com -c20

timedatectl set-ntp true              # 시계 업데이트

cfdisk /dev/sda                       # 디스크 파티셔닝
mkfs.ext4 /dev/sda1                   # 파티션 포맷 (ext4)
mkswap /dev/sda2                      # 파티션 포맷 (swap)
swapon /dev/sda2                      # 스왑 활성화
mount /dev/sda1 /mnt                  # 파티션 마운트

vim /etc/pacman.d/mirrorlist          # 미러 우선순위 변경
pacstrap /mnt base grub sudo openssh  # Install Archlinux
genfstab -p /mnt >> /mnt/etc/fstab
echo '<PC_NAME>' > /mnt/etc/hostname  # 컴터 이름설정
arch-chroot /mnt /bin/bash            # 가자 디지몬 세상으로
```

설치 직후의 아치 안에서 할 일
```bash
# Timezone 설정
ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# Locale 설정
cat >> /etc/locale.gen <<END
en_US.UTF-8 UTF-8
ko_KR.UTF-8 UTF-8
END
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8

# Grub 설치, grub 대기시간 줄이기
grub-install --recheck /dev/sda
sed -i 's/GRUB_TIMEOUT=[0-9]*/GRUB_TIMEOUT=1/' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

# 새 유저 생성, 루트 잠그기
useradd -m -G wheel -s /bin/bash simnalamburt
passwd simnalamburt
EDITOR=nano visudo # 특정 라인 주석해제
passwd root -dl

# ssh 설정
nano /etc/ssh/sshd_config
  # PasswordAuthentication no
systemctl enable sshd

# DHCP 이너넷 설정 (그놈 쓸경우 하지마셈)
cat > /etc/systemd/network/20-dhcp.network <<END
[Match]
Name=en*

[Network]
DHCP=ipv4
END
systemctl enable systemd-networkd.service
# DHCP DNS 설정
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
systemctl enable systemd-resolved.service

exit
umount -R /mnt
```

[전원버튼 동작 설정하기](http://unix.stackexchange.com/a/52645)
```bash
sudo vim /etc/systemd/login.conf
  # HandlePowerKey=ignore
  # HandleSuspendKey=ignore
  # HandleHibernateKey=ignore
  # HandleLidSwitch=ignore
sudo systemctl restart systemd-logind
```

###### References
- [linuxveda tutorial](http://www.linuxveda.com/2014/06/07/arch-linux-tutorial)
- [Archlinux wiki tutorial](https://wiki.archlinux.org/index.php/Installation_guide)
