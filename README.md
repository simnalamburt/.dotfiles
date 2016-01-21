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

Requires `git` and `zsh`

```bash
cd ~
git clone https://github.com/simnalamburt/.dotfiles.git --depth=1
ln -sf .dotfiles/.zshrc
ln -sf .dotfiles/.vimrc
ln -sf .dotfiles/.gitconfig
ln -sf .dotfiles/.gitexclude
ln -sf .dotfiles/.tmux.conf
ln -sf .dotfiles/.gemrc

# fish
ln -s ~/.dotfiles/omf ~/.config/omf
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

mkdir -p .ssh && chmod 700 .ssh && ln -sf ../.dotfiles/.ssh/config .ssh
mkdir -p .gradle && ln -s ../.dotfiles/gradle.properties .gradle
ln -sf ~/.dotfiles/karabiner/private.xml "$HOME/Library/Application Support/Karabiner"
```

--------

BSD 2-Clause
