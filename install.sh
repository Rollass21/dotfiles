#!/bin/bash

#Crude Dotfiles Install Script
#-----------------------------
#author: Roland Schulz

#REMINDER: For this to work you MUST clone the dotfiles repo to your home folder
#          as ~/dotfiles/.
#          Or change the $DOTFILES_DIR variable below.

#Settings
#--------
DOTFILES_DIR=~/dotfiles

#No need to edit below this line ----------------------------------------------
#Setup symlinks
#--------------
/bin/bash $DOTFILES_DIR/scripts/install/create_symlinks.sh $DOTFILES_DIR

#Install packages
#----------------
/bin/bash $DOTFILES_DIR/scripts/install/install_packages.sh
