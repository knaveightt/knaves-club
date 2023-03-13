# .bash_profile

# Get environment variables
# this should also be in ~/.xsessionrc
if [ -f ~/.profile ]; then
	. ~/.profile
fi

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc
. "$HOME/.cargo/env"
