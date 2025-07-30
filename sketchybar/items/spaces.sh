#!/bin/sh

sketchybar --add event aerospace_workspace_change

spaces_ids=( )
for m in $(aerospace list-monitors | awk '{print $1}'); do
  for i in $(aerospace list-workspaces --monitor $m); do
    sid=$i

    source "$CONFIG_DIR/icons.sh"
    case $sid in
      "code") icon=$CODE ;;
      "terminal") icon=$TERMINAL ;;
      "comms") icon=$SEND ;;
      "web") icon=$FIREFOX ;;
      "music") icon=$MUSIC ;;
      "notes") icon=$NOTES ;;
      "data") icon=$DATA ;;
      "debug") icon=$BUG ;;
      "other") icon=$PERSON ;;
      *) icon=$HOME
    esac

    space=(
      space="$sid"
      icon="$icon"
      height=$NUMBER_ITEM_HEIGHT
      background.color=$COLOR_SPACE_FILL
      background.padding_right=0
      display=$m
      icon.padding_right=0
      label.padding_right=0
      background.border_color=$TRANSPARENT
      script="$PLUGIN_DIR/space.sh"
    )

    sketchybar --add space space.$sid left \
               --set space.$sid "${space[@]}" \
               --subscribe space.$sid mouse.clicked

    spaces_ids+=( "space.$sid" )
  done
done

spaces_bracket=(
  background.color=$COLOR_ITEM_NORMAL_FILL
)

sketchybar --add bracket spaces "${spaces_ids[@]}" \
           --set spaces "${spaces_bracket[@]}"

space_creator=(
  label.drawing=off
  display=active
  script="$PLUGIN_DIR/space_windows.sh"
  icon.color=$COLOR_ITEM_NORMAL_ICON
  background.color=$TRANSPARENT
  background.border_color=$TRANSPARENT
)

sketchybar --add item space_creator left              \
           --set space_creator "${space_creator[@]}"   \
           --subscribe space_creator aerospace_workspace_change