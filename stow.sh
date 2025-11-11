#!/bin/sh
cd "$(dirname "$0")" || exit
conf_dir=${XDG_CONFIG_HOME:-$HOME/.config}

colour='\033[1;36m'
reset='\033[0m'
case $1 in
        xdg) stow -t "$conf_dir" -R config ;;
        etc) sudo stow -t /etc -R etc ;;
        unxdg) stow -t "$conf_dir" -D config ;;
        unetc) sudo stow -t /etc -D etc ;;
        *) >&2 printf "%s" "valid arguments are:
${colour}xdg${reset}, ${colour}etc${reset}, ${colour}unxdg${reset}, ${colour}unetc${reset}\n" ;;
esac
