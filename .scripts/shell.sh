#!/bin/sh
sudo chsh -s `which fish`
# Avoid failing if base16 already exist in target OS
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell || true
curl -fsSL https://starship.rs/install.sh
curl -fsSL https://git.io/fisher | source && \
  fisher install jorgebucaran/fisher && \
  fisher jorgebucaran/nvm.fish
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
