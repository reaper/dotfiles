# ZSH configuration file
# Created by Pierre FILSTROFF

# JAVA / ANDROID
export JDK_HOME=/usr/lib/jvm/java-7-oracle #JDKHOME
export ANDROID_HOME=/opt/local/android/sdk #ANDROID HOME
export ANDROID_NDK_HOME=/opt/local/android/ndk #ANDROID HOME
export PATH=${ANDROID_NDK_HOME}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

# QT
export PATH=/opt/local/qtcreator/bin:/opt/local/qt/current/bin:$PATH

# GENYMOTION
export PATH=/opt/local/genymotion:$PATH

# ALIASES
alias cp_v=""

# Include reaper zsh plugins
source $ZSH_CUSTOM/reaper/*.zsh
