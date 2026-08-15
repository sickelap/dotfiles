export NVM_DIR="$HOME/.nvm"

while read EXTRA_PATH; do
  if [[ -d $EXTRA_PATH ]]; then
    export PATH="$EXTRA_PATH:$PATH"
  fi
done <<EOF
  $HOME/.nvm/nvm.sh
  /opt/homebrew/opt/nvm/nvm.sh
  /opt/homebrew/opt/nvm/etc/bash_completion.d/nvm
EOF

