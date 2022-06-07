#!/bin/bash
set -e 

# this script installs neovim with the provided version
if [[ -z $1 ]]; then
  echo You must specify the version
  echo e.g './install.sh 0.7.0 osx'
  exit 1
fi

if [[ -z $2 ]]; then
  echo You must specify the platform. Either 'linux' or 'osx'
  echo e.g './install.sh 0.7.0 osx'
  exit 1
fi

VERSION=$1
PLATFORM=$2

if [[ "$PLATFORM" == "osx" ]]; then
  wget "https://github.com/neovim/neovim/releases/download/v$VERSION/nvim-macos.tar.gz"
else
  wget "https://github.com/neovim/neovim/releases/download/v$VERSION/nvim.appimage"
fi

echo 'Neovim was installed.'
