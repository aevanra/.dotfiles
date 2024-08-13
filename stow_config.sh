# /bin/sh

# This script stows everything that I want to go to the ~/.config dir

stow -t ~/.config -d ~/.dotfiles/ . --ignore=.zshrc
