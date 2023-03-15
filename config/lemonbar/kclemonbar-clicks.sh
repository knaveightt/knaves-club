#!/usr/bin/env bash
#
# kclemonbar-clicks.sh
#
# Companion script to my lemonbar script, used to handle click events from 
# the bar.

case $1 in
    showmem) # memory module clicked
        st -z 16 -e htop
        ;;
    desktopI) # change to desktop 1
        bspc desktop -f ^1
        ;;
    desktopII) # change to desktop 2
        bspc desktop -f ^2
        ;;
    desktopIII) # change to desktop 3
        bspc desktop -f ^3
        ;;
    desktopIV) # change to desktop 4
        bspc desktop -f ^4
        ;;
    desktopV) # change to desktop 5
        bspc desktop -f ^5
        ;;
    *)
        ;;
esac

