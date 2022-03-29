# ZSH configuration file
# Created by Pierre FILSTROFF
#
# Get os name

#COMMON
export TOOLS_HOME=/usr/local/tools

# JAVA / ANDROID
if [[ $OSTYPE =~ "^darwin" ]]; then
  export JDK_HOME="$(/usr/libexec/java_home)" #JDKHOME
else
  export JDK_HOME=/usr/lib/jvm/default-java #JDKHOME
fi

export JAVA_HOME=$JDK_HOME #JAVAHOME
export ANDROID=$TOOLS_HOME/64bits/android #ANDROID
export ANDROID_STUDIO=$ANDROID/studio #ANDROID STUDIO
export ANDROID_HOME=$ANDROID/sdk #ANDROID HOME
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk-bundle #ANDROID HOME
export PATH=${ANDROID_NDK_HOME}:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH

# Add latest buildtools to the path
if [ -d "$ANDROID_HOME/build-tools" ]; then
  BUILD_TOOLS_LATEST_VERSION=`ls -1 $ANDROID_HOME/build-tools | sort -r | head -n 1`
  export PATH=$ANDROID_HOME/build-tools/$BUILD_TOOLS_LATEST_VERSION:$PATH
fi

# QT
export QTCREATOR_HOME=$TOOLS_HOME/64bits/qtcreator/current
export QTDIR=$TOOLS_HOME/64bits/qt/current
export PATH=$QTCREATOR_HOME/bin:$QTDIR/bin:$PATH
export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH

# GENYMOTION
export PATH=$TOOLS_HOME/64bits/genymotion:$PATH

#ALIASES
#COMMON
if ! [[ $OSTYPE =~ "^darwin" ]]; then
  alias open="xdg-open"
fi

alias mkdir="mkdir -v"
alias vi="vim"
alias vim="nvim"

if [[ $OSTYPE =~ "^darwin" ]]; then
  alias gvim="vimr"
  alias osupgrade="softwareupdate -i -a && brew update && brew upgrade && brew upgrade --cask"
else
  alias gvim="nvim-qt"
  alias osupgrade="sudo apt update && sudo apt full-upgrade"
fi

#ANDROID
alias studio="screen -mdS AndroidStudio bash -c '$ANDROID_STUDIO/bin/studio.sh'"

#QT
alias qtcreator="qtcreator -stylesheet $HOME/.dotfiles/themes/qt/wombat-theme/stylesheet.css"

#TERMINATOR
alias terminator="terminator --config=$HOME/.dotfiles/config/terminator/base -l reaper -p reaper"

# PIDCAT
export PATH=$HOME/.dotfiles/plugins/pidcat:$PATH
alias logcat=pidcat.py

if [[ ! $OSTYPE =~ "^darwin" ]]; then
  alias dokku='bash $HOME/.dokku/contrib/dokku_client.sh'
fi

export GPG_TTY=$(tty)

# Include reaper zsh plugins
source $ZSH_CUSTOM/reaper/system.zsh
source $ZSH_CUSTOM/reaper/git_extra.zsh
source $ZSH_CUSTOM/reaper/fourjs.zsh
source $ZSH_CUSTOM/reaper/android.zsh
