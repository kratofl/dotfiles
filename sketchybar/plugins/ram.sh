#!/bin/bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

TOTAL=$(sysctl -n hw.memsize)
USED=$(vm_stat | awk '
  /Pages active/        {active=$3}
  /Pages speculative/   {spec=$3}
  /Pages wired down/    {wired=$4}
  /Pages occupied by compressor/ {compr=$5}
  END {
    print (active+spec+wired+compr)*4096
  }' | sed 's/\.//g')

if [ -z "$USED" ]; then
  USED=$(vm_stat | awk '/Pages active/ {active=$3} /Pages speculative/ {spec=$3} /Pages wired/ {wired=$4} END {print (active+spec+wired)*4096}' | sed 's/\.//g')
fi

PERCENT=$(echo "$USED * 100 / $TOTAL" | bc)

if [ "$PERCENT" -ge 90 ]; then
  COLOR=$RED
elif [ "$PERCENT" -ge 70 ]; then
  COLOR=$ORANGE
elif [ "$PERCENT" -ge 40 ]; then
  COLOR=$YELLOW
else
  COLOR=$GREEN
fi

sketchybar --set $NAME icon="$RAM" label="${PERCENT}%" background.color=$TRANSPARENT icon.color=$COLOR background.padding_right=0 background.border_color=$TRANSPARENT