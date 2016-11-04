#!/bin/bash
# This script will combine my VIMRC files into one, allowing for more portability of my configuration

set -e

filename="combined.vim"
files_dir="config"

function usage {
  cat >&2 <<EOF
Usage: $0 [-m]

Options
  -m            | Minimal configuration, excludes plugins
  -o [filename] | Outputs the combined file to filename (default 'combined.vim')
EOF
}

minimal=false

while getopts ":hmo:" opt; do
  case $opt in
    h) 
      usage
      exit 0
      ;;
    m)
      minimal=true
      ;;
    o)
      filename=$OPTARG
      ;;
    \?)
      echo "Unknown option -$OPTARG" >&2
      usage
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument"
      usage
      exit 1
      ;;
  esac
done

if [[ -e $filename && -s $filename ]]; then
  while true; do
    read -p "File $filename exists, would you like to overwrite? [y/n] " yn
    case $yn in
      [yY])
        echo "Overwriting $filename and proceeding"
        break
        ;;
      [nN])
        echo "Will not overwrite $filename exiting"
        exit 0
        ;;
      *)
        echo "Please enter y or n"
        ;;
    esac
  done

fi

# Truncate the file to 0 length to start
: > $filename

if $minimal; then
  file_list=$(ls $files_dir | grep -v plugin)
else
  file_list=$(ls $files_dir)
fi

echo "Combining files into $filename..."

for file in $file_list; do
  cat $files_dir/$file >> $filename
done

echo "Combination complete. Outputted to $filename"
