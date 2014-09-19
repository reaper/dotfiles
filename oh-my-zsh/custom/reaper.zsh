# ZSH configuration file
# Created by Pierre FILSTROFF

# JAVA / ANDROID
export JDK_HOME=/usr/lib/jvm/java-8-oracle #JDKHOME
export ANDROID=/opt/local/tools/64bits/android #ANDROID
export ANDROID_STUDIO=$ANDROID/studio #ANDROID STUDIO
export ANDROID_HOME=$ANDROID/sdk #ANDROID HOME
export ANDROID_NDK_HOME=$ANDROID/ndk/current #ANDROID HOME
export PATH=${ANDROID_NDK_HOME}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

# QT
export PATH=/opt/local/tools/64bits/qtcreator/bin:/opt/local/tools/64bits/qt/current/bin:$PATH
# GENYMOTION
export PATH=/opt/local/tools/64bits/genymotion:$PATH

# ALIASES
alias studio="screen -mdS AndroidStudio bash -c '$ANDROID_STUDIO/bin/studio.sh'"

# Include reaper zsh plugins
source $ZSH_CUSTOM/reaper/*.zsh
