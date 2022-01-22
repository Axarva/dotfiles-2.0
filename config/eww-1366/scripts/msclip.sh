#!/bin/sh

sel_fail() {
	notify-send -i flameshot 'Screenshot' 'Failed to take screenshot'
	exit 1
}

case $1 in
        -c | copy)
		file=/tmp/$(date +%d-%m-%Y_%H-%M-%S).png
                maim -us | tee $file |
                        xclip -selection clipboard -t image/png
		feh -U $file
		if [ $? -eq 0 ]; then
	                notify-send --icon=$file 'Screenshot' 'Screenshot copied'
			rm $file
		else sel_fail
		fi
                ;;
        -s | save)
		file=$HOME/Desktop/Screenshots/$(date +%d-%m-%Y_%H-%M-%S).png
                maim -us | tee $file |
                        xclip -selection clipboard -t image/png
		feh -U $file
		if [ $? -eq 0 ]; then
			notify-send --icon=$file 'Screenshot' 'Screenshot saved'
		else 
			sel_fail
			rm $file
		fi
                ;;
        *)
                echo "Take screenshots with maim"
                echo "---------------------------"
                echo "options:"
                echo "-c, copy          Take screenshot and copy it"
                echo "-s, save          Take screenshot of desired region or window and save"
                echo "-h, help          Display all available options"
                ;;
esac
