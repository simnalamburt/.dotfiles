LG Gram 2-in-1, WSL 2
========
Debian Buster

### `apt`
- apt-transport-https build-essential lsb-release
- htop man curl wget zip unzip watch entr
- git zsh tmux fd-find ripgrep fzf fuse
- python3-venv openjdk-11-jre-headless

### `apt` PPA
- nodejs (nodesource.com, v15.x)
- yarn (v1.x)

### `apt` using `.deb`
- scala (<https://www.scala-lang.org/download/>)

### `rustup`
- stable: rust-src clippy

### `cargo install`
- lsd bat git-delta

### `/usr/local/bin`
- nvim.appimage (v0.4.4)

  ```bash
  sudo update-alternatives --install /usr/bin/vim vim /usr/local/bin/nvim.appimage 110
  sudo update-alternatives --install /usr/bin/vi  vi  /usr/local/bin/nvim.appimage 110
  ```
