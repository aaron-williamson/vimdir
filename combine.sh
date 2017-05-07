#!/bin/bash
# This script will combine my VIMRC files into one, allowing for
# more portability of my configuration. The file generated here
# is not meant to be human readable, and will not include
# comments or whitespace from the original config files

set -e

filename="combined.vim"
files_dir="config"
init_file="init.vim"

function usage {
  cat >&2 <<EOF
Usage: $0 [options]

Options
  -f            | Force, no not prompt before over-writing the output file
  -h            | Help, print this message
  -p            | Preserve whitespace and comments, makes output more human readable
  -m            | Minimal configuration, excludes plugins
  -o [filename] | Outputs the combined file to filename (default 'combined.vim')
EOF
}

# This function will minimize vimrc input by removing comments and
# unnecessary whitespace, it takes as argument the file to read
# the original content from
function minimize {
  LC_ALL=C sed -n -E 's/^[[:space:]]+(.*)/\1/g;s/([^[:space:]]+)[[:space:]]+([^[:space:]])/\1 \2/g;s/(^[^"]+) "[^"]+$/\1/;s/\\$/\\ /;/$[[:space:]]*^|^"/!p;/--- EXCLUDE FROM COMBINED ---/q' $1
}

# This function will remove everything from a file after the line
# --- EXCLUDE FROM COMBINED ---
function exclude_combined {
  LC_ALL=C sed -n '/--- EXCLUDE FROM COMBINED ---/!p;//q' $1
}

# Default values
minimal=false
preserve=false
force=false

while getopts ":fhmo:p" opt; do
  case $opt in
    f)
      force=true
      ;;
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
    p)
      preserve=true
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

if [[ -e $filename && -s $filename && ! $force ]]; then
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
  echo "Combining files without plugins into $filename..."
else
  file_list=$(ls $files_dir)
  echo "Combining files into $filename..."
fi


# First add the intro line to the combined file
if $preserve; then
  cat >> $filename <<-EOF
" This is a combined vim configuration, generated by the combine script
" by Aaron Williamson.

EOF
else
  cat >> $filename <<-EOF
" This is a combined vim configuration, generated by the combine script
" by Aaron Williamson. All unecessary whitespace and all comments other
" than this one have been removed.

EOF
fi

# Then the init file, up until the exclude
if $preserve; then
  exclude_combined $init_file >> $filename
else
  minimize $init_file >> $filename
fi

for file in $file_list; do
  if $preserve; then
    exclude_combined $files_dir/$file >> $filename
  else
    minimize $files_dir/$file >> $filename
  fi
done

echo "Combination complete. Outputted to $filename"
