while read EXTRA_PATH; do
  if [[ -d $EXTRA_PATH ]]; then
    export PATH="$PATH:$EXTRA_PATH"
  fi
done <<EOF
  $HOME/.pyenv/shims
  /opt/homebrew/bin
  /opt/platform-tools
  $HOME/.dotfiles/scripts
  /opt/homebrew/opt/python@3.13/libexec/bin
  $HOME/Library/Python/3.9/bin
EOF
