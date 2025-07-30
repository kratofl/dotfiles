#!/bin/bash

if pmset -g batt | grep -q "Battery Power"; then
  battery=(
    script="$PLUGIN_DIR/battery.sh"
    icon.font="$FONT:Regular:19.0"
    padding_right=3
    padding_left=0
    label.drawing=off
    update_freq=120
    updates=on
  )
  sketchybar --add item battery right \
            --set battery "${battery[@]}"\
                icon.font.size=15 update_freq=120 script="$PLUGIN_DIR/battery.sh" \
            --subscribe battery power_source_change system_woke
fi

sketchybar --add item ram right \
           --set ram update_freq=2 \
           script="$PLUGIN_DIR/ram.sh"
sketchybar --add item cpu right \
           --set cpu update_freq=2 \
           script="$PLUGIN_DIR/cpu.sh"

status_bracket=(
  background.color=$COLOR_ITEM_NORMAL_FILL
)

sketchybar --add bracket status cpu ram battery \
           --set status "${status_bracket[@]}"