#!/bin/bash

BAT=$(acpi -b | grep -E -o '[0-9]?[0-9]?[0-9]?%')
STATUS_BAT=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | cut -d ':' -f2 | xargs)

# Full and short texts
echo "BAT: $BAT"
echo "BAT: $BAT"

if [ $STATUS_BAT != "discharging" ]
then
    echo "#65B741"
elif (( ${BAT%?}<5 ))
then
    exit 33
elif (( ${BAT%?}<15 ))
then
    echo "#FFA732"
elif (( ${BAT%?}>15 ))
then
    echo "#F3F8FF"
fi

exit 0
