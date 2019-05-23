#!/usr/bin/env bash

#
#   bash script for setting up permissions for a symfony project in Linux

#####################################################
# Check whether a directory exists or not
# Globals:
#   None
# Arguments:
#   directory name
# Returns:
#   None
#####################################################
check_directory () {

  if [ ! -d $1 ]; then
    echo "The given directory doesn't exist!"
    echo "Please try again"
    exit
  fi
}

# For spacing in terminal
echo " "

# Get the symfony project folder path from user
read -p "Enter Symfony project full path: " project_path
echo " "

# Check whether symfony project folder path exists or not
check_directory $project_path
echo " "

# Perform permission tasks.
HTTPDUSER=$(ps axo user,comm | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1)
sudo setfacl -dR -m u:"$HTTPDUSER":rwX -m u:$(whoami):rwX var
sudo setfacl -R -m u:"$HTTPDUSER":rwX -m u:$(whoami):rwX var

# Print success message
echo " "
echo "----------------------------------------------------------------"
echo "You have successfully gave permission to the project : $project_path"
echo "----------------------------------------------------------------"
exit