#!/usr/bin/env bash
#
# kclemonbar.sh
#
# My implementation of lemonbar using named pipes.
# Heavy inspiration from JLErvin's simplebar script (github)
# as well as simonhughxyz's lemonbar script (github)

#############################
# CONFIGS / SETUP           #
#############################

# lemonbar options
set_bar_height=28
set_bar_font="Inconsolata Nerd Font" # Font used for text
set_bar_font_size=11
set_bar_sfont="Symbols Nerd Font" # Font used for symbols (symbols only to 
                                  # avoid glyph cut-off issues)
set_bar_sfont_size=12
set_bar_underline=2
set_module_spaces="   "


#colors setup, read from .Xresources
cFG=$( xrdb -query | grep "*.foreground" | cut -f 2 )
cBG=$( xrdb -query | grep "*.background" | cut -f 2 )
cBLACK=$( xrdb -query | grep "*.color0" | cut -f 2 )
cBLACK_L=$( xrdb -query | grep "*.color8" | cut -f 2 )
cRED=$( xrdb -query | grep "*.color1" | cut -f 2 )
cRED_L=$( xrdb -query | grep "*.color9" | cut -f 2 )
cGREEN=$( xrdb -query | grep "*.color2" | cut -f 2 )
cGREEN_L=$( xrdb -query | grep "*.color10" | cut -f 2 )
cYELLOW=$( xrdb -query | grep "*.color3" | cut -f 2 )
cYELLOW_L=$( xrdb -query | grep "*.color11" | cut -f 2 )
cBLUE=$( xrdb -query | grep "*.color4" | cut -f 2 )
cBLUE_L=$( xrdb -query | grep "*.color12" | cut -f 2 )
cMAGENTA=$( xrdb -query | grep "*.color5" | cut -f 2 )
cMAGENTA_L=$( xrdb -query | grep "*.color13" | cut -f 2 )
cCYAN=$( xrdb -query | grep "*.color6" | cut -f 2 )
cCYAN_L=$( xrdb -query | grep "*.color14" | cut -f 2 )
cWHITE=$( xrdb -query | grep "*.color7" | cut -f 2 )
cWHITE_L=$( xrdb -query | grep "*.color15" | cut -f 2 )


# create named pipe and event script variable
prefix_dir="$HOME/.config/lemonbar"
panel_fifo="$prefix_dir/panel-fifo"
event_script="$prefix_dir/kclemonbar-clicks.sh"

[ -e "${panel_fifo}" ] && rm "${panel_fifo}"
mkfifo "${panel_fifo}"

#############################
# BAR MODULES               #
#############################

# Static Module - this module does not update
logo() {
    echo "%{B${cBLACK_L}}%{F${cGREEN_L}}    %{F${cFG}}%{B${cBG}}"
}

workspaces() {
	bspc subscribe report | while read -r line; do
		# parse subscribe report into an array of desktop elements
        desktops=$( echo ${line} | tr ':' '\n' | sed '/[WM|L|T|G]/d;')	
        desktops_formatted=($( echo ${desktops} | tr '\n' ' ' ))

        # wspace will hold the final workspaces string for the bar
        # underline tracks if a given elemement will be underlined
        #   because it has active notes on on that desktop
        # focused tracks if a given element will be highlighted
        #   because that desktop is the current focus
        #
        # im going to use these variables by iterating through each
        # desktop element in the array and see what it means / how 
        # it should be formatted. It assumes 5 desktops named 
        # I II III IV and V. See man bspc for info on the subscribe
        # report that I am parsing.
        wspace=""
        underline=false
        focused=false
        for element in "${desktops_formatted[@]}"
        do
            # check if this is the currently focused desktop
            if [[ "${element:0:1}" == "F" || "${element:0:1}" == "O" ]]; then
                focused=true
                # update the background or foreground for this item
                wspace="${wspace}%{B${cBLACK}}%{F${cCYAN_L}}"
            fi

            # checking if this is a desktop that has active notes
            if [[ "${element:0:1}" == "o" || "${element:0:1}" == "O" ]]; then
                if [[ $focused == true ]]; then
                    wspace="${wspace}%{U${cCYAN}}%{+u}"
                else
                    wspace="${wspace}%{U${cMAGENTA}}%{+u}"
                fi
                underline=true
            fi

            # check to see what character I should print for each desktop
            case ${element:1} in
                I)
                    wspace="${wspace}    "
                    ;;
                II)
                    wspace="${wspace}    "
                    ;;
                III)
                    wspace="${wspace}    "
                    ;;
                IV)
                    wspace="${wspace}    "
                    ;;
                V)
                    wspace="${wspace}    "
                    ;;
                *) ;;
            esac

            # clean up if the element was underlined
            if [[ $underline == true ]]; then
                wspace="${wspace}%{-u}"
                underline=false
            fi

            # clean up if the element was focused
            if [[ $focused == true ]]; then
                wspace="${wspace}%{B${cBG}}%{F${cFG}}"
                focused=false
            fi

            # small space between each desktop
            wspace="${wspace} "

        done

        # clean up the background color of this module
        wspace="${wspace}%{B${cBG}}"

		echo "WORKSPACES ${wspace}"
	done
}

memory() {
    while true; do
        # set the colors
        sRam="%{F${cYELLOW_L}}%{U${cYELLOW}}%{+u}"

        # Define the icon
        sRam="${sRam}%{T1}"

        # Update the ram usage 
        memory=$( free -m | grep 'Mem' | awk '{print $3}' )
        sRam="${sRam} %{F${cFG}}%{T2}${memory}MB"

        # Clean the Colors
        sRam="${sRam}%{-u}%{F${cFG}}"

        # Echo and wait
        echo "MEMORY %{A:$event_script showmem:}$sRam%{A}"
        sleep 30 # check each 30 seconds
    done
}

battery() {
	while true; do
		# get the battery charge amount, just the numeric value
        bat_amount="$(acpi --battery | cut -d, -f2 | sed 's/[ |%]//g')"
        
        # decide what battery icon to use
        if [ "$bat_amount" -gt 90 ]; then
            bat_icon=""
        elif [ "$bat_amount" -gt 70 ]; then
            bat_icon=""
        elif [ "$bat_amount" -gt 40 ]; then
            bat_icon=""
        elif [ "$bat_amount" -gt 15 ]; then
            bat_icon=""
        else
            bat_icon=""
        fi
        bat_amount="${bat_amount}%" # added percent after int calcs above

		echo "BATTERY %{F${cGREEN_L}}%{U${cGREEN}}%{+u}%{T1}${bat_icon}%{F${cFG}}%{T2} ${bat_amount}%{-u}"

		sleep 60
	done
}

calendar() {
    while true; do
        # set the colors
        sCal="%{F${cBLUE_L}}%{U${cBLUE}}%{+u}"

        # Define the icon
        sCal="${sCal}%{T1}"

        # Update the day
        today=$(date "+%x")
        sCal="${sCal} %{F${cFG}}%{T2}${today}"

        # Clean the Colors
        sCal="${sCal}%{-u}"

        # Echo and wait
        echo "CALENDAR $sCal"
        sleep 300 # check each 5 mins
    done
}

clock() {
    while true; do
        # set the colors
        sClock="%{F${cMAGENTA_L}}%{U${cMAGENTA}}%{+u}"

        # Define the icon
        sClock="${sClock}%{T1}"

        # Update the time
        right_now=$(date "+%I:%M %p ")
        sClock="${sClock} %{F${cFG}}%{T2}${right_now}"

        # Clean the Colors
        sClock="${sClock}%{-u}"

        # Echo and wait
        echo "CLOCK $sClock"
        sleep 30 # only update every 30 seconds
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
memory > "${panel_fifo}" &
battery > "${panel_fifo}" &
calendar > "${panel_fifo}" &
clock > "${panel_fifo}" &
trayerspace > "${panel_fifo}" &

# Initiate the static modules and static vars
fn_logo="$( logo )"
fn_space="$set_module_spaces"

# Read named pipe updates and update bar component accordingly
while read -r line; do
	case $line in
		WORKSPACES*)
			fn_workspaces="${line#WORKSPACES }"
			;;
        MEMORY*)
            fn_memory="${line#MEMORY }"
            ;;
        CALENDAR*)
            fn_calendar="${line#CALENDAR }"
            ;;
        CLOCK*)
            fn_clock="${line#CLOCK }"
            ;;
		BATTERY*)
			fn_battery="${line#BATTERY }"
			;;
		TRAYSPACE*)
			fn_tspace="${line#TRAYSPACE }"
			;;
	esac

    # build the bar (-e flag to allow echo with escape characters)
	echo -e "%{T1}%{l}${fn_logo}${fn_workspaces}%{T2}%{r}${fn_memory}${fn_space}${fn_battery}${fn_space}${fn_calendar}${fn_space}${fn_clock}${fn_space}%{O${fn_tspace}}"

# at the end of the day, make sure the named pipe is providing updates
# and the updates are piped into lemonbar
done < "${panel_fifo}" | lemonbar -g x${set_bar_height} -u ${set_bar_underline} -f "${set_bar_sfont}-${set_bar_sfont_size}" -f "${set_bar_font}-${set_bar_font_size}" -B ${cBG} -F ${cFG} | $SHELL
