#!/bin/bash

VERSION=$1

if [[ -z "${VERSION}" ]]
    then
        echo "Specify the version. E.g 'v0.8.2'"
        exit 1
fi

INSTALL_DIR="$HOME/bin"
NVIM_MACOS="nvim-macos"
TAR_FILE="$NVIM_MACOS.tar.gz"
TAR_FILE_PATH="$INSTALL_DIR/nvim-macos.tar.gz"

rm -f $TAR_FILE_PATH

APPIMAGE_URL="https://github.com/neovim/neovim/releases/download/$VERSION/$TAR_FILE"
https://github.com/neovim/neovim/releases/download/v0.9.2/nvim-macos.tar.gz
echo "Installing Neovim $VERSION to $INSTALL_DIR"
echo "Installing from $APPIMAGE_URL"

wget -q --show-progress --directory-prefix=$INSTALL_DIR $APPIMAGE_URL
xattr -c $INSTALL_DIR/$TAR_FILE
tar xzvf $INSTALL_DIR/$TAR_FILE && rm -rf $INSTALL_DIR/$NVIM_MACOS && mv $NVIM_MACOS $INSTALL_DIR/$NVIM_MACOS
ln -f -s $INSTALL_DIR/$NVIM_MACOS/bin/nvim $INSTALL_DIR/nvim
