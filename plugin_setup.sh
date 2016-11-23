#!/bin/bash

set -e

current_dir=$( cd "$( dirname ${BASH_SOURCE[0]:-$0} )" && pwd )

# Download vim-plug if it isn't already downloaded
if [[ -f $current_dir/autoload/plug.vim ]]; then
  echo Existing vim-plug detected, skipping download
else
  echo Downloading vim-plug...
  curl -fLo $current_dir/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install plugins, may run into problems if the vundle.vim folder
# was created but vundle wasn't installed ?
echo Installing plugins...
if hash nvim 2>/dev/null; then
  nvim +PlugInstall +qall
else
  vim +PlugInstall +qall
fi

echo Vim plugin setup complete
