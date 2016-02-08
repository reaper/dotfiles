# COMMON
#
# Created by Pierre FILSTROFF

# Upgrade system
function r-upgrade-system() {
  sudo apt-get update -y
  sudo apt-get upgrade -y
  sudo apt-get dist-upgrade -y
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
