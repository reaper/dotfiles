ZSH=$HOME/.oh-my-zsh
ZSH_THEME="gallois" # theme
COMPLETION_WAITING_DOTS="true"

# zsh plugins
plugins=(git rails brew bundler cap gem github osx python rails3 rake rvm screen ssh-keygen svn)

# Paths
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH #COMMON
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# DYLIBS directories
DYLD_LIBRARY_PATH=/opt/local/freelan/lib:$DYLD_LIBRARY_PATH #MYSQL

#Header files install dir
C_INCLUDE_PATH=/opt/local/freelan/include:$C_INCLUDE_PATH
CPLUS_INCLUDE_PATH=/opt/local/freelan/include:$CPLUS_INCLUDE_PATH

# GREP options
GREP_OPTIONS='--color=auto'
GREP_COLOR='1;32'

# Locales
LC_ALL=C

# Aliases
alias qmake='qmake -spec unsupported/macx-clang'
alias up='git pull'

# RVM configuration
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Fix slow git completion
__git_files () { 
  _wanted files expl 'local files' _files
}

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh
