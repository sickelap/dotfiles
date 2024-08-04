#!/usr/bin/env bash

THIS_DIR=$(cd $(dirname $0) && pwd)

$THIS_DIR/_setup/setup-neovim.sh
$THIS_DIR/_setup/setup-tmux.sh
$THIS_DIR/_setup/setup-nvm.sh
$THIS_DIR/_setup/setup-go.sh
$THIS_DIR/_setup/setup-rust.sh

# other shit
ln -sf $THIS_DIR/gitconfig $HOME/.gitconfig
ln -sf $THIS_DIR/gitconfig.user $HOME/.gitconfig.user
ln -sf $THIS_DIR/profile $HOME/.bashrc
ln -sf $THIS_DIR/profile $HOME/.profile
ln -sf $THIS_DIR/editorconfig $HOME/.editorconfig
