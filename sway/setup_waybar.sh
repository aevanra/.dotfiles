if pgrep -x waybar > /dev/null; then
  killall -q waybar
  sleep 1
fi

waybar &
