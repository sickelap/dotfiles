#!/bin/bash

if ! which pbcopy &>/dev/null; then
  return
fi

if which xclip &>/dev/null; then
  alias pbcopy="xclip -selection clipboard"
fi
