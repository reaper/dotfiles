ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster" # theme
ZSH_CUSTOM=$HOME/.zsh_custom
COMPLETION_WAITING_DOTS="true"
DEFAULT_USER="reaper"

# zsh plugins
plugins=(rails brew bundler gem python rails rake rvm screen ssh-keygen svn bower colorize copyfile copydir git git-extras gitignore ubuntu cap common-aliases gradle web-search wd)

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
