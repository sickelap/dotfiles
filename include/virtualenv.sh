#!/usr/bin/env bash

while read -r file; do
  if [[ -f $file ]]; then
    source $file
    break
  fi
done <<EOF
  /opt/homebrew/bin/virtualenvwrapper.sh
  /bin/virtualenvwrapper.sh
  /usr/local/bin/virtualenvwrapper.sh
  /usr/share/virtualenvwrapper/virtualenvwrapper.sh
EOF

function try_activate_virtualenv() {
  if [[ -z "$VIRTUAL_ENV" ]]; then

    for dir in .env .venv env venv; do
      if [[ -d $dir ]]; then
        source $dir/bin/activate
      fi
    done
  else
    parentdir="$(dirname "$VIRTUAL_ENV")"
    if [[ "$PWD"/ != "$parentdir"/* ]]; then
      deactivate
    fi
  fi
}

function cd() {
  builtin cd "$@"
  try_activate_virtualenv
}

try_activate_virtualenv
