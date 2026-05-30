# Better ls
alias ls="eza -lh --group-directories-first --icons=always"

# Detailed listing
alias ll='eza -lh --icons --git'

# Detailed listing including hidden files
alias la='eza -lah --icons --git'

# Tree view
alias tree='eza --tree --icons'

# Reuse ls completions for eza (avoids defining a separate completion function)
compdef eza=ls

# Better cat
alias cat='bat'

# =========================================================
# Core utilities
# =========================================================

alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'

# =========================================================
# Navigation
# =========================================================

alias -- -='cd -'  # -- prevents - being parsed as a flag; cd - jumps to previous directory

# =========================================================
# Editor
# =========================================================

alias vim='nvim'

# =========================================================
# Git
# =========================================================

alias glog='PAGER="less -F -X" git log'                              # -F quit if one screen, -X no clear on exit
alias gadog='PAGER="less -F -X" git log --all --decorate --oneline --graph'


# =========================================================
# Fzf and Pacman
# =========================================================

alias fzf='fzf --height 80% --layout reverse --border'
alias pacman-info="pacman -Qq | fzf --preview 'pacman -Qi {}'"
alias pacman-install="pacman -Sl | awk '{print \$2}' | fzf -m --preview 'pacman -Si {}' --layout=reverse | xargs -ro sudo pacman --needed -S"
alias yay-install="yay -Sl | awk '{print \$2}' | fzf -m --preview 'yay -Si {}' --layout=reverse | xargs -ro yay --needed -S"
alias pacman-uninstall="pacman -Qq | fzf -m --preview 'pacman -Si {}' --layout=reverse | xargs -ro sudo pacman -Rsc"

# =========================================================
# Yt-dlp
# =========================================================
alias yt-dlp='yt-dlp --cookies-from-browser brave+gnomekeyring:~/.config/BraveSoftware/Brave-Origin-Beta/'

