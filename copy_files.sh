#!/usr/bin/env bash
#
# copy_files.sh
# This is a quick script that copies over all the relevant
# files related to "Knave's Club", the dot files and scripts
# required to install this environment on a different machine
#
# Note, run this in the knaves-club project directory

# Copy over related config files
cp ~/.config/bspwm/bspwmrc config/bspwm/
cp ~/.config/sxhkd/sxhkdrc config/sxhkd/

# Copy over related scripts
cp ~/.local/bin/kc-run scripts/kc-run

# Misc Related Dot Files
cp ~/.bashrc config/
cp ~/.bash_profile config/
cp ~/.Xresources config/
cp ~/.profile config/
cp ~/.xsessionrc config/
