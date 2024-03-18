#!/usr/bin/env bash

if [ -d $HOME/bin/nvim-linux64 -a -z "$NVIM_REINSTALL" ]; then
  echo "Neovim is already installed"
  echo "To reinstall, run 'export NVIM_REINSTALL=1' and then run this script again"
else
  echo "Installing Neovim"
  mkdir -p $HOME/bin
  cd $HOME/bin
  curl -Lso- https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz | tar xz
  ln -s $HOME/bin/nvim-linux64/bin/nvim $HOME/bin/vim
  rm -rf $HOME/.{local/share,cache,config}/nvim
  git clone https://github.com/AstroNvim/AstroNvim $HOME/.config/nvim/
  git clone https://github.com/sickelap/nvim-astro-user $HOME/.config/nvim/lua/user/
fi
