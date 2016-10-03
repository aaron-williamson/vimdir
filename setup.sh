#!/bin/bash

set -e

current_dir=$( cd "$( dirname ${BASH_SOURCE[0]} )" && pwd )

# Download vundle if there isn't already a vundle folder
echo Installing vundle

if [ ! -d $current_dir/bundle/Vundle.vim ]; then
  mkdir -p $current_dir/bundle
  git clone https://github.com/VundleVim/Vundle.vim $current_dir/bundle/Vundle.vim
fi

# Check for neovim
echo Checking for neovim
if (hash nvim 2>/dev/null); then
  has_neovim=true

  # If we have neovim, link the vim directory to the right place
  echo Neovim detected, linking configuration directory
  if [[ -n $XDG_CONFIG_HOME ]]; then
    neovim_conf_dir="$XDG_CONFIG_HOME"
  else
    neovim_conf_dir="$HOME/.config"
  fi

  mkdir -p $neovim_conf_dir

  ln -s $current_dir $neovim_conf_dir/nvim
fi

# Install plugins, may run into problems if the vundle.vim folder
# was created but vundle wasn't installed ?
echo Installing plugins...
if [[ $has_neovim == true ]]; then
  nvim +PluginInstall +qall
else
  vim +PluginInstall +qall
fi

echo Vim setup complete
