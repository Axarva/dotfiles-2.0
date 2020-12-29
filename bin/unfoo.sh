#!/usr/bin/env zsh
if [ -z "$(pgrep foo.sh)" ]
then
	notify-send "Inhibitor Was Not Active."
else
	kill -15 $(pgrep foo.sh) && notify-send "Inhibitor" "Deactivated"
fi


