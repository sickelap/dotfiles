while read EXTRA_PATH; do
  if [[ -d $EXTRA_PATH ]]; then
    export PATH="$PATH:$EXTRA_PATH"
  fi
done <<EOF
  /opt/homebrew/opt/python@3.11/libexec/bin
  /opt/homebrew/bin
  /opt/platform-tools
  $HOME/.dotfiles/scripts
EOF
