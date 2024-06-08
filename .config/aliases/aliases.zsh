alias l='lsd'
alias lsa='lsd -a'
alias vimrc='nvim ~/.config/nvim/init.lua'
alias envrc='nvim ~/.env'
alias aliasrc='nvim ~/.config/aliases/aliases.zsh'
alias bootstraprc='nvim ~/.config/yadm/bootstrap'
alias vimrc="nvim ~/.config/nvim/init.lua"
alias zshrc="nvim ~/.zshrc"
alias myip="curl http://ipecho.net/plain; echo"

alias ljud="systemctl --user restart wireplumber pipewire pipewire-pulse"
alias dockerpurge="docker system prune -a --volumes"
alias dlog="docker compose -f /home/skogix/srv/docker-compose.yaml logs"
alias dtail="docker compose -f /home/skogix/srv/docker-compose.yaml logs -tf --tail="50" crowdsec"
alias dup="docker compose -f /home/skogix/srv/docker-compose.yaml up -d"
alias dprune="docker system prune -a --volumes"
alias dtop="oxker"
alias aliases="als"
alias sc='sudo SYSTEMD_EDITOR=/bin/vi /usr/bin/systemctl'
