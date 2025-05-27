#!/bin/sh

browse=""
chat="ﭮ"
code=""
deploy=""
music=""
other=""
firefox=""

# if [ "$(xrandr -q | grep -c "HDMI-1 connected")" -ge 1 ]; then
#     bspc monitor HDMI-1 -d "$browse" "$chat" 
#     bspc monitor eDP-1 -d "$code" "$deploy" "$music" "$other"
# else
#     bspc monitor eDP-1 -d "$browse" "$chat" "$code" "$deploy" "$music" "$other"
#     bspc monitor HDMI-1 -r
# fi
laptop="eDP1"
laptop_connected=$(xrandr -q | grep -c "$laptop connected")

# hybrid_laptop="eDP-1"
# hybrid_hdmi="HDMI-1"
# hybrid_usb="DP-1-0"
hybrid_laptop="eDP"
hybrid_hdmi="HDMI-A-0"
hybrid_usb="DP-1-0"

hybrid_laptop_connected=$(xrandr -q | grep -c "$hybrid_laptop connected")
hybrid_hdmi_connected=$(xrandr -q | grep -c "$hybrid_hdmi connected")
hybrid_usb_connected=$(xrandr -q | grep -c "$hybrid_usb connected")


nvidia_laptop="eDP-1-1"
nvidia_hdmi="HDMI-1-1"
nvidia_usb="DP-0"

nvidia_laptop_connected=$(xrandr -q | grep -c "$nvidia_laptop connected")
nvidia_hdmi_connected=$(xrandr -q | grep -c "$nvidia_hdmi connected")
nvidia_usb_connected=$(xrandr -q | grep -c "$nvidia_usb connected")

if [ "$laptop_connected" -ge 1 ]; then
  bspc monitor "$laptop" -d "$browse" "$chat" "$code" "$deploy" "$music" "$other"
elif [ "$hybrid_laptop_connected" -ge 1 ]; then
  if [ "$hybrid_hdmi_connected" -ge 1 ] || [ "$hybrid_usb_connected" -ge 1 ]; then
    if [ "$hybrid_hdmi_connected" -ge 1 ] && [ "$hybrid_usb_connected" -ge 1 ]; then
      bspc monitor "$hybrid_hdmi" -d "$firefox"
      bspc monitor "$hybrid_laptop" -d "$browse" "$code" "$deploy" "$music" "$other"
      bspc monitor "$hybrid_usb" -d "$chat"
    elif [ "$hybrid_hdmi_connected" -ge 1 ]; then
      bspc monitor "$hybrid_hdmi" -d "$firefox"
      bspc monitor "$hybrid_laptop" -d "$browse" "$chat" "$code" "$deploy" "$music" "$other"
    else
      bspc monitor "$hybrid_laptop" -d "$browse" "$code" "$deploy" "$music" "$other"
      bspc monitor "$hybrid_usb" -d "$chat"
    fi
  else
    bspc monitor "$hybrid_laptop" -d "$browse" "$chat" "$code" "$deploy" "$music" "$other"
  fi
elif [ "$nvidia_laptop_connected" -ge 1 ]; then
  if [ "$nvidia_hdmi_connected" -ge 1 ] || [ "$nvidia_usb_connected" -ge 1 ]; then
    if [ "$nvidia_hdmi_connected" -ge 1 ] && [ "$nvidia_usb_connected" -ge 1 ]; then
      bspc monitor "$nvidia_hdmi" -d "$browse"
      bspc monitor "$nvidia_laptop" -d "$code" "$deploy" "$music" "$other"
      bspc monitor "$nvidia_usb" -d "$chat"
    elif [ "$nvidia_hdmi_connected" -ge 1 ]; then
      bspc monitor "$nvidia_hdmi" -d "$browse" "$chat"
      bspc monitor "$nvidia_laptop" -d "$code" "$deploy" "$music" "$other"
    else
      bspc monitor "$nvidia_laptop" -d "$browse" "$code" "$deploy" "$music" "$other"
      bspc monitor "$nvidia_usb" -d "$chat"
    fi
  else
    bspc monitor "$nvidia_laptop" -d "$browse" "$code" "$deploy" "$music" "$other" "$chat"
  fi
fi
~/.config/polybar/shapes/launch.sh &
