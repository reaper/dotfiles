ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"

# PLUGINS
plugins=(git rails brew bundler cap gem github osx python rails3 rake rvm screen ssh-keygen svn rbenv)

# EXPORTS
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$PATH
export PATH=/usr/local/sbin:/opt/local/bin:/usr/local/mysql/bin:$PATH

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

#RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

local rvm=''
if which rvm-prompt &> /dev/null; then
    rvm='%{$fg[green]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
    if which rbenv &> /dev/null; then
        rvm='%{$fg[green]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
    fi  
fi

RPROMPT="${rvm}"
