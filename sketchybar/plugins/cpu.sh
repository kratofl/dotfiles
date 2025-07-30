#!/bin/bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

CORES=$(sysctl -n hw.ncpu)
CPU_LOAD_SUM=$(ps -A -o %cpu | awk '{s+=$1} END {print s}')
CPU_LOAD_AVG=$(echo "$CPU_LOAD_SUM / $CORES" | bc -l)
CPU_LOAD_AVG_INT=$(printf "%.0f" $CPU_LOAD_AVG)

if [ "$CPU_LOAD_AVG_INT" -ge 90 ]; then
  COLOR=$RED
elif [ "$CPU_LOAD_AVG_INT" -ge 70 ]; then
  COLOR=$ORANGE
elif [ "$CPU_LOAD_AVG_INT" -ge 40 ]; then
  COLOR=$YELLOW
else
  COLOR=$GREEN
fi

sketchybar --set $NAME icon="$CPU" label="${CPU_LOAD_AVG_INT}%" background.color=$TRANSPARENT icon.color=$COLOR background.padding_right=0 background.border_color=$TRANSPARENT
