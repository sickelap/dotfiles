while read COMPLETION; do
  if [[ -f $COMPLETION ]]; then
    source $COMPLETION
    return
  fi
done << EOF
  /opt/homebrew/etc/profile.d/bash_completion.sh
  /usr/share/bash-completion/bash_completion
EOF
