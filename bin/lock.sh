#!/usr/bin/env zsh
xset s 240 &
xautolock -time 2 -locker "betterlockscreen -l" -notify 30 -notifier "notify-send 'Locker' 'Locking screen in 30 seconds'" -killtime 5 -killer "loginctl suspend"
#xautolock -time 2 -locker "systemctl suspend"
