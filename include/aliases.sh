alias ls='ls -F'
alias ll='ls -lF'
alias showme='ls -lR'
alias doas='sudo'

which nvim &>/dev/null
if [ "$?" == "0" ]; then
  alias vim=nvim
fi

alias dotfiles='vim ~/.dotfiles && source ~/.profile'
alias codex-personal='rm ~/.codex && ln -s ~/.codex.personal ~/.codex'
alias codex-gousto='rm ~/.codex && ln -s ~/.codex.gousto ~/.codex'
