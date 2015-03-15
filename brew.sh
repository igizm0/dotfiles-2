#!/usr/bin/env bash

if [ ! -x /usr/local/bin/brew ];then
  echo "Installing BREW packet manager"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade

brew install zsh
brew install zsh-completions
brew install zsh-syntax-highlighting
brew install git
brew install e2fsprogs
brew install grc
brew install nmap
brew install p7zip
brew install wget --with-iri
brew install mc

chsh -s /bin/zsh
