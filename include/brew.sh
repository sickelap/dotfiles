which brew >/dev/null
if [ $? -eq 0 ]; then
  export HOMEBREW_NO_AUTO_UPDATE=1
fi
