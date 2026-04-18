alias fzf='fzf --height 80% --layout reverse --border'

alias pacman-info="pacman -Qq | fzf --preview 'pacman -Qi {}'"
alias pacman-install="pacman -Sl | awk '{print \$2}' | fzf -m --preview 'pacman -Si {}' --layout=reverse | xargs -ro sudo pacman --needed -S"
alias yay-install="yay -Sl | awk '{print \$2}' | fzf -m --preview 'yay -Si {}' --layout=reverse | xargs -ro yay --needed -S"
alias pacman-uninstall="pacman -Qq | fzf -m --preview 'pacman -Si {}' --layout=reverse | xargs -ro sudo pacman -Rsc"

alias me-btw="figlet GAugusto"

alias ls="eza -lh --group-directories-first --icons=always"
