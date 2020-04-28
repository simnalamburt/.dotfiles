PC, WSL
========
Debian Buster

### `apt`
- apt-transport-https build-essential lsb-release
- htop man curl bash-completion zip unzip
- vim-nox git zsh tmux fd-find ripgrep fzf
- ruby ruby-dev libsqlite3-dev
- python3-venv
- fp-compiler
- shellcheck jq
- gcc-8-riscv64-linux-gnu binutils-riscv64-linux-gnu [qemu-system-riscv64]

[qemu-system-riscv64]: https://github.com/simnalamburt/qemu-system-riscv64.deb

### `apt` PPA
- nodejs (nodesource.com, v14.x)
- yarn (v1.x)

### `/usr/local/bin`
- packer terraform terraformer

### `gem`
- bundler

### `rustup`
- stable: rust-analysis rust-src rls
- nightly: rust-src

###`cargo install`
- lsd
- svgcleaner
- cargo-bloat
