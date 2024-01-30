function 4k --description 'toggle external monitor resolution'
  if test (xrandr -q | grep ' connected' | sed -n 2p | awk '{print $3}') = '1920x1080+0+0'
    xrandr --output eDP-1 --primary --mode 1920x1080 --rotate normal --output HDMI-1 --mode 3840x2160 --rotate normal --above eDP-1
  else
    xrandr --output eDP-1 --primary --mode 1920x1080 --rotate normal --output HDMI-1 --mode 1920x1080 --rotate normal --above eDP-1
  end
  dual-display.sh
end
