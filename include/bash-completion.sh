set +o posix

while read COMPLETION; do
  if [[ -f $COMPLETION ]]; then
    source $COMPLETION
  fi
done <<EOF
  /opt/homebrew/etc/profile.d/bash_completion.sh
  $HOME/Projects/git/contrib/completion/git-completion.bash
  /usr/local/share/bash/completion/docker
  /usr/share/bash-completion/bash_completion
EOF
