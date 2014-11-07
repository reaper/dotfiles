#!/bin/bash

cd $HOME
rm -rf .dotfiles > /dev/null 2>&1
echo "Cloning dotfiles repository"
git clone https://github.com/reaper/dotfiles.git .dotfiles

echo "Running rake into dotfiles folder"
cd .dotfiles
rake
