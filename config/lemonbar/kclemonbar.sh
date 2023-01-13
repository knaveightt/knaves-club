#!/usr/bin/env bash
#
# kclemonbar.sh
#
# My implementation of lemonbar using named pipes.
# Heavy inspiration from JLErvin's simplebar script (github)
# as well as simonhughxyz's lemonbar script (github)

# create named pipe
prefix_dir="$HOME/.config/lemonbar"
panel_fifo="$prefix_dir/panel-fifo"

[ -e "${panel_fifo}" ] && rm "${panel_fifo}"
mkfifo "${panel_fifo}"

#############################
# BAR MODULES               #
#############################

workspaces() {
	bspc subscribe report | while read -r line; do
		desktops=$( echo ${line} | tr ':' '\n' | sed '/[WM|L|T|G]/d;')	
		desktops_formatted="$( echo ${desktops} | tr '\n' ' ' )"
		echo "WORKSPACES ${desktops_formatted}"
	done
}

battery() {
	while true; do
		BAT_PERCENTAGE=$(acpi --battery | cut -d, -f2)
		echo "BATTERY $BAT_PERCENTAGE"

		sleep 60
	done
}

dateandtime() {
	while true; do
		DATETIME=$(date "+%a %d.%b %T")
		echo "DATETIME $DATETIME"

		sleep 1
	done
}

trayerspace() {
	${prefix_dir}/xprop_panel_sub.sh | while read line; do
		size=$( echo $line | awk '{print $2}' )

		# check to see if we actually got a size value
		# otherwise the printf command will naturally
		# return 0
		size=$( printf '%d' $size 2>/dev/null )

		echo "TRAYSPACE ${size}"
	done
}

#############################
# INITIATE BAR              #
#############################

# Initiate modules and write updates to named pipe
workspaces > "${panel_fifo}" &
battery > "${panel_fifo}" &
dateandtime > "${panel_fifo}" &
trayerspace > "${panel_fifo}" &

# Read named pipe updates and update bar component accordingly
while read -r line; do
	case $line in
		WORKSPACES*)
			fn_workspaces="${line#WORKSPACES }"
			;;
		DATETIME*)
			fn_datetime="${line#DATETIME }"
			;;
		BATTERY*)
			fn_battery="${line#BATTERY }"
			;;
		TRAYSPACE*)
			fn_tspace="${line#TRAYSPACE }"
			;;
	esac

	# build the bar
	echo "%{l}%{B#000}%{F#FFF}${fn_workspaces}%{c}${fn_tspace}%{r}${fn_battery} ${fn_datetime}%{O${fn_tspace}}"

# at the end of the day, make sure the named pipe is providing updates
# and the updates are piped into lemonbar
done < "${panel_fifo}" | lemonbar | $SHELL
