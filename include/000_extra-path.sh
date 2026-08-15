while read EXTRA_PATH; do
  if [[ -d $EXTRA_PATH ]]; then
    export PATH="$EXTRA_PATH:$PATH"
  fi
done <<EOF
  /opt/homebrew/bin
  $HOME/.cargo/bin
  $HOME/.local/bin
  $HOME/.lmstudio/bin
  $HOME/.opencode/bin
  $HOME/.pyenv/versions/3.12.13/bin
  $HOME/go/bin
  /opt/platform-tools
  $HOME/.dotfiles/scripts
EOF
