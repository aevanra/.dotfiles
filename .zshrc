# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Set history options
HISTFILE=/home/aevan/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^N' autosuggest-accept

# Enable extended globbing
setopt extended_glob
setopt globdots
# Completion Settings -- Case Insensitive and .files so "conf" will complete to ".config"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=* m:{^.}={^\..}'
# Include dotfiles in file completion
zstyle ':completion:*:*:*:default' list-dirs-first true
zstyle ':completion:*:*:*:default' hidden-dirs yes
zstyle ':completion:*:*:*:default' file-patterns '*(-/):directories .*(.)'
# Add all files including dotfiles to the completion list
zstyle ':completion:*' file-patterns '*(-/):directories' '*(-.):files' '.*:all-files'
# Include hidden files in filename completion
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-dirs-first true
# zfunc
fpath+=~/.zfunc
autoload -Uz compinit && compinit

# Prompt editing
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^E" edit-command-line


# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# autonotify
source /usr/share/zsh/plugins/zsh-auto-notify/auto-notify.plugin.zsh
# autopair
source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh
# you-should-use
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh

# thefuck
eval $(thefuck --alias)
eval $(thefuck --alias fk)

de_dir="/home/aevan/Documents/DE-pipelines"
bb_dir="/home/aevan/Documents/blackbird-api"
de_venv_dir="/home/aevan/python_venvs/de-pipelines/bin/activate"
bb_venv_dir="/home/aevan/python_venvs/bb3.11/bin/activate"

#Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias python='python3'
alias nv='nvim .'
alias de-home='cd $de_dir'
alias bb-home='cd $bb_dir'
alias de-venv='source $de_venv_dir'
alias bb-venv='source $bb_venv_dir'
alias home-env='source /home/aevan/.zshrc'
alias de-work='/home/aevan/Scripts/setup_tmux_session.sh -s de-work -d $de_dir -v $de_venv_dir'
alias bb-work='/home/aevan/Scripts/setup_tmux_session.sh -s bb-work -d $bb_dir -v $bb_venv_dir'
alias bb-test='bb-home && cd blackbird_data_interface/api/tests && bb-venv'
alias run-bb='bb-home && bb-venv && cd blackbird_data_interface/api && uvicorn --reload main:app --port 8000'
alias refresh_src='sudo /home/aevan/Documents/DE-pipelines/airflow_processing/include/manage_src_for_local_astro_instance.sh'
alias cd='z'
alias ta='tmux attach'
alias gmux='tmux'
alias neofetch='clear && fastfetch'
alias fastfetch='clear && fastfetch'
alias fwvpn='/home/aevan/Scripts/fw_vpn.sh'

# Env Vars
source $HOME/.env

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/aevan/google-cloud-sdk/path.zsh.inc' ]; then . '/home/aevan/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/home/aevan/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/aevan/google-cloud-sdk/completion.zsh.inc'; fi

eval "$( oh-my-posh init zsh --config $HOME/.dotfiles/ohmyposh/omp.toml )"

# pywal theme import
(cat ~/.cache/wal/sequences &)

# Zoxide
eval "$(zoxide init zsh)"

# Set fastfetch on init
fastfetch


export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

fpath+=~/.zfunc; autoload -Uz compinit; compinit
