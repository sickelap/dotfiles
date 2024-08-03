while read COMPLETION; do
  if [[ -f $COMPLETION ]]; then
    source $COMPLETION
    return
  fi
done << EOF
  /usr/share/bash-completion/bash_completion
EOF
