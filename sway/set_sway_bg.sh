#! /bin/bash

wp_home="/home/aevan/Pictures/wallpapers"
sway_bgs=$wp_home/sway_bgs
l1=$(ls $wp_home/landscape/ | echo $wp_home/landscape/"$(shuf -n 1)")
l2=$(ls $wp_home/landscape/ | echo $wp_home/landscape/"$(shuf -n 1)")
p=$(ls $wp_home/portrait/ | echo $wp_home/portrait/"$(shuf -n 1)")

while [ "$l1" == "$l2" ]; do
    l2=$(ls /home/aevan/Pictures/wallpapers/landscape/ | echo /home/aevan/Pictures/wallpapers/landscape/"$(shuf -n 1)")
done

rm -rf ${sway_bgs:?}/*

mkdir $sway_bgs/DP-2 && cp "$l1" $sway_bgs/DP-2/_default.jpg
mkdir $sway_bgs/DP-3 && cp "$p" $sway_bgs/DP-3/_default.jpg
mkdir $sway_bgs/HDMI-A-1 && cp "$l2" $sway_bgs/HDMI-A-1/_default.jpg

multibg-wayland $sway_bgs &

wal -i $l1 -n -b 000000

