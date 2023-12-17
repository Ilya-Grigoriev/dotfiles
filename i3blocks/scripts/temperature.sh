degrees=$(cat /sys/class/thermal/thermal_zone0/temp)
degrees_format=$((degrees/1000))

printf "Temp: %'.0f°C\n" $degrees_format
printf "Temp: %'.0f°C\n" $degrees_format

if (( degrees_format > 65 )); then
    echo "#EF4040"
fi

exit 0
