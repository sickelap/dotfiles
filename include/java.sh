while read file; do
  if [ -d $location ]; then
    export JAVA_HOME="$location"
    export PATH=$JAVA_HOME/bin:$PATH
    return
  fi
done << EOF
  /usr/lib/jvm/java-11-openjdk-amd64
  /usr/local/Cellar/openjdk@11/11.0.10
EOF

export PATH=/usr/local/Cellar/maven@3.5/3.5.4_1/bin:$PATH