#!/usr/bin/env bash

notify="notify-send -i $HOME/.config/dunst/images/donotdisturb.png"

tmp_disturb="/tmp/xmonad/donotdisturb"
tmp_disturb_colorfile="/tmp/xmonad/donotdisturb/color"

if [ ! -d $tmp_disturb ]; then
	mkdir -p $tmp_disturb
fi

case `dunstctl is-paused` in
    true)
        dunstctl set-paused false &
        $notify -a "System" "Do Not Disturb" "Turned Off" &
	echo "#84afdb" > $tmp_disturb_colorfile
        ;;
    false)
        $notify -a "System" "Do Not Disturb" "Active" &
	echo "#c47eb7" > $tmp_disturb_colorfile &
        # the delay is here because pausing notifications immediately hides
        # the ones present on your desktop; we also run dunstctl close so
        # that the notification doesn't reappear on unpause
        (sleep 3 && dunstctl close && dunstctl set-paused true)
        ;;
esac
