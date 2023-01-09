# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Install Ruby Gems to a specified directory:
export GEM_HOME="$HOME/Shelf/gems"

# Update defaults
export PAGER=nvimpager

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
