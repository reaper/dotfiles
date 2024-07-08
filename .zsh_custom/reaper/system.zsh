# COMMON
#
# Created by Pierre FILSTROFF

# Upgrade system
function r-upgrade-system() {
  sudo apt update -y
  sudo apt upgrade -y
  sudo apt dist-upgrade -y
}
alias upgrade-system=r-upgrade-system

# Print running services and display ports
function r-running-services-on-ports() {
  sudo lsof -i -n -P
}
alias running-services-on-ports=r-running-services-on-ports

# Reload zsh
function r-reload-zsh() {
  source ~/.zshrc
}
alias reload-zsh=r-reload-zsh

function tmux_last_session(){
  LAST_TMUX_SESSION=$(tmux list-sessions | awk -F ":" '{print$1}' | tail -n1);
  tmux attach -t $LAST_TMUX_SESSION
}
bindkey -s '^s' 'tmux_last_session ^M'
