#!/usr/bin/env bash

if [ ! -x /usr/local/bin/brew ];then
  echo "Installing BREW packet manager"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [ ! -d ~/.dotfiles ];then
  echo "$ git clone https://github.com/facetheheat/dotfiles.git ~/.dotfiles"
  echo "$ cd ~/.dotfiles && ./bootstrap.sh"
  exit 1
fi

file_list=~/.dotfiles/.*
ignorefiles=(".gitignore" ".gitmodules" ".DS_Store")

for full_path in ${file_list};do
  file=`echo ${full_path} | cut -d'/' -f 5`
  if [[ ${ignorefiles[*]} =~ "${file}" ]];then
  echo "${file} passed (ignored file list)"
  else
    #check for symlink (-h)
    if [ ! -h ~/${file} ];then
      echo "Creating symlink for ${file}"
      ln -s ${full_path} ~/${file}
    else
      echo "Config already exists for ${file}"
    fi
  fi
done
echo "Finished creating symlinks."
