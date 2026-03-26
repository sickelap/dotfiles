alias ls='ls -F'
alias ll='ls -lF'
alias showme='ls -lR'
alias doas='sudo'

which nvim &>/dev/null
if [ "$?" == "0" ]; then
  alias vim=nvim
fi

alias dotfiles='vim ~/.dotfiles && source ~/.profile'

coregz() {
  set -e
  echo -n "creating snapshot ... "
  rm -rf $HOME/Downloads/repo*
  git clone file://$HOME/Projects/work/Gousto2-Core $HOME/Downloads/repo --depth 1 2>/dev/null
  tar czf $HOME/Downloads/repo.tar.gz $HOME/Downloads/repo 2>/dev/null
  echo "done ($HOME/Downloads/repo.tar.gz)"
}
