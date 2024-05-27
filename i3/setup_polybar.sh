if $(pgrep -x polybar > /dev/null); then
  killall -q polybar
  sleep 1
fi

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload main &
    done
else
  polybar --reload main &
fi
