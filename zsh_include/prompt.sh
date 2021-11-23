autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info

export PROMPT="
%F{cyan}%~%f${vcs_info_msg_0_}
$ "

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:git:*' formats ' [%F{green}%b%f%F{yellow}%u%c%f]'
zstyle ':vcs_info:git:*' actionformats ' [%F{green}%b%f|%F{magenta}%a%f%F{yellow}%u%c%f]'
