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

#No need to edit below this line ----------------------------------------------
CURRENT_SCRIPT=$(basename "${BASH_SOURCE[0]}")
#Sets the default/supplied dotfiles dir
if [ $# -eq 1 ]; then
    DOTFILES_DIR=$1
else
    DOTFILES_DIR=$DOTFILES_DEFAULT_DIR
fi

echo "STARTING $CURRENT_SCRIPT"
echo "========================"

#Delete existing dot files and folders in the home folder
#NOTE: 2>$1 sends stdout(1) and stderr(2) to /dev/null
#--------------------------------------------------------
echo
echo "Deleting old"
echo "------------"
rm -r ~/.bashrc > /dev/null 2>&1 && echo "Deleting ~/.bashrc"
rm -r ~/.vim > /dev/null 2>&1 && echo "Deleting ~/.vim"
rm -r ~/.vimrc > /dev/null 2>&1 && echo "Deleting ~/.vimrc"
rm -r ~/.tmux > /dev/null 2>&1 &&  echo "Deleting ~/.tmux"
rm -r ~/.tmux.conf > /dev/null 2>&1 && echo "Deleting ~/.tmux.conf"
rm -r ~/.gitconfig > /dev/null 2>&1 && echo "Deleting ~/.gitconfig"
rm -r ~/.git_message > /dev/null 2>&1 && echo "Deleting ~/.git_message"
rm -r ~/.gitignore_global > /dev/null 2>&1 && echo "Deleting ~/.gitignore_global"

#Create symlinks in the home folder, remove existing
#----------------------------------
echo
echo "Linking new"
echo "-----------"
ln -sf $DOTFILES_DIR/.bash_profile ~/.bash_profile && echo "Linking ~/.bash_profile"
if [ ! -d "~/bin" ]; then mkdir -p $(dir $@); fi
ln -sf $DOTFILES_DIR/scripts ~/bin/scripts && echo "Linking ~/bin/scripts"
ln -sf $DOTFILES_DIR/.vim ~/.vim && echo "Linking ~/.vim"
ln -sf $DOTFILES_DIR/.vim/vimrc ~/.vimrc && echo "Linking ~/.vimrc"
ln -sf $DOTFILES_DIR/.tmux.conf ~/.tmux.conf && echo "Linking ~/.tmux.conf"
ln -sf $DOTFILES_DIR/.gitconfig ~/.gitconfig && echo "Linking ~/.gitconfig"
ln -sf $DOTFILES_DIR/.gitignore_global ~/.gitignore_global && echo "Linking ~/.gitignore_global"
ln -sf $DOTFILES_DIR/.git_message ~/.git_message && echo "Linking ~/.git_message"
ln -sf $DOTFILES_DIR/.screenlayout ~/.screenlayout && echo "Linking ~/.screenlayout"

#end
echo
echo "$CURRENT_SCRIPT FINISHED"
echo "========================"
