#!/bin/sh

swaymsg -t get_inputs | grep -m1 'xkb_active_layout_name' | cut -d '"' -f4

#echo "$(swaymsg -t get_inputs | grep -m1 'xkb_active_layout_name' | cut -d '"' -f4)"  | grep -m1 "Developer" | printf '{"class":"developer"}'
