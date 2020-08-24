ZSH=$HOME/.oh-my-zsh
ZSH_THEME="gallois"
ZSH_CUSTOM=$HOME/.zsh_custom
COMPLETION_WAITING_DOTS="true"
DEFAULT_USER="reaper"

# zsh plugins
plugins=(rails brew bundler gem python rails rake rvm screen svn bower colorize copyfile copydir git git-extras gitignore ubuntu common-aliases gradle web-search wd)

# Paths
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/.local/bin:$PATH #COMMON
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export TERM="xterm-256color"

# RVM configuration
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval $(thefuck --alias)

# added by travis gem
[ ! -s /Users/reaper/.travis/travis.sh ] || source /Users/reaper/.travis/travis.sh
