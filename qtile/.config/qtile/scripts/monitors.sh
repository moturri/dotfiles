#!/bin/bash

xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1

xset -b

primaryMonitor="eDP1"
secondMonitor="DP1"

if xrandr | grep -q "${secondMonitor} connected"; then
    xrandr --output "${secondMonitor}" --mode "1680x1050" --left-of "${primaryMonitor}"
else
    xrandr --output "${secondMonitor}" --off
fi

