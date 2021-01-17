#!/usr/bin/env zsh
xset s 500 &
xautolock -time 5 -locker "betterlockscreen -l" -notify 30 -nodtifier "notify-send 'Locker' 'Locking screen in 30 seconds'" -killtime 5 -killer "loginctl suspend"
#xautolock -time 2 -locker "systemctl suspend"
