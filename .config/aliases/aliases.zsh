alias lsa='lsd -a'
alias vim='nvim'
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
alias ctl="systemctl-tui"
alias dtop="oxker"
alias aliases="als"
alias sc='systemctl --user'
alias mobil='scrcpy'

syay() {
    #do things with parameters like $1 such as
    echo "$1" > /home/skogix/bin/skogix-yay.pkgs
    echo "added $1 to ~/bin/skogix-yay.pkgs"
    yay "$1"
}

function spacman() {
    PACKAGE_FILE="/home/skogix/bin/skogix-pacman.pkgs"

    # Color codes
    GREEN="\e[32m"
    RED="\e[31m"
    YELLOW="\e[33m"
    BLUE="\e[34m"
    NC="\e[0m" # No color

    function install_package() {
        local package_manager=$1
        local package_name=$2
        if [[ "$package_manager" == "pacman" ]]; then
            sudo pacman -S --noconfirm "$package_name"
        else
            yay -S --noconfirm "$package_name"
        fi
        return $?
    }

    function remove_package() {
        local package_manager=$1
        local package_name=$2
        if [[ "$package_manager" == "pacman" ]]; then
            sudo pacman -R --noconfirm "$package_name"
        else
            yay -R --noconfirm "$package_name"
        fi
        return $?
    }

    function install_all_packages() {
        local messages=()
        while IFS= read -r package_name; do
            echo "${YELLOW}[INFO]${NC} Attempting to install '${package_name}'..."
            if install_package pacman "$package_name" || install_package yay "$package_name"; then
                messages+=("${GREEN}[OK]${NC} Successfully installed '${package_name}'.")
            else
                messages+=("${RED}[ERROR]${NC} Failed to install '${package_name}'.")
            fi
        done < "$PACKAGE_FILE"

        # Print all messages at the end
        for message in "${messages[@]}"; do
            echo -e "$message"
        done
    }

    if [[ "$1" == "-S" ]]; then
        if install_package pacman "$2" || install_package yay "$2"; then
            if grep -q "${2}" "$PACKAGE_FILE"; then
                echo -e "${YELLOW}[INFO]${NC} '${2}' already exists in skogix_packages file, so no addition is performed."
            else
                echo -e "${GREEN}[OK]${NC} Added '${2}' into ~/bin/skogix-pacman.pkgs."
                echo $2 >> "$PACKAGE_FILE"
            fi
        else
            echo -e "${RED}[ERROR]${NC} Installation of '${2}' failed."
        fi
    elif [[ "$1" == "-R" ]]; then
        if remove_package pacman "$2" || remove_package yay "$2"; then
            if grep -q "${2}" "$PACKAGE_FILE"; then
                sed -i "/${2}/d" "$PACKAGE_FILE"
                echo -e "${GREEN}[OK]${NC} Removed '${2}' from ~/bin/skogix-pacman.pkgs."
            else
                echo -e "${YELLOW}[INFO]${NC} '${2}' does not exist in skogix_packages file, so no removal is performed."
            fi
        else
            echo -e "${RED}[ERROR]${NC} Removal of '${2}' failed."
        fi
    elif [[ "$1" == "--install-all" ]]; then
        install_all_packages
    elif [[ "$1" == "--edit" ]]; then
        nvim ~/bin/skogix.pkgs
    else
        pacman "$@"
    fi
}

