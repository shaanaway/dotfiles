#!/bin/sh
# gets rid of the antialiasing but idc honestly
conf="${XDG_CONFIG_HOME:-$HOME/.config}/theme"
magick "${conf}/dark.png" -alpha set -fuzz 35% -fill "#1E66F5" -opaque "#96CDFB" -fuzz 35% -fill "#EFF1F5" -opaque "#1E1E2E" -resize 400% -resize 25% "${conf}/light.png"
