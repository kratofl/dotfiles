#!/bin/bash

source "$CONFIG_DIR/icons.sh"

calendar=(
  label.align=right
  icon="$CALENDAR"
  update_freq=5
  script="$PLUGIN_DIR/calendar.sh"
  click_script="$PLUGIN_DIR/zen.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
