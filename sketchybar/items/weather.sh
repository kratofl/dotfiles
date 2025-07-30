#!/bin/sh

sketchybar --add item weather right \
           --set weather update_freq=1200 \
           script="$PLUGIN_DIR/weather.sh"