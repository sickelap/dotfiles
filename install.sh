#!/bin/sh

CWD=`pwd`
SRC="
.Xdefaults
.bg
.fonts
.gitconfig
.i3
.i3status.conf
.npmrc
.mailcap
.muttrc
.mutt
.profile
.tmux.conf
.vimrc
.xsession
"

for dot in $SRC; do
	rm -rf ~/$dot
	ln -s $CWD/$dot ~/$dot
done


