# COMMON
#
# Created by Pierre FILSTROFF

# Upgrade system
function upgrade_system() {
  sudo apt-get update -y
  sudo apt-get upgrade -y
  sudo apt-get dist-upgrade -y
}
