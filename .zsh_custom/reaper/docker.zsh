# ZSH configuration file
# Created by Pierre FILSTROFF
#

alias dcs='docker-compose stop'
alias dcr='docker-compose run'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcl='docker-compose logs -f'
alias dce='docker-compose exec'
alias dcb='docker-compose build'
alias dcp='docker-compose ps'
alias dci='docker-compose images'
alias dck='docker-compose kill'
alias dcrm='docker-compose rm'
alias dcrmi='docker-compose rmi'
alias dcpull='docker-compose pull'
alias dcrestart='docker-compose restart'
alias dcrecreate='docker-compose up -d --force-recreate'
alias dcrebuild='docker-compose up -d --force-recreate --build'
alias dcrebuildno='docker-compose up -d --force-recreate --no-build'
alias dcrestartno='docker-compose restart --no-deps'
alias dcrestartall='docker-compose restart --no-deps $(docker-compose ps -q)'
alias dcrestartallno='docker-compose restart --no-deps --no-recreate $(docker-compose ps -q)'
