#!/usr/bin/env bash

THIS_DIR=$(cd $(dirname $0) && pwd)

# vim and neovim
rm -rf $HOME/.config/nvim
git clone https://github.com/AstroNvim/AstroNvim $HOME/.config/nvim/
git clone https://github.com/sickelap/nvim-astro-user $HOME/.config/nvim/lua/user/

# tmux
ln -sf $THIS_DIR/tmux.conf $HOME/.tmux.conf
if [ ! -d $HOME/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# node version manager
if [ ! -d $HOME/.nvm ]; then
  curl -so- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
fi

# other shit
ln -sf $THIS_DIR/gitconfig $HOME/.gitconfig
ln -sf $THIS_DIR/profile $HOME/.zshrc
ln -sf $THIS_DIR/profile $HOME/.bashrc
ln -sf $THIS_DIR/profile $HOME/.bash_profile
ln -sf $THIS_DIR/editorconfig $HOME/.editorconfig
