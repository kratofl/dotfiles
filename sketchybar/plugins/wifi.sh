#!/bin/bash

source "$CONFIG_DIR/icons.sh"
SSID=$(ipconfig getsummary en1 | awk -F ' SSID : ' '/ SSID : / {print $2}')

if [ -z "$SSID" ]; then
  LABEL="No WiFi"
  ICON=$WIFI_DISCONNECTED
else
  LABEL=$SSID
  ICON=$WIFI_CONNECTED
fi

sketchybar --set $NAME icon="$ICON" label="$LABEL"
