while read file; do
  if [ -f $file ]; then
    source $file
    return
  fi
done << EOF
  /usr/local/bin/virtualenvwrapper.sh
  /usr/share/virtualenvwrapper/virtualenvwrapper.sh
EOF

