Arch Linux
========

### 부팅미디어에서 할 일
```bash
ls /sys/firmware/efi/efivars              # EFI로 부팅했는지 체크

iwctl                                     # 와이파이 체크
ping google.com -c20                      # 인터넷 연결

timedatectl set-ntp true                  # systemd-timesyncd를 사용하여 동기화하도록 설정

cfdisk /dev/sda                           # 디스크 파티셔닝

mkfs.ext4 /dev/sda1                       # 파티션 포맷 (ext4)
mount /dev/sda1 /mnt                      # 파티션 마운트

vim /etc/pacman.d/mirrorlist              # 빠른 한국 미러 세팅
pacstrap /mnt base linux linux-firmware   # 설치

genfstab -U /mnt >> /mnt/etc/fstab        # /etc/fstab 생성
arch-chroot /mnt                          # 가자 디지몬 세상으로



# Timezone 설정
ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
hwclock --systohc

# Locale 설정
cat <<<'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
cat <<<'LANG=en_US.UTF-8' > /etc/locale.conf
export LANG=en_US.UTF-8

# 이름 설정
cat <<<'PC_NAME' > /etc/hostname  # 컴터 이름설정
cat <<'EOF' >> /etc/hosts
127.0.0.1 localhost
::1 localhost
127.0.1.1 PC_NAME.localdomain PC_NAME
EOF

# 새 유저 생성, 루트 잠그기
pacman -S sudo
useradd -mG wheel simnalamburt
passwd simnalamburt
EDITOR=nvim visudo # 특정 라인 주석해제
passwd root -dl

# 파티셔닝 했던 방식에 맞춰 grub을 설정해줘야 한다. 이하는 예시
#
# Reference:
#   https://wiki.archlinux.org/index.php/GRUB
pacman -S grub
sed -i 's/GRUB_TIMEOUT=[0-9]*/GRUB_TIMEOUT=1/' /etc/default/grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# 텍스트 에디터와 와이파이같은 인터넷 관련 소프트웨어는 지금 설치해야함. 예:
pacman -S neovim iwd
systemctl enable iwd



# 설치 끝
exit
umount -R /mnt
systemctl poweroff
```

### [전원버튼 동작 설정하기](http://unix.stackexchange.com/a/52645)
```bash
sudo vim /etc/systemd/login.conf
# HandlePowerKey=ignore
# HandleSuspendKey=ignore
# HandleHibernateKey=ignore
# HandleLidSwitch=ignore
# HandleLidSwitchExternalPower=ignore
# HandleLidSwitchDocked=ignore
# HandleRebootKey=ignore
sudo systemctl restart systemd-logind
```

###### References
- [Archlinux wiki tutorial](https://wiki.archlinux.org/index.php/Installation_guide)
