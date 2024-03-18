#!/bin/bash

alias | grep pbcopy 2>&1 >/dev/null
IS_ALIAS="$?"

which pbcopy 2>&1 >/dev/null
IS_EXECUTABLE=$?

if [ "$IS_ALIAS" != "0" -o "$IS_EXECUTABLE" != "0" ]; then
  alias pbcopy="xclip -selection clipboard"
fi
