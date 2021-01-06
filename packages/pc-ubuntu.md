PC, WSL 2
========
Ubuntu 20.04

### Removed `apt`
- python3 vim x11-common openssh-sftp-server vim-tiny screen bzip2

### `apt`
- build-essential
- zip entr
- zsh fd-find ripgrep fzf fuse

PPA:

- python3.9-dev python3.9-venv
  ([ppa:deadsnakes/ppa](https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa))
- nodejs
  (v15.x, [deb.nodesource.com](https://github.com/nodesource/distributions/blob/master/README.md#installation-instructions))
- yarn
  (v1.x, [dl.yarnpkg.com](https://classic.yarnpkg.com/en/docs/install#debian-stable))
- golang
  ([ppa:longsleep/golang-backports](https://launchpad.net/~longsleep/+archive/ubuntu/golang-backports))
- terraform nomad consul
  ([apt.releases.hashicorp.com](https://www.terraform.io/docs/cli/install/apt.html))

Manual:

- lsb-musl ([v0.19.0](https://github.com/Peltoche/lsd/releases))
- bat-musl ([v0.17.1](https://github.com/sharkdp/bat/releases))
- git-delta-musl ([v0.5.1](https://github.com/dandavison/delta/releases))

### `rustup` & `cargo install`
- stable: rust-src

### `/usr/local/bin`
- vim ([NVIM v0.4.4](https://github.com/neovim/neovim/releases))
- aws ([v2.1.16](https://github.com/simnalamburt/awscliv2.appimage/releases))
- [aws-mfa](https://github.com/simnalamburt/snippets/blob/master/sh/aws-mfa)
