which brew >/dev/null
if [ $? -eq 0 ]; then
  export HOMEBREW_NO_AUTO_UPDATE=1
  export PATH="/usr/local/opt/mongodb-community@3.4/bin:$PATH"
fi
