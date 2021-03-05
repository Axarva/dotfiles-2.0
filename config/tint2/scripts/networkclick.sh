#!/bin/zsh

x=$(nmcli -a | grep 'Wired connection' | awk 'NR==1{print $1}')
y=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -c 5-)

if [ -z "$x" ] && [ -z "$y" ]; then
    notify-send "Not Connected" -i ~/.config/dunst/images/no-connection.png
    exit 1
elif [ -z "$x" ]; then 
    notify-send "Connected to $y" -i ~/.config/dunst/images/wifi.png
    exit 1
elif [ -z "$y" ]; then
    notify-send "Connected to $x" -i ~/.config/dunst/images/ethernet.png
    exit 1
fi
