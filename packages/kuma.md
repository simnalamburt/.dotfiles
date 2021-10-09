kuma
========
[Arch Linux](https://archlinux.org/)

### `pacman`
CLI:

- base linux linux-firmware grub
- sudo iwd
- base-devel openssh htop man zip unzip
- neovim git zsh fd ripgrep fzf fuse2 watchexec lsd bat jq git-delta
- python nodejs yarn go
- terraform

Desktop Environment:

- noto-fonts-extra noto-fonts-cjk noto-fonts-emoji ttf-nerd-fonts-symbols-mono
- mesa libva-intel-driver libva-mesa-driver
- arc-gtk-theme qt5-wayland
- purseaudio brightnessctl
- libnotify

Applications:

- sway swayidle swaylock alacritty wl-clipboard i3status-rust grim wf-recorder slurp mako
- pavucontrol iwgtk swappy
- firefox

### `pacman` (AUR)
- paru-bin
- sirula-git
- kime-bin

### `pacman` (Manual)
- [nouveau-fw-340.108-1](https://github.com/simnalamburt/PKGBUILD/tree/main/nouveau-fw)

### `rustup`
- stable: rust-src rls rust-analysis

### `/usr/local/bin`
- aws
- aws-mfa

&nbsp;

TODOs
--------
하드웨어가 너무 낡아서인지, 블루투스 드라이버랑 CPU 온도 모니터가 똑바로
동작하지 않는다. 리눅스 커널이 지원하지 않는 장치를 쓰고있는것인지도 모른다.

- wf-recorder
  - https://wiki.archlinux.org/index.php/PipeWire#WebRTC_screen_sharing
  - https://wiki.archlinux.org/index.php/Screen_capture#Wayland
  - https://mozilla.github.io/webrtc-landing/gum_test.html
- Wine + Kakaotalk
- Steam Proton
- [greetd](https://git.sr.ht/~kennylevinsen/greetd)
- Bluetooth
- CPU temp monitor
