ZSH=$HOME/.oh-my-zsh
ZSH_THEME="gallois" # theme
COMPLETION_WAITING_DOTS="true"

# zsh plugins
plugins=(git rails brew bundler cap gem github osx python rails3 rake rvm screen ssh-keygen svn)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Paths
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH #COMMON
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# DYLIBS directories
export DYLD_LIBRARY_PATH=/opt/local/freelan/lib:$DYLD_LIBRARY_PATH #MYSQL

#Header files install dir
export C_INCLUDE_PATH=/opt/local/freelan/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=/opt/local/freelan/include:$CPLUS_INCLUDE_PATH

# GREP options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# Locales
export LC_ALL=C

# Aliases
alias qmake='qmake -spec unsupported/macx-clang'
alias up='git pull'

# RVM configuration
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Fix slow git completion
__git_files () { 
  _wanted files expl 'local files' _files
}
