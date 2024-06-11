alias l='lsd'
alias lsa='lsd -a'
alias vimrc='nvim ~/.config/nvim/init.lua'
alias envrc='nvim ~/.env'
alias aliasrc='nvim ~/.config/aliases/aliases.zsh'
alias bootstraprc='nvim ~/.config/yadm/bootstrap'
alias dockerrc='nvim ~/srv/docker-compose.yml'
alias vimrc="nvim ~/.config/nvim/init.lua"
alias zshrc="nvim ~/.zshrc"

alias myip="curl http://ipecho.net/plain; echo"
alias getports='sudo lsof -i -P -n | grep LISTEN'

alias ljud="systemctl --user restart wireplumber pipewire pipewire-pulse"
alias dockerpurge="docker system prune -a --volumes"
alias dlog="docker compose -f /home/skogix/srv/docker-compose.yml logs"
alias dtail="docker compose -f /home/skogix/srv/docker-compose.yml logs -tf --tail="50" crowdsec"
alias dup="docker compose -f /home/skogix/srv/docker-compose.yml up -d"
alias ddown="docker compose -f /home/skogix/srv/docker-compose.yml down"
alias ddownall='docker stop $(docker ps -a -q)'
alias dprune="docker system prune -a --volumes"
alias dtop="oxker"
alias aliases="als"
alias sc='sudo SYSTEMD_EDITOR=/bin/vi /usr/bin/systemctl'
