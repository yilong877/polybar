#!/bin/bash
killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done
monitor_counter=`xrandr -q | grep -w 'connected' | wc -l`
if [ $monitor_counter -ne 1 ]; then
    MONITOR=DP-0 polybar mainbar --config=$HOME/.config/i3/polybar/config &
    MONITOR=HDMI-0 polybar secondbar --config=$HOME/.config/i3/polybar/config &
else
    MONITOR=DP-0 polybar mainbar --config=$HOME/.config/i3/polybar/config &
fi
