
PATH=$PATH:~/bin
PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin
PATH=$PATH:/usr/local/bin:/usr/local/sbin
PATH=/opt/local/bin:/opt/local/sbin:$PATH
PATH=$PATH:/opt/android-sdk-macosx/platform-tools:/opt/android-sdk-macosx/tools

export LANG=C
export LC_TYPE=C
export HOMEBREW_GITHUB_API_TOKEN=b2ffbdd33097e6858407f693901b762d19fb4749
export ANDROID_HOME=/opt/android-sdk-macosx
export MAVEN_OPTS="-Xms256m -XX:MaxPermSize=4g -Xmx4g"

source ~/.dotfiles/.symfony.bash
source ~/.dotfiles/.git.bash

export CLICOLOR=1
export TERM=xterm-color
export LSCOLORS=exgxcxdxbxegedabagacad

alias e='subl'
alias ls='ls -F'
alias ll='ls -lF'

