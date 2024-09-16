if ! which pbcopy &>/dev/null && which xclip &>/dev/null; then
  alias pbcopy="xclip -selection clipboard"
fi
