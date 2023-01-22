# start system tray

# wait for 2 seconds before starting the system tray
sleep 2
trayer --edge top --align right --SetDockType true --transparent true --alpha 255 --SetPartialStrut true --expand true --height 28 --widthtype request --tint 0x000 &

# start system tray applications, gradually after each second
sleep 1
nm-applet &
