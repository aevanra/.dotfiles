# ─── Editor ───────────────────────────────────────────────────────────────────
if set -q SSH_CONNECTION
    set -gx EDITOR vim
else
    set -gx EDITOR nvim
end

# ─── History ──────────────────────────────────────────────────────────────────
# Fish handles all of this natively and better than zsh — persistent, shared
# across sessions, deduplicated, and commands with a leading space are ignored.
# No configuration needed. Your old HISTIGNORE_SPACE behavior is built in:
# just prefix any command with a space and it won't be saved.

# ─── Cargo ────────────────────────────────────────────────────────────────────
# Source cargo env — fish-compatible way
if test -f $HOME/.cargo/env
    bass source $HOME/.cargo/env
    # NOTE: 'bass' lets you run bash-style source commands in fish.
    # Install it via Fisher: fisher install edc/bass
    # Alternatively, just set the path directly:
end
fish_add_path $HOME/.cargo/bin

# ─── Zoxide ───────────────────────────────────────────────────────────────────
zoxide init fish | source
# 'z' is available automatically. Your `alias cd="z"` becomes:
function cd
    z $argv
end

# ─── Prompt (oh-my-posh) ──────────────────────────────────────────────────────
oh-my-posh init fish --config $HOME/.dotfiles/ohmyposh/omp.toml | source

# ─── Project Variables ────────────────────────────────────────────────────────
set -g snow_dir /home/aarmus/Documents/snowflake
set -g snow_venv_dir /home/aarmus/venvs/snowflake/bin/activate
set -g airflow_dir /home/aarmus/Documents/airflow-dags
set -g airflow_venv_dir /home/aarmus/Documents/airflow-dags/.venv/bin/activate

# ─── Environment Variables ────────────────────────────────────────────────────
# Fish doesn't support `source ~/.env` for bash-style VAR=value files.
# You have two options:
#
# Option A) Use a fish-compatible env file at ~/.env.fish and source it:
#   source $HOME/.env.fish
#
# Option B) Use a tool like 'dotenv' or convert entries manually here:
#   set -gx MY_VAR my_value

# ─── Aliases ──────────────────────────────────────────────────────────────────
alias ls "ls --color=auto"
alias grep "grep --color=auto"
alias fgrep "fgrep --color=auto"
alias egrep "egrep --color=auto"
alias ll "ls -alF"
alias la "ls -A"
alias l "ls -CF"
alias python python3
alias nv "nvim ."
alias ta "tmux attach"
alias gmux tmux
alias dbkg dpkg

# Project aliases
alias fga_venv "source /home/aarmus/venvs/openfga/bin/activate"
alias fga_home "cd /home/aarmus/Documents/openfga"
alias fga-venv "source /home/aarmus/venvs/openfga/bin/activate"
alias fga-home "cd /home/aarmus/Documents/openfga"

alias snow_venv "source $snow_venv_dir"
alias snow_home "cd $snow_dir"
alias snow-venv "source $snow_venv_dir"
alias snow-home "cd $snow_dir"

alias airflow_venv "source $airflow_venv_dir"
alias airflow_home "cd $airflow_dir"
alias airflow-venv "source $airflow_venv_dir"
alias airflow-home "cd $airflow_dir"

# ─── Compound workflow aliases → functions ────────────────────────────────────
# Fish aliases can't chain commands with &&, so these become functions instead.

function run_airflow
    source $airflow_venv_dir
    and cd $airflow_dir
    and aws sso login
    and aws eks update-kubeconfig --name gov-dev-int-processing
    and make airflow
end

function run-airflow
    run_airflow
end

function snow-work
    /home/aarmus/Scripts/setup_tmux_session.sh -s snow-work -d $snow_dir -v $snow_venv_dir
end

function airflow-work
    /home/aarmus/Scripts/setup_tmux_session.sh -s airflow-work -d $airflow_dir -v $airflow_venv_dir
end

function load_env --argument-names env_file
    set -l file (test -n "$env_file"; and echo $env_file; or echo "$HOME/.env")
    while read -l line
        # Skip comments and blank lines
        string match -qr '^\s*#' $line; and continue
        string match -qr '^\s*$' $line; and continue
        # Strip leading 'export '
        set line (string replace -r '^export\s+' '' $line)
        # Split on first = only
        set -l key (string split -m1 '=' $line)[1]
        set -l val (string split -m1 '=' $line)[2]
        # Strip surrounding quotes from value
        set val (string trim -c '"' $val)
        set val (string trim -c "'" $val)
        # Only set if key is a valid identifier
        string match -qr '^[a-zA-Z_][a-zA-Z0-9_]*$' $key; and set -gx $key $val
    end < $file
end

load_env $HOME/.env

# ─── Edit command line in $EDITOR (replaces ^E bindkey) ──────────────────────
# Fish has this built in — press Alt+E or Alt+V to open the current
# command line in your editor. No configuration needed.
# If you want Ctrl+E specifically:
bind \ce edit_command_buffer

# ─── Plugins (via Fisher) ─────────────────────────────────────────────────────
# Run these once in your terminal to install:
#
#   fisher install jorgebucaran/fisher        # plugin manager (if not already)
#   fisher install edc/bass                   # for sourcing bash scripts
#   fisher install PatrickF1/fzf.fish         # replaces history-substring-search
#   fisher install jorgebucaran/autopair.fish # replaces zsh-autopair
#
# Replacements for your zsh plugins:
#
#   zsh-history-substring-search → built into fish (↑ arrow prefix-searches natively)
#                                   or fzf.fish for fuzzy history (Ctrl+R)
#   zsh-autosuggestions          → built into fish natively, no plugin needed
#   zsh-syntax-highlighting      → built into fish natively, no plugin needed
#   zsh-auto-notify              → no direct fish equivalent; closest is
#                                   https://github.com/franciscolourenco/done
#                                   (fisher install franciscolourenco/done)
#   zsh-you-should-use           → fisher install gazorby/fish-abbreviation-tips
#   zsh-autopair                 → fisher install jorgebucaran/autopair.fish
