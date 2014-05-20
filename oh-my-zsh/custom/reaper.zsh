# ZSH configuration file
# Created by Pierre FILSTROFF

# JAVA / ANDROID
export JDK_HOME=/usr/lib/jvm/java-7-oracle #JDKHOME
export ANDROID=/opt/local/android #ANDROID
export ANDROID_STUDIO=$ANDROID/studio #ANDROID STUDIO
export ANDROID_HOME=$ANDROID/sdk #ANDROID HOME
export ANDROID_NDK_HOME=$ANDROID/ndk #ANDROID HOME
export PATH=${ANDROID_NDK_HOME}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

# QT
export PATH=/opt/local/qtcreator/bin:/opt/local/qt/current/bin:$PATH

# GENYMOTION
export PATH=/opt/local/genymotion:$PATH

# ALIASES
alias studio="screen -mdS AndroidStudio bash -c '$ANDROID_STUDIO/bin/studio.sh'"

# Include reaper zsh plugins
source $ZSH_CUSTOM/reaper/*.zsh
