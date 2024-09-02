while read -r EXTRA_PATH; do
  if [[ -d $EXTRA_PATH ]]; then
    export PATH="$PATH:$EXTRA_PATH"
  fi
done <<EOF
  /opt/homebrew/bin
  /opt/platform-tools
  $HOME/.dotfiles/scripts
EOF
