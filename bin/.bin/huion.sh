#!/bin/sh

monitor=eDP1
monitor_connected=$(xrandr -q | grep -c "$monitor connected")

hdmi_nvidia="HDMI-0"
hdmi_nvidia_connected=$(xrandr -q | grep -c "$hdmi_nvidia connected")
monitor_nvidia=eDP-1-1
monitor_nvidia_connected=$(xrandr -q | grep -c "$monitor_nvidia connected")

monitor_mixed=eDP-1
monitor_mixed_connected=$(xrandr -q | grep -c "$monitor_mixed connected")
hdmi_mixed="HDMI-1-0"
hdmi_mixed_connected=$(xrandr -q | grep -c "$hdmi_mixed connected")

browse=""
chat=""
code=""
deploy=""
music=""
other=""
firefox=""

# bspc monitor -d "$browse" "$chat" "$code" "$deploy" "$music" "$other"
if [ "$(xrandr -q | grep -c "HDMI-0 connected")" -ge 1 ]; then
        if [ "$(xrandr -q | grep -c "DP-1 connected")" -ge 1 ]; then
            bspc monitor HDMI-0 -d "$browse" "$music"
            bspc monitor eDP-1-1 -d "$code" "$deploy"
            bspc monitor DP-1 -d "$chat" "$other"
            #custom rules
            bspc rule -a Google-chrome-stable desktop=^1
            bspc rule -a spotify desktop=^2
            bspc rule -a slack desktop=^5
        else
            bspc monitor HDMI-0 -d "$browse" "$chat"
            bspc monitor eDP-1-1 -d "$code" "$deploy" "$music" "$other"
        fi
elif [ "$(xrandr -q | grep -c "HDMI-1-1 connected")" -ge 1 ]; then
    bspc monitor HDMI-1-1 -d 1 2 3
    bspc monitor eDP-1 -d 4 5 6
elif [ "$(xrandr -q | grep -c "HDMI-1-0 connected")" -ge 1 ]; then
    xrandr --output "$monitor_mixed" --primary --mode 1920x1080 --rotate normal --output "$hdmi_mixed" --mode 1920x1080 --rotate right --left-of "$monitor_mixed"
    # xrandr --output "$monitor_mixed" --primary --mode 1920x1080 --rotate normal --output "$hdmi_mixed" --off
    echo 'setting external display as chat viewer'
    bspc monitor HDMI-1-0 -d "$chat"
    bspc monitor eDP-1 -d "$browse" "$code" "$deploy" "$music" "$other"
else
    echo 'else'
    bspc monitor eDP-1 -d "$browse" "$code" "$deploy" "$chat" "$music" "$other"
fi
~/.config/polybar/shapes/launch.sh &
