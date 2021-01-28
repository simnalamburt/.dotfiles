Arch Linux
========
```bash
#
# 이하는 부팅미디어에서 할 일들
#

# EFI로 부팅했는지 체크
ls /sys/firmware/efi/efivars

# 인터넷 연결 및 NTP 활성화
iwctl
ping google.com -c20
timedatectl set-ntp true

# 디스크 파티셔닝
cfdisk /dev/sda
# 파티션 포맷 및 마운트 (ext4 예제)
mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt

# 빠른 미러 세팅 및 설치
# 한국에선 <https://mirror.premi.st/archlinux/> 가 제일 쓸만함
vim /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware

# /etc/fstab 생성
genfstab -U /mnt >> /mnt/etc/fstab

# 디스크 안으로 진입
arch-chroot /mnt



#
# 이하는 arch-chroot 안에서 할 일
#

# Timezone 설정 및 시간 동기화
ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
hwclock --systohc

# Locale 설정
cat <<<'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
cat <<<'LANG=en_US.UTF-8' > /etc/locale.conf
export LANG=en_US.UTF-8

# hostname 설정
cat <<<'PC_NAME' > /etc/hostname
cat <<'EOF' >> /etc/hosts
127.0.0.1 localhost
::1 localhost
127.0.1.1 PC_NAME.localdomain PC_NAME
EOF

# 루트 계정 비밀번호 설정
passwd

# 파티셔닝 했던 방식에 맞춰 grub을 설정해줘야 한다. 이하는 예시. EFI 시스템의
# 경우 grub을 쓰지 않아도 된다.
#
# Reference:
#   https://wiki.archlinux.org/index.php/GRUB
pacman -S grub
sed -i 's/GRUB_TIMEOUT=[0-9]*/GRUB_TIMEOUT=1/' /etc/default/grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# 네트워크 설정을 지금 마쳐야함. iwd 예시:
pacman -S iwd
cat > /etc/systemd/network/25-wireless.network <<'EOF'
[Match]
Name=wlan0

[Network]
DHCP=yes
EOF
cat > /etc/iwd/main.conf <<'EOF'
[Network]
NameResolvingService=systemd
EOF
# Reference: https://man.archlinux.org/man/systemd-resolved.8#/ETC/RESOLV.CONF
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
systemctl enable iwd systemd-networkd systemd-resolved

# 텍스트에디터 최소 한개 필요함
pacman -S neovim

# 설치 끝
exit



# 부팅미디어 종료
umount -R /mnt
systemctl poweroff
```

### 설치 이후에 해도 되는 일들
```bash
# Create 4GiB swap
dd if=/dev/zero of=/swapfile bs=1M count=4096 status=progress
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
cat <<< '/swapfile none swap defaults 0 0' >> /etc/fstab


# sudo 설치, 새 유저 생성 및 루트 잠그기
pacman -S sudo
useradd -mG wheel simnalamburt
passwd simnalamburt
EDITOR=nvim visudo # 특정 라인 주석해제
passwd root -dl


# GPU 확인
lspci
# 적절히 드라이버 깔아주기
sudo pacman -S mesa
sudo nvim /etc/mkinitcpio.conf
# MODULES="... nouveau ..."
sudo mkinitcpio -p linux


# pacman, paru, makepkg
sudo nvim /etc/pacman.conf
# Uncomment `Color` under `[options]`
# (pacman 6 사용중일경우) Add `ParallelDownloads = 10` under `[options]`
sudo nvim /etc/paru.conf
# Uncomment `RemoveMake` under `[options]`
sudo nvim /etc/makepkg.conf
# MAKEFLAGS="-j8"
# COMPRESSZST=(zstd -c -z -q -15 -)
# PKGEXT='.pkg.tar.zst'


# Find UUID of swap device to "resume" and the number of "resume_offset"
findmnt -no UUID -T /swapfile
sudo filefrag -v /swapfile | awk '{ if($1=="0:"){print substr($4, 1, length($4)-2)} }'
sudo nvim /etc/default/grub
# Update GRUB_CMDLINE_LINUX_DEFAULT_DEFAULT: "resume=UUID=... resume_offset=... "
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo nvim /etc/mkinitcpio.conf
# Update HOOKS, place "resume" after "udev" and "lvm2"
sudo mkinitcpio -p linux


# 전원버튼 동작 설정하기 (ignore, poweroff, reboot, halt, kexec, suspend,
# hibernate, hybrid-sleep, suspend-then-hibernate, lock)
#
# Reference:
#   man 5 logind.conf
#   http://unix.stackexchange.com/a/52645
sudo nvim /etc/systemd/login.conf
#HandlePowerKey=hybrid-sleep
#HandleSuspendKey=hybrid-sleep
#HandleHibernateKey=hybrid-sleep
#HandleLidSwitch=hybrid-sleep
#HandleLidSwitchExternalPower=hybrid-sleep
#HandleLidSwitchDocked=hybrid-sleep
sudo systemctl restart systemd-logind
```

###### References
- [Archlinux wiki tutorial](https://wiki.archlinux.org/index.php/Installation_guide)
