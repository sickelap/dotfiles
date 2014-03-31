
#PATH=/Applications/MAMP/bin/php/php5.3.14/bin:$PATH
PATH=/Applications/MAMP/bin/php/php5.5.3/bin:$PATH
#PATH=/Applications/MAMP/bin/php/php5.4.19/bin:$PATH
#PATH=$PATH:/opt/local/bin
#PATH=$PATH:/opt/local/lib/mysql56/bin
PATH=$PATH:/opt/mongodb/bin
PATH=$PATH:~/bin
PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin
PATH=$PATH:/Applications/MAMP/Library/bin
PATH=$PATH:/usr/local/bin:/usr/local/sbin
PATH=/opt/local/bin:/opt/local/sbin:$PATH

export PHP_AUTOCONF=/usr/local/bin/autoconf
export LANG=C
export LC_TYPE=C

source ~/.dotfiles/.symfony.bash
source ~/.dotfiles/.git.bash

export CLICOLOR=1
export TERM=xterm-color
export LSCOLORS=Exgxcxdxbxegedabagacad

alias nginx_start='sudo launchctl load -w /Library/LaunchDaemons/org.macports.nginx.plist'
alias nginx_stop='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.nginx.plist'
alias nginx_restart='nginx_stop; nginx_start;'
alias fpm_start='sudo launchctl load -w /Library/LaunchDaemons/org.macports.php54-fpm.plist'
alias fpm_stop='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.php54-fpm.plist'
alias fpm_restart='fpm_stop; fpm_start'
alias e='subl'

