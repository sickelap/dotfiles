which thefuck &>/dev/null
if [[ $? == 0 ]]; then
  eval $(thefuck --alias)
fi
