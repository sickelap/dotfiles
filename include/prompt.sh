while read -r COMPLETION; do
  if [[ -f $COMPLETION ]]; then
    source $COMPLETION
    export GIT_PS1_SHOWCOLORHINTS=1
    export GIT_PS1_DESCRIBE_STYLE=1
    export GIT_PS1_SHOWDIRTYSTATE=1
    if [[ $(id -u) == "0" ]]; then
      export PS1='\n\w$(__git_ps1 " (%s)")\n\# '
    else
      export PS1='\n\w$(__git_ps1 " (%s)")\n\$ '
    fi
    break
  fi
done <<EOF
  /usr/share/git/completion/git-prompt.sh
  $HOME/Projects/git/contrib/completion/git-prompt.sh
EOF
