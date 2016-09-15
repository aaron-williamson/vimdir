#!/bin/bash

set -e

current_dir=$( cd "$( dirname ${BASH_SOURCE[0]} )" && pwd )

# Download vundle if there isn't already a vundle folder
if [ ! -d $current_dir/bundle/Vundle.vim ]; then
  mkdir -p $current_dir/bundle
  git clone https://github.com/VundleVim/Vundle.vim $current_dir/bundle/Vundle.vim
fi

# Install plugins, may run into problems if the vundle.vim folder
# was created but vundle wasn't installed
vim -u $current_dir/plugins.vim +PluginInstall +qall
