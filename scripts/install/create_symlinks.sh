#!/bin/bash

#Create Symlinks Script
#----------------------
#author: Roland Schulz

#REMINDER: For this to work you MUST clone the dotfiles repo to your home folder
#          as ~/dotfiles/.
#          Or supply the path as first argument.
#          Or change the $DOTFILES_DEFAULT_DIR variable below.

#Settings
#--------
DOTFILES_DEFAULT_DIR=~/dotfiles
TEMP_LOG_FILE=~/dotfiles_log.txt

#No need to edit below this line ----------------------------------------------
CURRENT_SCRIPT=$(basename "${BASH_SOURCE[0]}")
#Sets the default/supplied dotfiles dir
if [ $# -eq 0 ]; then
    DOTFILES_DIR=$1
else
    DOTFILES_DIR=$DOTFILES_DEFAULT_DIR
fi

#Delete existing dot files and folders in the home folder
#NOTE: 2>$1 sends stdout(1) and stderr(2) to /dev/null
#--------------------------------------------------------
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.config > /dev/null 2>&1

#Create symlinks in the home folder, remove existing
#----------------------------------
ln -sf $DOTFILES_DIR/vim ~/.vim
ln -sf $DOTFILES_DIR/.vimrc ~/.vimrc
ln -sf $DOTFILES_DIR/.bash_profile ~/.bash_profile
ln -sf $DOTFILES_DIR/tmux ~/.tmux
ln -sf $DOTFILES_DIR/config ~/.config
ln -sf $DOTFILES_DIR/.gitconfig ~/.gitconfig
ln -sf $DOTFILES_DIR/.gitignore_global ~/.gitignore_global
ln -sf $DOTFILES_DIR/.git_message ~/.git_message
ln -sf $DOTFILES_DIR/.scripts ~/scripts
ln -sf $DOTFILES_DIR/.screenlayout ~/.screenlayout

#Summary
#-------
echo -e "\n------ $CURRENT_SCRIPT Summary ------\n"
cat $TEMP_LOG_FILE
echo
rm $TEMP_LOG_FILE

