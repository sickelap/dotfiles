OS=$(uname -s)

if [[ "$OS" == "Linux" ]]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/keyring/ssh"
fi
