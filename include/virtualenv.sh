while read file; do
  if [[ -f $file ]]; then
    source $file
    return
  fi
done << EOF
  /opt/homebrew/bin/virtualenvwrapper.sh
  /bin/virtualenvwrapper.sh
  /usr/local/bin/virtualenvwrapper.sh
  /usr/share/virtualenvwrapper/virtualenvwrapper.sh
EOF

