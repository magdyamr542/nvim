#!/bin/bash
echo "Installing Neovim v0.8.2 to /usr/local/bin/nvim"
APPIMAGE_URL="https://github.com/neovim/neovim/releases/download/v0.8.2/nvim.appimage"
curl -Lo nvim.appimage $APPIMAGE_URL
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
echo "Done"
