#!/bin/sh

app=$(aerospace list-windows --focused | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set "$NAME" label="$INFO" icon.font="sketchybar-app-font:Regular:14.0" icon="$($CONFIG_DIR/plugins/icon_map.sh "$app")"
fi
