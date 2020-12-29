#!/bin/bash
me="$(basename "$0")";
running=$(ps h -C "$me" | grep -wv $$ | wc -l);
[[ $running > 1 ]] && notify-send "Inhibitor Already Active"&& exit;

notify-send "Inhibitor" "Activated"
while sleep 30;  do xdotool keydown Shift_L keyup Shift_L; done

