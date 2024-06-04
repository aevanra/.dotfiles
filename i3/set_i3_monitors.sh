
# Monitors left to right -- DP-0, HDMI-1, DP-2
xrandr --output DP-0 --auto --pos 0x0 --rotate left
xrandr --output DP-2 --auto --pos 3000x120 --rotate normal
xrandr --output HDMI-1 --auto --pos 1080x480 --rotate normal

xrandr --output DP-2 --primary
