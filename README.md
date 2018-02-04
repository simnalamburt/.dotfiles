> My own dotfiles

<p align=center>
  <a href="https://github.com/simnalamburt">
    <img src="https://raw.githubusercontent.com/simnalamburt/.dotfiles/resources/logo.png">
  </a>
</p>

<p align=center>
  <b><a href="docs/cheatsheet.md">CHEAT SHEET</a></b> |
  <a href="docs/macos.md">macOS</a> |
  <a href="docs/windows.md">Windows</a> |
  <a href="docs/ubuntu.md">Ubuntu</a> |
  <a href="docs/fedora.md">Fedora</a> |
  <a href="docs/arch.md">Arch Linux</a>
</p>

<br>

Requires `git` and `fish`

```bash
git clone https://github.com/simnalamburt/.dotfiles.git --depth=1 ~/.dotfiles

# chips     https://github.com/kinoru/chips
# vim-plug  https://github.com/junegunn/vim-plug
# tpm       https://github.com/tmux-plugins/tpm

mkdir -p ~/.config/fish;  ln -sf ~/.dotfiles/config.fish ~/.config/fish/
mkdir -p ~/.config/chips; ln -sf ~/.dotfiles/plugin.yaml ~/.config/chips/
mkdir -p ~/.config/fish;  ln -sf ~/.dotfiles/fishfile    ~/.config/fish/
cp ~/.dotfiles/config-local.fish ~/.config/fish/

mkdir -p ~/.ssh; chmod 700 ~/.ssh; ln -sf ~/.dotfiles/.ssh/config ~/.ssh
mkdir -p ~/.gnupg; ln -sf ~/.dotfiles/gpg-agent.conf ~/.gnupg
ln -sf .dotfiles/.vimrc ~
ln -sf .dotfiles/.gitconfig ~
ln -sf .dotfiles/.gitexclude ~
ln -sf .dotfiles/.tmux.conf ~
mkdir -p ~/.bundle; ln -sf ~/.dotfiles/bundle-config ~/.bundle/config

# Optional dotfiles
cp ~/.dotfiles/.gitconfig.local ~
ln -sf ~/.dotfiles/.zshrc ~
```
<br>

--------
*dotfiles* is primarily distributed under the terms of both the [MIT license]
and the [Apache License (Version 2.0)]. See [COPYRIGHT] for details.

[MIT license]: LICENSE-MIT
[Apache License (Version 2.0)]: LICENSE-APACHE
[COPYRIGHT]: COPYRIGHT
