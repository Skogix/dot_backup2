#!/bin/bash


chsh -s $(which zsh)
echo '[skogix] installing oh-my-zsh'
mkdir $ZSH
cd $ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo '[skogix] installing oh-my-zsh.zsh-autosuggestions'
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/oh-my-zsh/custom/plugins/zsh-autosuggestions
echo '[skogix] changing shell to zsh'


#
# # Default paths for pacman and yay package lists
# PACMAN_FILE="./skogix-pacman.pkgs"
# YAY_FILE="./skogix-yay.pkgs"
#
# # Function to install packages using pacman
# install_pacman() {
#     echo "[skogix] start install_pacman()"
#     local file=$1
#     if [ -f "$file" ]; then
#         sudo pacman -S --needed --noconfirm $(cat "$file")
#         echo "[skogix] ok install_pacman()"
#     else
#         echo "Pacman package list file '$file' not found."
#         echo "[skogix] ERROR install_pacman() pacman file list not found"
#     fi
#     echo "[skogix] end install_pacman()"
# }
#
# # Function to install packages using yay
# install_yay() {
#     local file=$1
#     echo "[skogix] start install_yay()"
#     if [ -f "$file" ]; then
#         yay -S --needed --noconfirm $(cat "$file")
#         echo "[skogix] ok install_yay()"
#     else
#         echo "Yay package list file '$file' not found."
#         echo "[skogix] ERROR install_yay() yay file list not found"
#     fi
#     echo "[skogix] end install_yay()"
# }
#
# # Parse arguments
# while [[ "$#" -gt 0 ]]; do
#     case $1 in
#         --pacman)
#             PACMAN_FILE="$2"
#             shift 2
#             ;;
#         --yay)
#             YAY_FILE="$2"
#             shift 2
#             ;;
#         *)
#             echo "Unknown parameter passed: $1"
#             exit 1
#             ;;
#     esac
# done
#
# # Check which installers to run
# run_pacman=false
# run_yay=false
#
# if [ ! -z "$PACMAN_FILE" ]; then
#     run_pacman=true
# fi
#
# if [ ! -z "$YAY_FILE" ]; then
#     run_yay=true
# fi
#
# # If no arguments are given, run both
# if ! $run_pacman && ! $run_yay; then
#     run_pacman=true
#     run_yay=true
# fi
#
# # Run the installers
# if $run_pacman; then
#     install_pacman "$PACMAN_FILE"
# fi
#
# if $run_yay; then
#     install_yay "$YAY_FILE"
# fi
