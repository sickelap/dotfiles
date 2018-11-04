#!/bin/sh

CWD=`pwd`
SRC="
.Xdefaults
.fonts
.gitconfig
.i3
.i3status.conf
.mailcap
.muttrc
.profile
.tmux.conf
.vimrc
.xsession
"

for dot in $SRC; do
	rm -rf ~/$dot
	ln -s $CWD/$dot ~/$dot
done


