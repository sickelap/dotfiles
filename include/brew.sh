which brew >/dev/null
if [ $? -eq 0 ]; then
  export HOMEBREW_NO_AUTO_UPDATE=1
  export PATH="/usr/local/opt/mongodb-community@3.4/bin:$PATH"
  export PATH="/usr/local/Cellar/maven@3.5/3.5.4_1/bin:$PATH"
fi
