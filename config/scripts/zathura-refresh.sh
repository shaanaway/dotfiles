#!/bin/sh
#sooo damn extra
set -eux
pids=$(hyprctl clients -j | jq '.[] | select(.class=="org.pwmt.zathura") | .pid')
for pid in $pids; do
        filename=$(busctl --user get-property org.pwmt.zathura.PID-"${pid}" /org/pwmt/zathura org.pwmt.zathura filename | sed 's/^s //' | sed 's/"\(.*\)"/\1/')
        page=$(busctl --user get-property org.pwmt.zathura.PID-"${pid}" /org/pwmt/zathura org.pwmt.zathura pagenumber | sed 's/^u //')
        echo "filename: $filename"
        echo "page: $page"
        kill "$pid"
        zathura --fork -P "$page" "$filename"
done
