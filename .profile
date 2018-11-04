PATH=$PATH:~/bin:~/.npm-local/bin

export TERM=xterm-256color
export LANG=lt_LT.UTF-8
export LC_TYPE=lt_LT.UTF-8
export LESS=-JMQRiFX
export PAGER=less

if [ "`hostname`" == +(aw17r4) ]; then
	export GDK_DPI_SCALE=1.5
fi

alias ls='ls -F'
alias ll='ls -lF'

[ -f ~/.security ] && . ~/.security
