ZSH_THEME="gallois" #THEME
COMPLETION_WAITING_DOTS="true"

#ZSH PLUGINS
plugins=(git rails brew bundler cap gem github osx python rails3 rake rvm screen ssh-keygen svn)

#EXPORTS"
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:$PATH #COMMON
export PATH=/usr/local/sbin:/usr/local/bin:/opt/local/bin:/opt/X11/bin:$PATH #LOCAL
export PATH=/usr/local/qt/current/bin:$PATH #QT4
export PATH=/usr/local/mysql/bin:$PATH #MYSQL

#DYLIBS
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH #MYSQL

#GREP OPTIONS
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

#ALIAS
alias qmake='qmake -spec unsupported/macx-clang'

#RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

#PYTHONBREW
[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

# Fix slow git completion
__git_files () { 
  _wanted files expl 'local files' _files
}
