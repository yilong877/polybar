#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done
# multiple monitors
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d " " -f1); do
        MONITOR=$m polybar basebar --config=$HOME/.config/i3/polybar/config &
    done
else
    polybar basebar --config=$HOME/.config/i3/polybar/config &
fi
# polybar basebar --config=$HOME/.config/i3/polybar/config &
