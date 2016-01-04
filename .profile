
PATH=$PATH:~/bin
PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin
PATH=$PATH:/usr/local/bin:/usr/local/sbin
#PATH=/opt/local/bin:/opt/local/sbin:$PATH
#PATH=$PATH:/opt/android-sdk-macosx/platform-tools:/opt/android-sdk-macosx/tools

export LANG=lt_LT.UTF-8
export LC_TYPE=lt_LT.UTF-8
export HOMEBREW_GITHUB_API_TOKEN=828b2c94d224406930e2ac67b87dee840781d59e
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

[ -f ~/.security ] && . ~/.security

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
