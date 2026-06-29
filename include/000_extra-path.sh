while read EXTRA_PATH; do
  if [[ -d $EXTRA_PATH ]]; then
    export PATH="$EXTRA_PATH:$PATH"
  fi
done <<EOF
  $HOME/.pyenv/shims
  /opt/homebrew/bin
  /opt/platform-tools
  $HOME/.dotfiles/scripts
EOF
