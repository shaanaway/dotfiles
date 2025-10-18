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
    alias grep="grep -in --color"
    alias htop="btop"
    alias ls="eza --icons -al --group-directories-first"
    alias man="batman"
    alias mkdir="mkdir -p"
    alias mv="mv -i"
    alias rm="trash"
    alias sl="ls"
    alias v="nvim"
    starship init fish | source
end
