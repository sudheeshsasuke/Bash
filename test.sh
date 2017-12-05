#!/usr/bin/env bash

make_directory() {
    # Check whether mkdir process is successful or not
    if mkdir -p $1 ; then

        # Apply rwx permission
        chmod 755 $1
        echo " "
        echo "$1 has been created for you"
    else  # If mkdir process returned error then it means the virtual host 
        # root folder path is invalid. So throw an error message and exit

        echo " "
        echo "Error while creating $1"
        echo "Please check your directory path, its permission and try again"
        echo " "
        exit
    fi
}

read -p "enter folder : " x
make_directory $x