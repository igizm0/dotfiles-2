#!/usr/bin/env bash

#Disable sleep
pmset sleep 0

#Locate
#sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
#sudo /usr/libexec/locate.updatedb

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable opening and closing window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
 
# Disable Resume system-wide
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# Disable Resume system-wide
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false
 
# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true
 
# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Remove the auto-hiding Dock delay
defaults write com.apple.Dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Terminal cursor's speed
defaults write NSGlobalDomain KeyRepeat -int 0
 
# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Menu bar: show remaining battery time (on pre-10.8); hide percentage
defaults write com.apple.menuextra.battery ShowPercent -string "NO"
defaults write com.apple.menuextra.battery ShowTime -string "YES"

#Show All Files
defaults write com.apple.Finder AppleShowAllFiles YES

#Enable Full Path in Status Bar
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES

#Airport over Ethernet on old macs
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

#Enable Debug in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled 1


#Disable Disk Image Verification
#defaults write com.apple.frameworks.diskimages skip-verify -bool true
#defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
#defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Disable Time Machine Local Backup Storage
sudo tmutil disablelocal

#No hidden Library
chflags nohidden ~/Library

