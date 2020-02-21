#!/bin/bash

#Install Packages Script
#-----------------------
#author: Roland Schulz

#REMINDER: For this to work you MUST clone the dotfiles repo to your home folder
#          as ~/dotfiles/.
#          Or change the $DOTFILES_DEFAULT_DIR variable below.

#Settings
#--------
TEMP_LOG_FILE=~/dotfiles_log.txt

#Packages to install
#TODO: Add support for files containing installed packages
packages=(
          blueman
          bluez-utils
          ctags
          curl
          dmenu
          feh
          ffmpeg
          firefox
          gimp
          htop
          i3blocks
          pandoc
          pcmanfm
          qemu
          ranger
          scrot
          gdb
          tmux
          transmission-gtk
          udiskie
          valgrind
          vim
          virt-install
          virt-manager
          virt-viewer
          vlc
          volumeicon
          xautolock
          xorg-xbacklight
          zathura
          python-pip
          clang
         )

#No need to edit below this line ----------------------------------------------

#Vendor Package Manager Install Commands List
#REMINDER: When editing, also add the corresponding VENDOR_ID to get_vendor()
VENDOR_PM=(
           "pacman -S --noconfirm --needed"
           "apt-get -y install"
           "dnf install -y"
          )

get_vendor_id() {
    if [[ -e $(command -v pacman) ]]; then
        VENDOR_ID=0
    elif [[ -e $(comamnd -v apt-get) ]]; then
        VENDOR_ID=1
    elif [[ -e $(command -v dnf) ]]; then
        VENDOR_ID=2
    else
        echo "ERROR: No supported package manager found!"
        false
    fi 

    true
}


CURRENT_SCRIPT=$(basename "${BASH_SOURCE[0]}")

#Lookup which package manager is available and use the first one available
if ! get_vendor_id; then
    exit 1
fi

#Installing packages
for package in "${packages[@]}"; do
    eval sudo "${VENDOR_PM[$VENDOR_ID]}" "$package"
    if type -p "$package" > /dev/null; then
        echo "$package Installed" >> $TEMP_LOG_FILE
    else
        echo "$package FAILED TO INSTALL!!!" >> $TEMP_LOG_FILE
    fi
done

#Summary
#-------
echo -e "\n------ $CURRENT_SCRIPT Summary ------\n"
cat $TEMP_LOG_FILE
echo
rm $TEMP_LOG_FILE

