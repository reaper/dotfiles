ZSH=$HOME/.oh-my-zsh
ZSH_THEME="gallois" # theme
COMPLETION_WAITING_DOTS="true"

# zsh plugins
plugins=(git rails brew bundler cap gem github osx python rails3 rake rvm screen ssh-keygen svn)

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

# RVM configuration
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Fix slow git completion
function __git_files () { 
  _wanted files expl 'local files' _files
}

function up() { 
  git_svn_info=$(git config -z --get-regexp '^(svn-remote\..*\.url|bash\.showupstream)$' 2>/dev/null | tr '\0\n' '\n ')
  if [ -n "$git_svn_info" ]; then
    # Git svn clone, use git svn
    git svn rebase
  else
    # Git clone, use git
    git pull
  fi
}

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh
