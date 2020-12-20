#!/bin/sh
sudo chsh -s `which fish`
# Avoid failing if base16 already exist in target OS
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell || true
curl -fsSL https://starship.rs/install.sh | bash
curl -fsSL https://git.io/fisher | source && \
  fisher install jorgebucaran/fisher && \
  fisher jorgebucaran/nvm.fish
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
# your PATH)
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
# Update the path to the kitty icon in the kitty.desktop file
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop

