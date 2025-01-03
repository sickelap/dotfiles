#!/usr/bin/env bash

OS=$(uname -s)

if [[ $OS == "Linux" ]]; then
  if [ -d $HOME/bin/nvim-linux64 -a -z "$REINSTALL" ]; then
    echo "Neovim is already installed"
    echo "To reinstall, run REINSTALL=1 $0"
  else
    echo "Installing Neovim"
    mkdir -p $HOME/bin
    cd $HOME/bin
    curl -Lso- https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz | tar xz
    ln -sf $HOME/bin/nvim-linux64/bin/nvim $HOME/bin/vim
  fi
fi

if [ -d $HOME/.local/share/nvim -a -z "$FORCE" ]; then
  echo "Neovim is already configured"
  echo "To reinstall, run FORCE=1 $0"
else
  rm -rf $HOME/.{local/share,config}/nvim
  git clone https://github.com/NvChad/NvChad $HOME/.config/nvim -b v2.0 --depth 1
  git clone https://github.com/sickelap/nvchad-custom-config $HOME/.config/nvim/lua/custom
fi
