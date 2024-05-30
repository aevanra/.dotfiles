#! /bin/zsh 

landscape1=$(ls /home/aevan/Pictures/wallpapers/landscape/ | echo /home/aevan/Pictures/wallpapers/landscape/$(shuf -n 1))
landscape2=$(ls /home/aevan/Pictures/wallpapers/landscape/ | echo /home/aevan/Pictures/wallpapers/landscape/$(shuf -n 1))

while [ landscape1 == landscape2 ]; do
    landscape2 = $(ls /home/aevan/Pictures/wallpapers/landscape/ | echo /home/aevan/Pictures/wallpapers/landscape/$(shuf -n 1))
done

feh \
    --bg-fill $landscape1 \
    --bg-fill $(ls /home/aevan/Pictures/wallpapers/portrait/ | echo /home/aevan/Pictures/wallpapers/portrait/$(shuf -n 1)) \
    --bg-fill $landscape2 \
