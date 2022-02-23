#!/bin/sh

volume() {
    if [ "$(pamixer --get-mute)" = "true" ]; then
        echo 'M'
    else
        echo $(pamixer --get-volume)
    fi

}

bat_per() {
    cat /sys/class/power_supply/BAT0/capacity
}

bat_stat() {
    cat /sys/class/power_supply/BAT0/status
}

while true; do
    echo "+|1R +@fg=1;[+@fg=0;  $(bat_per)% $(bat_stat)+@fg=1;] [墳+@fg=0; $(volume)+@fg=1;] [ +@fg=0;$(date +'%d-%m-%Y')+@fg=1;] [ +@fg=0;$(date +'%I:%M %p')+@fg=1;]"
    sleep 0.25
done
