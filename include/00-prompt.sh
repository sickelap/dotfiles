
if [[ -f /usr/share/git/completion/git-prompt.sh ]]; then
  export GIT_PS1_SHOWCOLORHINTS=1
  export GIT_PS1_DESCRIBE_STYLE=1
  export GIT_PS1_SHOWDIRTYSTATE=1
  export PS1='\n\w$(__git_ps1 " (%s)")\n\$ '
else
  echo git-prompt.sh not found
fi

