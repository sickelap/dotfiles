alias e='subl'
alias ls='ls -F'
alias ll='ls -lF'
alias showme='ls -lR'
alias doas='sudo'
alias vim='nvim'
alias vi='nvim'

which thefuck 2>&1 >/dev/null
if [[ $? == 0 ]]; then
  eval $(thefuck --alias)
fi
