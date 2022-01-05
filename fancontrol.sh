#!/bin/bash

MIN_TEMP=45
GPIO_PIN=25

#https://www.cyberciti.biz/faq/linux-find-out-raspberry-pi-gpu-and-arm-cpu-temperature-command/
cputemp=$(</sys/class/thermal/thermal_zone0/temp)
#echo "$((cputemp/1000))"
let cpu=$cputemp/1000 

if [[ $cpu -ge $MIN_TEMP ]]; then
	echo "TEMP:$cpu MIN:$MIN_TEMP - On"
	raspi-gpio set $GPIO_PIN op dh
else
	echo "TEMP:$cpu MIN:$MIN_TEMP - Off"
	raspi-gpio set $GPIO_PIN op dl
fi
