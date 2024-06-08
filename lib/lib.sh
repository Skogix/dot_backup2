#!/bin/bash

# Function to source environment file
source_env_file() {
  local env_file="$1"
  if [ -f "$env_file" ]; then
    source "$env_file"
  else
    echo "[error] $env_file not found. Exiting."
    exit 1
  fi
}

# Function to remove a file if it exists
remove_file() {
  local file="$1"
  if [ -f "$file" ]; then
    rm "$file"
    echo "[info] Removed $file"
  fi
}

# Function to remove a directory if it exists
remove_directory() {
  local dir="$1"
  if [ -d "$dir" ]; then
    rm -rf "$dir"
    echo "[info] Removed directory $dir"
  fi
}

# Function to create a directory
create_directory() {
  local dir="$1"
  mkdir -p "$dir"
  echo "[info] Created directory $dir"
}

# Function to install oh-my-zsh
install_oh_my_zsh() {
  local install_dir="$1"
  echo "[skogix] Installing oh-my-zsh"
  cd "$install_dir" || { echo "[error] Failed to change directory to $install_dir. Exiting."; exit 1; }
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || { echo "[error] oh-my-zsh installation failed. Exiting."; exit 1; }
}

# Function to backup and replace .zshrc
backup_and_replace_zshrc() {
  local backup_file="$1"
  if [ -f "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$backup_file"
    echo "[info] Moved $HOME/.zshrc to $backup_file"
  fi
  rm -f "$HOME/.zshrc"
  mv "$backup_file" "$HOME/.zshrc"
}

# Function to install zsh-autosuggestions
install_zsh_autosuggestions() {
  local zsh_custom_plugins_dir="$1"
  echo "[skogix] Installing oh-my-zsh.zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-autosuggestions "$zsh_custom_plugins_dir/zsh-autosuggestions" || { echo "[error] Cloning zsh-autosuggestions failed. Exiting."; exit 1; }
}

# Function to check if the current shell is /bin/zsh
check_current_shell() {
  if [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "[skogix] ERROR Current shell is not /bin/zsh. LOGOUT"
    exit 1
  fi
}
