if [ `id -u` ]; then
  export PS1='\n\[\e[36;1m\]\w\[\e[0m\]\n\$ \[\e[0m\]'
else
  export PS1='# '
fi
