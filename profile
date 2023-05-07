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

interpreter=`ps h -p $$ -o args='' | cut -f1 -d' '`
case $interpreter in
  -zsh)
    for file in ${CWD}/zsh_include/*.sh; do
      . $file
    done
  ;;

  -bash)
    for file in ${CWD}/bash_completion/* ${CWD}/bash_include/*; do
      source $file
    done
    if [ -s "$HOME/.nvm/bash_completion" ]; then
      source "$HOME/.nvm/bash_completion"
    fi
  ;;

  *)
    echo "interpreter: $interpreter"
  ;;
esac

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/user/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/user/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/user/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/user/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

