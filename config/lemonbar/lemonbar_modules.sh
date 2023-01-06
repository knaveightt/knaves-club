#!/bin/bash
# Test lemonbar script

clock() {
	DATETIME=$(date "+%a %d.%b %T")
	echo -n $DATETIME
}

battery() {
	BAT_PERCENTAGE=$(acpi --battery | cut -d, -f2)
	echo "$BAT_PERCENTAGE"
}

desktopname() {
	cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
	desktop_names=`xprop -root _NET_DESKTOP_NAMES`
	cur_name_id=`bc <<< $cur+2+$cur`
	cur_name=`echo ${desktop_names} | awk -v var="$cur_name_id" -F "\"" '{print $var}'`
	echo $cur_name
}

groups() {
	cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
	tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`
	window=`bc <<< $cur+1`
	desktop_names=`xprop -root _NET_DESKTOP_NAMES`
	cur_name_id=`bc <<< $cur+2+$cur`
	cur_name=`echo ${desktop_names} | awk -v var="$cur_name_id" -F "\"" '{print $var}'`
	for w in `seq 0 $((cur -1))`; do line="${line}%{B#000}%{F#888}="; done
	line="${line}%{B#FFF}%{F#000} $cur_name %{F#000}"
	for w in `seq $((cur + 2)) $tot`; do line="${line}%{B#000}%{F#888}="; done
	echo $line
}

while true; do
	buf="%{l}%{B#000}%{F#FFF} << $(groups)%{B#000}%{F#FFF} >>"

	buf="${buf} %{c}Hello World!"

	buf="${buf} %{r}Bat: $(battery)    Date: $(clock) "

	echo $buf
	sleep 1
done

