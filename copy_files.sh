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
cp ~/.config/lemonbar/kclemonbar.sh config/lemonbar/
cp ~/.config/lemonbar/xprop_panel_sub.sh config/lemonbar/
cp ~/.config/lemonbar/kclemonbar-clicks.sh config/lemonbar/
cp ~/.config/trayer/start.sh config/trayer
cp ~/.config/dunst/dunstrc config/dunst/
cp ~/.config/dunst/notification.png config/dunst/

# Copy over related scripts
cp ~/.local/bin/kc-run scripts/kc-run
cp ~/.local/bin/kc-windows scripts/kc-windows
cp ~/.local/bin/kc-logout scripts/kc-logout
cp ~/.local/bin/kc-reload scripts/kc-reload
cp ~/.local/bin/kc-brightness scripts/kc-brightness

# Misc Related Dot Files
cp ~/.bashrc config/
cp ~/.bash_profile config/
cp ~/.Xresources config/
cp ~/.profile config/
cp ~/.xsessionrc config/
