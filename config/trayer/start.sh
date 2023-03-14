# start system tray

# wait for 2 seconds before starting the system tray
sleep 2
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --height 20 --widthtype request --transparent true --alpha 0 --tint 0x000000 &

# start system tray applications, gradually after each second
sleep 1
nm-applet &
