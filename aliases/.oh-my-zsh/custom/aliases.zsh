alias nvim='bob run nightly'

alias fzf='fzf --height 80% --layout reverse --border'

alias pinfo="pacman -Qq | fzf --preview 'pacman -Qi {}'"
alias pinstall="pacman -Sl | awk '{print \$2}' | fzf -m --preview 'pacman -Si {}' --layout=reverse | xargs -ro sudo pacman --needed -S"
alias puninstall="pacman -Qq | fzf -m --preview 'pacman -Si {}' --layout=reverse | xargs -ro sudo pacman -Rsc"

alias me-btw="figlet GAugusto"

alias ls="eza -lh --group-directories-first --icons=always"
