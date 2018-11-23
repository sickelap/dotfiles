#!/bin/sh

set +o sh

env | grep _TPL_ | while IFS="=" read _name _val; do
	_name=${_name#_TPL_}
	echo "$_name = $_val"
done

# vim: ft=zsh
# script is for ksh, it seems that openbsd port of vim
# does not have filetype support for ksh so zsh will do then.
