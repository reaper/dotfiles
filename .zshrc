ZSH=$HOME/.oh-my-zsh
ZSH_THEME="gallois" # theme
ZSH_CUSTOM=$HOME/.zsh_custom
COMPLETION_WAITING_DOTS="true"

# zsh plugins
plugins=(git rails brew bundler cap gem github osx python rails rake rvm screen ssh-keygen svn)

# Paths
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH #COMMON
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# GREP options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# RVM configuration
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh
