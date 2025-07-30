#!/bin/bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

LAT="49"
LON="9"

DATA=$(curl -sf "https://api.open-meteo.com/v1/forecast?latitude=${LAT}&longitude=${LON}&models=icon_seamless&current=temperature_2m,weather_code")
TEMP=$(echo "$DATA" | jq '.current.temperature_2m')
WEATHER=$(echo "$DATA" | jq '.current.weather_code')

if [ -z "$TEMP" ] || [ "$TEMP" = "null" ]; then
  TEMP="temp could not be parsed"
fi

echo $TEMP

ICON="$WEATHER_SUNNY"
WEATHER_COLOR=$CYAN
case "$WEATHER" in
0) ICON="$WEATHER_SUNNY" ;;
1 | 2 | 3) ICON="$WEATHER_OVERCAST" ;;
45 | 48) ICON="$WEATHER_FOG" ;;
51 | 53 | 55 | 80 | 81 | 82) ICON="$WEATHER_DAY_RAIN" ;;
61 | 63 | 65) ICON="$WEATHER_SHOWERS" ;;
71 | 73 | 75 | 77 | 85 | 86) ICON="$WEATHER_SNOW" ;;
95 | 96 | 99) ICON="$WEATHER_THUNDER" ;;
esac

LABEL="${ICON} ${TEMP}°C"
sketchybar --set $NAME \
  icon="$ICON" \
  icon.color="$WEATHER_COLOR" \
  background.padding_left=$NUMBER_BAR_SPACING \
  label="${TEMP}°C"
