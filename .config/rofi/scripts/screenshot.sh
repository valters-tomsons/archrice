#!/bin/bash

# Copy image to clipboard
function copyimage {
	IMAGE_TYPE=$(file -b --mime-type "$1")
	xclip -selection clipboard -t "$IMAGE_TYPE" < "$1"
}

rofi_command="rofi -theme themes/screenshot.rasi"

# Options
screen=""
area=""
window=""

# Variable passed to rofi
options="$screen\n$area\n$window"
chosen="$(echo -e "$options" | $rofi_command -p '' -dmenu -selected-row 1)"

timestamp=$(date +'%d-%m-%Y_%T')

case $chosen in 
	$screen)
		# sleep 1;
		scrot 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'export file=$f';
		echo $file;
		# mv $f $(xdg-user-dir PICTURES)/Screenshots;
	       	# copyimage $(xdg-user-dir PICTURES)/Screenshots/$f
		;;
	$area)
		scrot -s 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f $$(xdg-user-dir PICTURES)/Screenshots ;
		copyimage $$(xdg-user-dir PICTURES)/Screenshots/$f'
		;;
	$window)
		sleep 1;
		scrot -u 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f $$(xdg-user-dir PICTURES)/Screenshots ;
		copyimage $$(xdg-user-dir PICTURES)/Screenshots/$f'
		;;
esac
