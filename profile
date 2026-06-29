PATH=~/bin:~/.local/bin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/sbin

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
  source $file
done

[ -f $HOME/.secrets ] && source $HOME/.secrets

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Added by git-ai installer on Fri May  8 17:15:04 BST 2026
export PATH="/Users/genadijus.paleckis/.git-ai/bin:$PATH"

source '/Users/genadijus.paleckis/.bash_completions/gousto.sh'

# Added by LM Studio CLI tool (lms)
export PATH="$PATH:/Users/genadijus.paleckis/.lmstudio/bin"

# Added by LM Studio CLI tool (lms)
export PATH="$PATH:/Users/genadijus.paleckis/.lmstudio/bin"
