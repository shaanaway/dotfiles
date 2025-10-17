if status is-interactive
    set -g fish_greeting ""
    fish_vi_key_bindings
    abbr --add ufv cd ~/Media/Documents/school/ufv
    abbr --add code cd ~/.local/clone
    alias cat="bat -p"
    alias mv="mv -i"
    alias cp="cp -i"
    alias cpcwd="echo -n \$PWD | wl-copy"
    alias grep="grep -in --color"
    alias htop="btop"
    alias ls="eza --icons -al --group-directories-first"
    alias man="batman"
    alias mkdir="mkdir -p"
    alias rm="trash"
    alias sl="ls"
    alias v="nvim"
    starship init fish | source
end
