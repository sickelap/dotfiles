alias ls='ls -F'
alias ll='ls -lF'
alias showme='ls -lR'
alias doas='sudo'

which nvim &>/dev/null
if [ "$?" == "0" ]; then
  alias vim=nvim
fi
