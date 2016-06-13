> My own dotfiles

<p align=center>
  <a href="https://github.com/simnalamburt">
    <img src="https://raw.githubusercontent.com/simnalamburt/.dotfiles/resources/logo.png">
  </a>
</p>

<p align=center>
  <b><a href="docs/cheatsheet.md">CHEAT SHEET</a></b> |
  <a href="docs/os-x.md">OS X</a> |
  <a href="docs/msys2.md">MSYS2</a> |
  <a href="docs/ubuntu.md">Ubuntu</a> |
  <a href="docs/fedora.md">Fedora</a> |
  <a href="docs/arch.md">Arch Linux</a>
</p>

<br>

Requires `git` and `fish`

```bash
cd ~
git clone https://github.com/simnalamburt/.dotfiles.git --depth=1

# chips     https://github.com/kinoru/chips
# vim-plug  https://github.com/junegunn/vim-plug

mkdir -p .config/fish  && ln -sf ~/.dotfiles/config.fish .config/fish/
mkdir -p .config/chips && ln -sf ~/.dotfiles/plugin.yaml .config/chips/
mkdir -p .config/nvim  && ln -sf ~/.dotfiles/.vimrc      .config/nvim/init.vim
mkdir -p .ssh && chmod 700 .ssh && ln -sf ../.dotfiles/.ssh/config .ssh
ln -sf .dotfiles/.gitconfig
ln -sf .dotfiles/.gitexclude
ln -sf .dotfiles/.tmux.conf
ln -sf .dotfiles/.npmrc
ln -sf .dotfiles/.gemrc

# Optional dotfiles
cp .dotfiles/.gitconfig.local .
ln -sf .dotfiles/.zshrc
mkdir -p .gradle && ln -s ../.dotfiles/gradle.properties .gradle
```

--------

BSD 2-Clause
