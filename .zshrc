# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Set history to persist
HISTFILE=~/.zsh_history

# thefuck
eval $(thefuck --alias)
eval $(thefuck --alias fk)

#Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias python='python3'
alias vim='nvim'
alias de-home='cd /home/aevan/Documents/DE-pipelines'
alias bb-home='cd /home/aevan/Documents/blackbird-api'
alias de-venv='source /home/aevan/python_venvs/de-pipelines/bin/activate'
alias bb-venv='source /home/aevan/python_venvs/bb3.11/bin/activate'
alias home-env='source /home/aevan/.bashrc'
alias de-work='de-home && de-venv && vim .'
alias bb-work='bb-home && bb-venv && vim .'
alias bb-test='bb-home && cd blackbird_data_interface/api/tests && bb-venv'
alias run-bb='bb-home && bb-venv && cd blackbird_data_interface/api && uvicorn --reload main:app --port 8000'
alias refresh_src='sudo /home/aevan/Documents/DE-pipelines/airflow_processing/include/manage_src_for_local_astro_instance.sh'
alias r2modman='/home/aevan/r2modman/r2modman-3.1.45.AppImage --no-sandbox'
alias cd='z'
alias ta='tmux attach'
alias gmux='tmux'
alias neofetch='clear && fastfetch'
alias fastfetch='clear && fastfetch'
alias astro='sudo astro'
alias fwvpn='/home/aevan/Scripts/fw_vpn.sh'

# Env Vars
source $home/.env

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/aevan/google-cloud-sdk/path.zsh.inc' ]; then . '/home/aevan/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/aevan/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/aevan/google-cloud-sdk/completion.zsh.inc'; fi

eval "$( oh-my-posh init zsh --config $HOME/.dotfiles/ohmyposh/omp.toml )"

# pywal theme import
(cat ~/.cache/wal/sequences &)

# Set fastfetch on init
fastfetch

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# autopair
source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh

# History Substring Search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# Zoxide
eval "$(zoxide init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
