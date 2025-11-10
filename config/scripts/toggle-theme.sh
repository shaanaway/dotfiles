#!/bin/sh
conf_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
mode=$(gsettings get org.gnome.desktop.interface color-scheme | sed "s/.*-\(.*\)'/\1/g")

case $1 in
        dark | mocha) mode=light ;;
        light | latte) mode=dark ;;
        toggle | "") ;;
        *) >&2 echo "Invalid command: not one of [dark, mocha, light, latte, toggle] and not empty" ;;
esac
if [ $mode = "dark" ]; then
        new_mode="light"
        flavour="latte"
        gsettings set org.gnome.desktop.interface gtk-theme 'catppuccin-latte-blue-standard+default'
else
        new_mode="dark"
        flavour="mocha"
        gsettings set org.gnome.desktop.interface gtk-theme 'catppuccin-mocha-blue-standard+default'
fi

# its like 50/50 on if apps can hot reload
# of the symlinked ones only hyprland can sigh
gsettings set org.gnome.desktop.interface color-scheme "prefer-${new_mode}"
swww img -t grow --transition-pos 1.0,1.0 --transition-duration 1 "${conf_dir}"/theme/${new_mode}.png
hyprctl setcursor catppuccin-${flavour}-${new_mode}-cursors 24
ln -sf "${conf_dir}"/hypr/${new_mode}.conf "${conf_dir}"/hypr/theme.conf
ln -sf "${conf_dir}"/aerc/stylesets/catppuccin-${flavour} "${conf_dir}"/aerc/stylesets/theme
ln -sf "${conf_dir}"/rofi/${new_mode}.rasi "${conf_dir}"/rofi/theme.rasi
ln -sf "${conf_dir}"/starship/${new_mode}.toml "${conf_dir}"/starship.toml
ln -sf "${conf_dir}"/imv/${new_mode} "${conf_dir}"/config
ln -sf "${conf_dir}"/wlogout/style-${new_mode}.css "${conf_dir}"/wlogout/style.css
ln -sf "${conf_dir}"/btop/themes/${flavour}.theme "${conf_dir}"/btop/themes/theme.theme
ln -sf "${conf_dir}"/newsboat/${new_mode} "${conf_dir}"/newsboat/theme
fish -c "set -Ux LS_COLORS \$(vivid generate catppuccin-${flavour})"
spicetify config color_scheme ${flavour}
# closes app if running, pauses music
# uncomment if thats cool otherwise run manually
#spicetify apply
sed -i "s/${mode}/${new_mode}/" "${conf_dir}"/bat/config
