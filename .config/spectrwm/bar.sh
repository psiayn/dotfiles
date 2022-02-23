#!/bin/sh

if pgrep -x "trayer" > /dev/null
then
    killall trayer
else
    trayer --align right --monitor primary --width 200 --widthtype pixel --height 25 --transparent true --alpha 0 --tint 0x1e1e2e --distance 600 --distancefrom left
fi
