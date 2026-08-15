alias ls='ls -F'
alias ll='ls -lF'
alias showme='ls -lR'
alias doas='sudo'

which nvim &>/dev/null
if [ "$?" == "0" ]; then
  alias vim=nvim
fi

alias dotfiles='vim ~/.dotfiles && source ~/.profile'
alias codex-personal='rm ~/.codex && ln -s ~/.codex.personal ~/.codex'
alias codex-gousto='rm ~/.codex && ln -s ~/.codex.gousto ~/.codex'

alias qwen-thinking="LLAMA_CACHE='unsloth/Qwen3.5-9B-MTP-GGUF' llama-server -hf unsloth/Qwen3.5-9B-MTP-GGUF:UD-Q6_K_XL -c 65536 --reasoning on --temperature 0.6 --top-p 0.95 --top-k 20 --min-p 0 --presence-penalty 0 --repeat-penalty 1.0"
alias qwen-coding="LLAMA_CACHE='unsloth/Qwen3.5-9B-MTP-GGUF' llama-server -hf unsloth/Qwen3.5-9B-MTP-GGUF:UD-Q6_K_XL -c 65536 --reasoning off --temperature 0.7 --top-p 0.8 --top-k 20 --min-p 0 --presence-penalty 1.5 --repeat-penalty 1.0"
