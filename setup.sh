#!/usr/bin/env bash

THIS_DIR=$(cd $(dirname $0) && pwd)

# link files to home folder
ln -sf $THIS_DIR/profile $HOME/.profile
ln -sf $THIS_DIR/.vim $HOME/.vim
ln -sf $THIS_DIR/.tmux.conf $HOME/.tmux.conf
ln -sf $THIS_DIR/gitconfig $HOME/.gitconfig

# install tmux package manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# install vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

