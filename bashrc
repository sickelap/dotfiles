PATH=~/bin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/sbin

CWD=$HOME/.dotfiles

#if [ ! -f ${CWD}/include/secrets -a -f ${CWD}/secrets.vault ]; do
#  which ansible-vault 2>&1 >/dev/null
#  if [ "$?" = "0" ]; then
#    asible-vault descrypt --output-file ${CWD}/include/secrets ${CWD}/secrets.vault
#  else
#    echo "ansible-vault is not in path. secrets will not be decrypted"
#  fi
#done


for file in ${CWD}/include/*.sh; do
  . $file
done

# load bash completions if we have bash
which bash >/dev/null
if [ $? -eq 0 ]; then
  for file in ${CWD}/bash_completion/* ${CWD}/bash_include/*; do
    source $file
  done
fi

# load node version manager
if [ -s "$HOME/.nvm/nvm.sh" ]; then
  source "$HOME/.nvm/nvm.sh"
fi
