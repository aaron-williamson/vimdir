#!/bin/bash
set -e

current_dir=$( cd "$( dirname ${BASH_SOURCE[0]} )" && pwd )

echo $current_dir
# Download vundle
mkdir -p $current_dir/bundle
git clone https://github.com/VundleVim/Vundle.vim $current_dir/bundle/Vundle.vim

# Install plugins
vim -u $current_dir/plugins.vim +PluginInstall +qall
