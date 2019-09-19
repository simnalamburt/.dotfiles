<p align=center>
  <a href="https://github.com/simnalamburt">
    <img alt="dotfiles" src="https://raw.githubusercontent.com/simnalamburt/.dotfiles/resources/logo.png">
  </a>
  <br>
  <b><a href="docs/">documentation</a></b> | <a href="packages/">packages</a>
</p>

<br>

```shell
git clone https://github.com/simnalamburt/.dotfiles.git --depth=1 ~/.dotfiles

# zplugin   https://github.com/zdharma/zplugin
# vim-plug  https://github.com/junegunn/vim-plug
# tpm       https://github.com/tmux-plugins/tpm

ln -sf ~/.dotfiles/.zshrc ~
ln -sf ~/.dotfiles/.vimrc ~
ln -sf ~/.dotfiles/.tmux.conf ~
ln -sf ~/.dotfiles/.gitconfig ~ && ln -sf ~/.dotfiles/.gitexclude ~ &&\
  cp ~/.dotfiles/.gitconfig.local ~

mkdir -p ~/.ssh && chmod 700 ~/.ssh &&\
  ln -sf ~/.dotfiles/.ssh/config ~/.ssh &&\
  cp ~/.dotfiles/.ssh/config.local ~/.ssh

# Misc
mkdir -p ~/.gnupg && cp ~/.dotfiles/gpg-agent.conf ~/.gnupg
mkdir -p ~/.bundle && ln -sf ~/.dotfiles/bundle-config ~/.bundle/config
```

#### Relevant plugins
- [simnalamburt/vim-mundo     ](https://github.com/simnalamburt/vim-mundo) - Vim undo tree visualizer
- [simnalamburt/cgitc         ](https://github.com/simnalamburt/cgitc) - Close Git Combat
- [simnalamburt/zsh-expand-all](https://github.com/simnalamburt/zsh-expand-all) - Automatically expands all glob expressions, subcommands, and aliases
- [simnalamburt/tmux-pane     ](https://github.com/simnalamburt/tmux-pane) - Key-bindings for tmux pane control
- [simnalamburt/shellder      ](https://github.com/simnalamburt/shellder) - Featured zsh/fish shell theme
- [simnalamburt/fish-sensible ](https://github.com/simnalamburt/fish-sensible) - Agreeable dafault aliases for fish

<br>

--------
*dotfiles* is primarily distributed under the terms of both the [MIT license]
and the [Apache License (Version 2.0)]. See [COPYRIGHT] for details.

[MIT license]: LICENSE-MIT
[Apache License (Version 2.0)]: LICENSE-APACHE
[COPYRIGHT]: COPYRIGHT
