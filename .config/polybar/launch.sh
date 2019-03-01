#!/bin/bash

monitorOutput="$(xrandr --listactivemonitors | wc -l)"
monitorCount=$((${monitorOutput}-1))
echo "Monitor Count: ${monitorCount}"
if (( $monitorCount == 1 )); then
	~/.config/polybar/single-monitor.sh
else
	~/.config/polybar/multi-monitor.sh
fi
