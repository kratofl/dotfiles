#!/bin/sh

volume_slider=(
  script="$PLUGIN_DIR/volume.sh"
  updates=on
  label.drawing=off
  icon.drawing=off
  slider.highlight_color=$HIGHLIGHT
  slider.background.height=5
  slider.background.corner_radius=3
  slider.background.color=$COLOR_BAR_FILL
  slider.knob=􀀁
  slider.knob.drawing=on
)

volume_icon=(
  click_script="$PLUGIN_DIR/volume_click.sh"
  icon=""
  background.padding_right=0
  icon.width=0
  icon.align=left
  label.align=left
)

status_bracket=(
  background.color=$COLOR_BAR_FILL
  background.border_color=$COLOR_BAR_FILL
)

sketchybar --add slider volume right            \
           --set volume "${volume_slider[@]}"   \
           --subscribe volume volume_change     \
                              mouse.clicked     \
           --add item volume_icon right         \
           --set volume_icon "${volume_icon[@]}"
