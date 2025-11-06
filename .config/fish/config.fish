set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"

set -gx ALTUSERXSESSION "$XDG_CACHE_HOME/X11/Xsession"
set -gx BROWSER "firefox"
set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
set -gx EDITOR "nvim" # ed users cope
set -gx ERRFILE "$XDG_CACHE_HOME/X11/xsession-errors"
set -gx ICEAUTHORITY "$XDG_CACHE_HOME/ICEauthority"
set -gx GOPATH "$XDG_DATA_HOME/go"
set -gx GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
set -gx GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -gx LESSHISTFILE "-"
set -gx LS_COLORS "$(vivid generate catppuccin-mocha)"
set -gx MANPAGER "bat"
set -gx NETHACKOPTIONS "$XDG_CONFIG_HOME/nethack/nethackrc"
set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
set -gx PAGER "bat"
set -gx QT_QPA_PLATFORMTHEME "qt5ct"
set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -gx TERMINAL "ghostty"
set -gx TEXMFHOME "$XDG_DATA_HOME/texmf"
set -gx TEXMFVAR "$XDG_CACHE_HOME/texlive/texmf-var"
set -gx USERXSESSION "$XDG_CACHE_HOME/X11/xsession"
set -gx USERXSESSIONRC "$XDG_CACHE_HOME/X11/xsessionrc"
set -gx VISUAL "nvim"
set -gx WGETRC "$XDG_CONFIG_HOME/wget/wgetrc"
set -gx WINEPREFIX "$XDG_DATA_HOME/wine/prefix"
set -gx XAUTHORITY "$XDG_RUNTIME_DIR/Xauthority"
set -gx XINITRC "$XDG_CONFIG_HOME/X11/xinitrc"

if status is-interactive
    set -g fish_greeting ""
    fish_vi_key_bindings

    abbr --add ufv cd ~/Media/Documents/school/ufv
    abbr --add code cd ~/.local/clone
    abbr --add cmd command # \alias doesn't work like in zsh u gotta use this
    alias cat="bat -p"
    alias cp="cp -i"
    alias cpcwd="echo -n \$PWD | wl-copy"
    alias ed="ed -p '> '" # the standard unix text editor.
    alias grep="grep -i --color"
    alias htop="btop"
    alias ls="eza --icons -al --group-directories-first"
    alias man="batman"
    alias mkdir="mkdir -p"
    alias mv="mv -i"
    alias rm="trash"
    alias sl="ls"
    alias v="nvim"
    starship init fish | source
    if not set -q TMUX
        tmux new-session -t 0
    end
end
