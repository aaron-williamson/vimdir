#!/bin/bash

set -e

current_dir=$( cd "$( dirname ${BASH_SOURCE[0]:-$0} )" && pwd )

# Download vundle if there isn't already a vundle folder
if [[ ! -d $current_dir/bundle/Vundle.vim ]]; then
  echo Installing vundle
  mkdir -p $current_dir/bundle
  git clone https://github.com/VundleVim/Vundle.vim $current_dir/bundle/Vundle.vim
else
  echo Vundle directory detected, skipping vundle install
fi

# Install plugins, may run into problems if the vundle.vim folder
# was created but vundle wasn't installed ?
echo Installing plugins...
if hash nvim 2>/dev/null; then
  nvim +PluginInstall +qall
else
  vim +PluginInstall +qall
fi

echo Vim plugin setup complete
