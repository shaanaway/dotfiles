#!/bin/sh
album_art=$(playerctl -p spotify metadata mpris:artUrl)
if [ -z "$album_art" ]; then
        # spotify is dead, we should die too.
        exit
fi
file="${XDG_RUNTIME_DIR}"/cover.jpg
delta=$(($(date +%s) - $(date -r "${file}" +%s)))

if [ $delta -le 30 ]; then
        echo "${file}"
        exit
fi

curl -s "${album_art}" --output "${file}"
echo "${file}"
