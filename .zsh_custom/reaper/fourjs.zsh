# ZSH configuration file
# Created by Pierre FILSTROFF
#
#FGL
export FGLDIR=/opt/fourjs/fglgws/current #FGLDIR
export FGLASDIR=/opt/fourjs/gas/current #FGLASDIR
export FGLGDCDIR=/opt/fourjs/gdc/current #FGLGDCDIR
export PATH=$PATH:$FGLDIR/bin #Fourjs bin path

#CLIENTQA
export FGLQADIR=~/Fourjs/Projects/git/clientqa

#RUBTOOLS
export FJS_DISTRIB_FOLDER=/work/distrib
#ALIASES
#FGL
alias gdc='$FGLGDCDIR/bin/gdc -aD'
alias fglform='fglform -M'
alias fglcomp='fglcomp -M'

#COMMON
alias route_to_local='sudo route add -net 10.10.0.0/24 gw 10.0.0.254 dev eth0'

# Compile sources in a folder
function fglcomp_all() {
  ruby $HOME/.dotfiles/tools/ruby/fourjs/fglcomp_all.rb
}
