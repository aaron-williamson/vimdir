#!/bin/bash
set -e

# Download vundle
mkdir -p bundle
git clone https://github.com/VundleVim/Vundle.vim bundle/Vundle.vim

# Install plugins
vim -u plugins.vim +PluginInstall +qall
