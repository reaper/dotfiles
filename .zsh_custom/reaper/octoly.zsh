# Octoly ZSH configuration file
# Created by Pierre FILSTROFF
#

#Homebrew llvm
export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

export PATH="/usr/local/opt/llvm/bin:$PATH"

#export CC=clang
#export CXX=$(CC)++
#export AR=llvm-ar
#export LD=ld.lld
#export RANLIB=llvm-ranlib
#
#alias cc=$CC
#alias c++=$CXX
#alias ld=$LD
#alias ar=$AR
#alias ranlib=$RANLIB

# Vim better errors link
export LES_VRAIS_BARBUS=1
export NO_RSPEC_RETRY=1
