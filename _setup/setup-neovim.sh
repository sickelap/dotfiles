#!/usr/bin/env bash

OS=$(uname -s)

if [[ $OS == "Linux" ]]; then
  ARCH=$(uname -m)
  case $ARCH in
  "x86_64" | "aarch64") ;;
  *)
    echo "unknown arch $ARCH"
    return
    ;;
  esac
  if [ -d "$HOME/bin/nvim-linux-$VARIANT" ] && [ -z "$REINSTALL" ]; then
    echo "Neovim is already installed"
    echo "To reinstall, run REINSTALL=1 $0"
  else
    echo "Installing Neovim"
#    mkdir -p "$HOME/bin"
#    cd "$HOME/bin" || true
#    curl -Lso- "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-$ARCH.tar.gz" | tar xz
#    ln -sf "$HOME/bin/nvim-linux-$ARCH/bin/nvim" "$HOME/bin/vim"
  fi
fi

if [ -d "$HOME/.local/share/nvim" ] && [ -z "$FORCE" ]; then
  echo "Neovim is already configured"
  echo "To reinstall, run FORCE=1 $0"
else
  rm -rf $HOME/.{local/share,config}/nvim
  git clone https://github.com/sickelap/nvim-config "$HOME/.config/nvim"
fi
