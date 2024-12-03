
# Monitors left to right -- DP-0, HDMI-1, DP-2
xrandr --output DP-0 --auto --pos 0x0 --rotate left --rate 75
xrandr --output DP-2 --auto --pos 3640x120 --rotate normal --rate 240
xrandr --output HDMI-1 --auto --pos 1080x120 --rotate normal --rate 144

xrandr --output HDMI-0 --off

xrandr --output DP-2 --primary
