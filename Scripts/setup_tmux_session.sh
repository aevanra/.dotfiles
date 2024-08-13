#! /bin/bash
session_name=""
dir_path=""
venv_path=""

while getopts ":s:d:v:" opt; do
    case $opt in
        s) session_name=$OPTARG;;
        d) dir_path=$OPTARG;;
        v) venv_path=$OPTARG;;
        \?) echo "Invalid option: -$OPTARG" >&2
            exit 1;;
        :) echo "Option -$OPTARG requires an argument." >&2
            exit 1;;
    esac
done

if [ -z "$session_name" ]; then
    echo "Error: Session name is required. Use -s option to specify it." >&2
    exit 1
elif [ -z "$dir_path" ]; then
    echo "Error: Directory path is required. Use -d option to specify it." >&2
    exit 1
elif [ ! -d "$dir_path" ]; then
    echo "Error: Directory path '$dir_path' does not exist." >&2
    exit 1
elif [ -n "$venv_path" ] && [ ! -f "$venv_path" ]; then
    echo "Error: Virtual environment path '$venv_path' does not exist." >&2
    exit 1
elif tmux list-sessions | grep -q $session_name; then
    tmux attach -t $session_name
elif [ -z $TMUX ]; then
    echo "Starting tmux session and opening nvim in DE-pipelines directory."
    cd $dir_path
    source $venv_path
    tmux new -s $session_name 'nvim .' \; split-window -v \; resize-pane -D 14\; select-pane -U
else
    cd $dir_path && source $venv_path  && nvim .
fi


