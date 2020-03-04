Arch Linux
========

### 부팅미디어에서 할 일
```bash
wifi-menu                             # 와이파이 체크
ping google.com -c20                  # 인터넷 연결

timedatectl set-ntp true              # systemd-timesyncd를 사용하여 동기화하도록 설정
                                      # https://wiki.archlinux.org/index.php/systemd-timesyncd

gdisk /dev/sda                        # GPT로 만들고싶으면 사용

cfdisk /dev/sda                       # 디스크 파티셔닝 (MBR)
cgdisk /dev/sda                       # 디스크 파티셔닝 (GPT)
# BIOS/GPT 조합일경우 BIOS boot partition 만들기

mkfs.ext4 /dev/sda1                   # 파티션 포맷 (ext4)
mount /dev/sda1 /mnt                  # 파티션 마운트

mkfs.btrfs /dev/sda1                  # 파티션 포맷 (btrfs)
mount -o compress=lzo /dev/sda1 /mnt  # 파티션 마운트

mkswap /dev/sda2                      # 파티션 포맷 (swap)
swapon /dev/sda2                      # 스왑 파티션 마운트

vim /etc/pacman.d/mirrorlist          # 미러 우선순위 변경
pacstrap /mnt base grub sudo openssh  # Install Archlinux

genfstab -U /mnt >> /mnt/etc/fstab    # /etc/fstab 생성
arch-chroot /mnt /bin/bash            # 가자 디지몬 세상으로
```

### 설치 직후의 아치 안에서 할 일
```bash
# Timezone 설정
ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
hwclock --systohc

# Locale 설정
cat >> /etc/locale.gen <<END
en_US.UTF-8 UTF-8
ko_KR.UTF-8 UTF-8
END
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8

# 이름 설정
echo 'PC_NAME' > /etc/hostname  # 컴터 이름설정
cat >> /etc/hosts <<END
127.0.1.1	PC_NAME.localdomain	PC_NAME
END

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
systemctl enable sshd

sudo -u simnalamburt bash -c \
  "curl -fLo ~/.ssh/authorized_keys --create-dirs https://github.com/simnalamburt.keys"

exit
umount -R /mnt
```

### [전원버튼 동작 설정하기](http://unix.stackexchange.com/a/52645)
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
