PATH=~/bin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/sbin

CWD=$HOME/.dotfiles

for file in ${CWD}/include/*.sh ${CWD}/zsh_include/*.sh; do
  . $file
done

# load node version manager
if [ -s "$HOME/.nvm/nvm.sh" ]; then
  source "$HOME/.nvm/nvm.sh"
fi
