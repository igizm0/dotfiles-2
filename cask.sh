#!/usr/bin/env bash

if [ ! -x /usr/local/bin/brew ];then
  echo "Installing BREW packet manager"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade

brew install caskroom/cask/brew-cask

brew cask install dropbox
brew cask install coderunner
brew cask install sublime-text
brew cask install github
brew cask install google-chrome
brew cask install iterm2
brew cask install bartender
brew cask install bittorrent-sync
brew cask install versions
brew cask install evernote
brew cask install fission
brew cask install firefox
brew cask install hazel
brew cask install launchbar
brew cask install alfred
brew cask install little-snitch
brew cask install deezer
brew cask install viscosity
brew cask install java
brew cask install ksdiff
brew cask install nvalt
brew cask install transmission
brew cask install skype
brew cask install teamviewer
brew cask install textexpander
brew cask install the-unarchiver
brew cask install tunnelbear
brew cask install vlc
brew cask install libreoffice
brew cask install camtasia
brew cask install vmware-fusion
open "/opt/homebrew-cask/Caskroom/little-snitch/3.5.1/Little Snitch Installer.app"
