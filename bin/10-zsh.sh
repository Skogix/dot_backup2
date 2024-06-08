#!/bin/bash

# Source the library file
source "$HOME/lib/lib.sh"

# Main script execution
source_env_file "$HOME/.env"
check_current_shell
remove_file "$HOME/.zshrc.pre-oh-my-zsh"
remove_directory "$CONFIG/zsh"
# create_directory "$ZSH"
# install_oh_my_zsh "$CONFIG/zsh"
# backup_and_replace_zshrc "$HOME/.zshrc-skogix"
# cp -r /usr/share/zsh $CONFIG
# cp -r /usr/share/oh-my-zsh $ZSH
# install_zsh_autosuggestions "$ZSH_CUSTOM/plugins"

# Execute zsh
exec zsh
