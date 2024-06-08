source $HOME/.env
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
ZSH_THEME="agnoster"
plugins=(
  git 
  zsh-autosuggestions 
  # archlinux 
  # gitfast 
  aliases 
  git-flow-avh
  zsh-syntax-highlighting
)
# plugins=(archlinux 
# 	asdf 
# 	bundler 
# 	docker 
# 	jsontools 
# 	vscode 
# 	web-search 
# 	k 
# 	tig 
# 	gitfast 
# 	colored-man-pages 
# 	colorize 
# 	command-not-found 
# 	cp 
# 	dirhistory 
# 	autojump 
# 	sudo 
# 	zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

source $CONFIG/aliases/aliases.zsh


# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
