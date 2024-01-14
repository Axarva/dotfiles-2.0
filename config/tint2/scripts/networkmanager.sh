#!/bin/sh

# A dwm_bar function to show the current network connection/SSID, private IP, and public IP using NetworkManager
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: NetworkManager, curl

SIG=$(nmcli -t -f SIGNAL,ACTIVE dev wifi list | grep "yes" | awk '{gsub(/[^0-9]/, "", $1); print int($1)}' | head -n 1)
    printf "%s" "$SEP1"
	
printf "%s" "$SEP1"
if [ "$SIG" == "" ]; then
    printf "󰤩 "
elif [ "$SIG" -le 20 ]; then
    printf "󰤯 "
elif [ "$SIG" -le 40 ]; then
    printf "󰤟 "
elif [ "$SIG" -le 60 ]; then
    printf "󰤢 "
elif [ "$SIG" -le 80 ]; then
    printf "󰤥 "
else
    printf "󰤨 "
fi
printf "%s" #"$SEP2"
