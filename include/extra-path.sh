while read EXTRA_PATH; do
  if [ -d $EXTRA_PATH ]; then
    export PATH="$PATH:$EXTRA_PATH"
    return
  fi
done << EOF
  /opt/platform-tools
  $HOME/anaconda3/bin
  /opt/go/1.22.1/bin
EOF
