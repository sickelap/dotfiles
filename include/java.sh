while read location; do
  if [ -d $location ]; then
    export JAVA_HOME="$location"
    export PATH="$JAVA_HOME/bin:$PATH"
    return
  fi
done << EOF
  /Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home
  /usr/lib/jvm/java-11-openjdk-amd64
  /usr/local/Cellar/openjdk\@11/11.0.10
EOF

