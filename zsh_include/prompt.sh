git_prompt() {
  branch=$(git rev-parse --abbrev-ref HEAD)
  status=""
  if branch; then
    if [[ -z $(git status -s) ]]; then
      status="*"
    fi
    echo " [${branch}${status}]"
  fi
}

precmd() {
  print ""
  print -rP "%F{cyan}%~${git_prompt}%f"
}
export PROMPT="$ "
