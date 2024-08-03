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

[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
