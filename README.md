# My dotfiles!

I can't make any promises of quality, functionality, or aesthetic beauty, but I like them.
I don't know if these files are copyrightable, but if they are, they're CC0.

This config is based on a keyboard-driven workflow, with mouse control when it makes sense.
My "work"flow is mostly homework, games, and TV. I like tinkerable, DIY stuff.
Lots of this config is not portable, but of course feel free to take any snippets you like.

* Arch Linux
* Hyprland WM
* Ghostty w/ Tmux
* Firefox
* Neovim
* Fish
* Whatever else piques my interest at any given time

## Installation
These files are managed with [GNU Stow](https://www.gnu.org/software/stow/)
``` sh
git clone https://github.com/shaanaway/dotfiles ~/dots
cd ~/dots

# reverted by replacing `-R` with `-D`
stow -t ~/.config -R config
sudo stow  -t /etc -R etc

# or use the helper
# revert with unxdg/unetc
./stow.sh xdg
./stow.sh etc
```
