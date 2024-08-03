#!/usr/bin/env bash

THIS_DIR=$(cd $(dirname $0) && pwd)

ln -sf $THIS_DIR/../tmux.conf $HOME/.tmux.conf
if [[ ! -d $HOME/.tmux/plugins/tpm ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
