#!/usr/bin/env bash
#
# xprop_panel_sub.sh
#
# Quick wrapper script to subscribe to panel size
# changes from `xprop` command, so that lemonbar
# can dynamically make space for the system tray
#
# This is a quick wrapper script that gets called
# from my lemonbar script because I want to start
# lemonbar before the system tray is executed. 
# Doing this however causes in error when trying to
# subscribe to the changes from the tray (Because
# there is no tray) and breaks my update loops.
#
# This script will check in a loop to see if the necessary xprop command
# is working correctly, and once working correctly will provide the necessary
# output to my lemonbar script.

tries=0
max_attempts=10

while true; do
	# try to execute the command
	if ! xprop -name panel -f WM_SIZE_HINTS 32i ' $5\n' -spy WM_NORMAL_HINTS 2>/dev/null; then
		echo "!- Sleeping for two seconds, will try again."
		sleep 2
		tries=$((tries+1))
	else
		echo "!- Ending system tray size monitoring."
		break
	fi

	if [ $tries -gt $max_attempts ]; then
		echo "!- Too many tries. Halting system tray size monitoring."
		break
	fi
done
