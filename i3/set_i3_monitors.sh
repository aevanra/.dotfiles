
# Monitors left to right -- DP-0, HDMI-1, DP-2
xrandr --output DisplayPort-2 --auto --pos 0x0 --rotate left --rate 75
xrandr --output DisplayPort-1 --auto --pos 3640x120 --rotate normal --rate 240
xrandr --output HDMI-A-0 --auto --pos 1080x120 --rotate normal --rate 144

xrandr --output DisplayPort-0 --primary
