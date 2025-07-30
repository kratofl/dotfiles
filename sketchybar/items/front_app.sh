#!/bin/sh

front_app=(
  label.font="$FONT:Bold:12.0"
  icon.background.drawing=on
  display=active
  script="$PLUGIN_DIR/front_app.sh"
  label.color=$COLOR_ITEM_NORMAL_TEXT
)
sketchybar --add item front_app center         \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched

