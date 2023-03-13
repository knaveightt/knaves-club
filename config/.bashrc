# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Update defaults
export PAGER=nvimpager

alias ls='ls --color=auto'
alias xi='sudo xbps-install'
alias xf='xbps-query -Rs'
alias v='nvim'

source ~/Prog/git-prompt/git-prompt.sh

# prompt
FMT_BOLD="\e[1m"
FMT_RESET="\e[0m"
FMT_UNBOLD="\e[21m"
FG_BLACK="\e[30m"
FG_BLUE="\e[34m"
FG_CYAN="\e[36m"
FG_GREEN="\e[32m"
FG_MAGENTA="\e[35m"
FG_RED="\e[31m"
FG_WHITE="\e[97m"
BG_BLUE="\e[44m"
BG_GREEN="\e[42m"
BG_MAGENTA="\e[45m"

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1

export PS1=\
"\n\[${BG_GREEN}\] \[${FG_RED}\] \[${FG_BLACK}\]\u \[${FG_GREEN}${BG_BLUE}\] "\
"\[${FG_BLACK}\]\w \[${FMT_RESET}${FG_BLUE}\]"\
'$(__git_ps1 "\[${BG_MAGENTA}\] \[${FG_WHITE}\] %s \[${FMT_RESET}${FG_MAGENTA}\]")'\
"\n \[${FG_GREEN}\]╰ \[${FG_CYAN}\]\$ \[${FMT_RESET}\]"

#PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"
