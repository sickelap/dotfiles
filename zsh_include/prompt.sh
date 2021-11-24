autoload -Uz add-zsh-hook vcs_info
add-zsh-hook precmd vcs_info

precmd() {
  print ""
  print -P "%F{cyan}%~%f${vcs_info_msg_0_}"
  PS1="$ "
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats ' [%F{green}%b%f%F{yellow}%u%c%f]'
zstyle ':vcs_info:git:*' actionformats ' [%F{green}%b%f|%F{magenta}%a%f%F{yellow}%u%c%f]'
