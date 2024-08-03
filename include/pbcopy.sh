#!/bin/bash

alias | grep pbcopy &>/dev/null
IS_ALIAS="$?"

which pbcopy &>/dev/null
IS_EXECUTABLE=$?

if [ "$IS_ALIAS" != "0" -o "$IS_EXECUTABLE" != "0" ]; then
  alias pbcopy="xclip -selection clipboard"
fi
