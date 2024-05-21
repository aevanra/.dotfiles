#! /bin/bash

feh --bg-fill $(ls /home/aevan/Pictures/wallpapers/portrait/ | echo /home/aevan/Pictures/wallpapers/portrait/$(shuf -n 1)) \
    --bg-fill $(ls /home/aevan/Pictures/wallpapers/landscape/ | echo /home/aevan/Pictures/wallpapers/landscape/$(shuf -n 1)) \
    --bg-fill $(ls /home/aevan/Pictures/wallpapers/landscape/ | echo /home/aevan/Pictures/wallpapers/landscape/$(shuf -n 1))
