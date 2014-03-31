source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash

function parse_git_dirty {
    [[ $(git status -s 2> /dev/null| wc -l | awk '{print $1}') != "0" ]] && echo "*"
}   

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}   

export PS1='\n\[\e[36;1m\]\w\[\e[0m\] $(__git_ps1 "[\[\e[0;32m\]%s\[\e[0m\]\[\e[0;33m\]$(parse_git_dirty)\[\e[0m\]]")\n\$ \[\e[0m\]'

