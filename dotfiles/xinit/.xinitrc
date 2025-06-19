#!/bin/bash

xrandr --output Virtual-1 --mode 1920x1080

pgrep -x sxhkd > /dev/null || sxhkd &

bspwm &

while ! bspc wm -g > /dev/null 2>&1; do sleep 0.1; done

kitty &

wait
