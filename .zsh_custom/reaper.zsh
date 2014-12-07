# ZSH configuration file
# Created by Pierre FILSTROFF

#FGL
export FGLDIR=/opt/fourjs/fglgws/current #FGLDIR
export FGLASDIR=/opt/fourjs/gas/current #FGLASDIR
export FGLGDCDIR=/opt/fourjs/gdc/current #FGLGDCDIR
export PATH=$PATH:$FGLDIR/bin #Fourjs bin path

#CLIENTQA
export FGLQADIR=~/Fourjs/Projects/git/clientqa

#RUBTOOLS
export FJS_DISTRIB_FOLDER=/work/distrib

# JAVA / ANDROID
export JDK_HOME=/usr/lib/jvm/java-8-oracle #JDKHOME
export ANDROID=/usr/local/tools/64bits/android #ANDROID
export ANDROID_STUDIO=$ANDROID/studio #ANDROID STUDIO
export ANDROID_HOME=$ANDROID/sdk #ANDROID HOME
export ANDROID_NDK_HOME=$ANDROID/ndk/current #ANDROID HOME
export PATH=${ANDROID_NDK_HOME}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

# QT
export QTCREATOR_HOME=/usr/local/tools/64bits/qtcreator/current
export QTDIR=/usr/local/tools/64bits/qt/current
export PATH=$QTCREATOR_HOME/bin:$QTDIR/bin:$PATH

# GENYMOTION
export PATH=/usr/local/tools/64bits/genymotion:$PATH

#ALIASES
#FGL
alias gdc='$FGLGDCDIR/bin/gdc -aD'
alias fglform='fglform -M'
alias fglcomp='fglcomp -M'

#COMMON
alias route_to_local='sudo route add -net 10.10.0.0/24 gw 10.0.0.254 dev eth0'

#ANDROID
alias studio="screen -mdS AndroidStudio bash -c '$ANDROID_STUDIO/bin/studio.sh'"

#QT
alias qtcreator="qtcreator -stylesheet $HOME/.tools/themes/qt/wombat-theme/stylesheet.css"

# Include reaper zsh plugins
source $ZSH_CUSTOM/reaper/*.zsh
