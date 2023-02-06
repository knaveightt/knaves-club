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
    *)
        ;;
esac

