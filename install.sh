#!/bin/bash
set -e 

# this script installs neovim with the provided version
if [[ -z $1 ]]; then
  echo 'No version was specified. Either type 'latest' or something like  '0.7.0''
  echo e.g './install.sh 0.7.0 osx' or './install.sh latest osx'
  exit 1
fi

if [[ -z $2 ]]; then
  echo You must specify the platform. Either 'linux' or 'osx'
  echo e.g './install.sh 0.7.0 osx' or './install.sh latest osx'
  exit 1
fi


VERSION=$1
PLATFORM=$2


if [[ "$PLATFORM" == "osx" ]]; then
    if [[ "$VERSION" == "latest" ]]; then
      curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep 'browser_download_url.*macos.*.tar.gz"$' | awk '{print $2}' | xargs -I path wget path
    else
      wget "https://github.com/neovim/neovim/releases/download/v$VERSION/nvim-macos.tar.gz"
    fi
fi

if [[ "$PLATFORM" == "linux" ]]; then
    if [[ "$VERSION" == "latest" ]]; then
      curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep 'browser_download_url.*linux64.*.tar.gz"$' | awk '{print $2}' | xargs -I path wget path
    else
      wget "https://github.com/neovim/neovim/releases/download/v$VERSION/nvim-linux64.tar.gz"
    fi
fi


echo 'Neovim was installed.'

