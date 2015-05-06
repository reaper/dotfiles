# ZSH configuration file
# Created by Pierre FILSTROFF
#
#COMMON
export TOOLS_HOME=/usr/local/tools

# JAVA / ANDROID
export JDK_HOME=/usr/lib/jvm/java-8-oracle #JDKHOME
export ANDROID=$TOOLS_HOME/64bits/android #ANDROID
export ANDROID_STUDIO=$ANDROID/studio #ANDROID STUDIO
export ANDROID_HOME=$ANDROID/sdk #ANDROID HOME
export ANDROID_NDK_HOME=$ANDROID/ndk/current #ANDROID HOME
export PATH=${ANDROID_NDK_HOME}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

# QT
export QTCREATOR_HOME=$TOOLS_HOME/64bits/qtcreator/current
export QTDIR=$TOOLS_HOME/64bits/qt/current
export PATH=$QTCREATOR_HOME/bin:$QTDIR/bin:$PATH
export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH

# GENYMOTION
export PATH=$TOOLS_HOME/64bits/genymotion:$PATH

#ALIASES
#ANDROID
alias studio="screen -mdS AndroidStudio bash -c '$ANDROID_STUDIO/bin/studio.sh'"

#QT
alias qtcreator="qtcreator -stylesheet $HOME/.dotfiles/themes/qt/wombat-theme/stylesheet.css"

#TERMINATOR
alias terminator="terminator --config=$HOME/.dotfiles/config/terminator/config -l reaper -p reaper"

# Include reaper zsh plugins
source $ZSH_CUSTOM/reaper/common.zsh
source $ZSH_CUSTOM/reaper/git_extra.zsh
source $ZSH_CUSTOM/reaper/fourjs.zsh
