while read location; do
  if [ -d $location ]; then
    export JAVA_HOME="$location"
    export PATH="$JAVA_HOME/bin:$PATH"
    return
  fi
done << EOF
  /Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home
  /usr/local/Cellar/openjdk@17/17.0.4
  /Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home
  /usr/lib/jvm/java-11-openjdk-amd64
  /usr/lib/jvm/java-21-openjdk-amd64
  /usr/local/Cellar/openjdk\@11/11.0.10
EOF

