
if [[ -f /usr/share/git/completion/git-prompt.sh ]]; then
  source /usr/share/git/completion/git-prompt.sh
  export GIT_PS1_SHOWCOLORHINTS=1
  export GIT_PS1_DESCRIBE_STYLE=1
  export GIT_PS1_SHOWDIRTYSTATE=1
  if [[ $() == "0" ]]; then
    export PS1='\n\w$(__git_ps1 " (%s)")\n\# '
  else
    export PS1='\n\w$(__git_ps1 " (%s)")\n\$ '
  fi
else
  echo git-prompt.sh not found
fi

