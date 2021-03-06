# ZSH configuration file
# Created by Pierre FILSTROFF
#
#ADB forward ports
function adb-forward() {
  for port in "$@"
    do
      adb forward tcp:$port tcp:$port
      echo "Forwarded port $port"
  done
}

# ADB push all in current directory
function adb-push-all() {
  for folder in "$@"
    do
      for file (*.*) {
        adb push $file $folder
      }
  done
}
