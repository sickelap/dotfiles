#/usr/bin/env bash

OS=$(uname -s)

if [ "${OS}" == "Darwin" ]; then
  export GPG_TTY=$(tty)
  
  which pinentry-mac 2>& 1>/dev/null
  if [ $? -ne 0 ]; then
    echo "pinentry-mac is not installed, gpg might not work as expected. run 'brew install pinentry-mac'"
  fi
fi
