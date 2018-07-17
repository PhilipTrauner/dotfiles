#!/bin/bash

set -e

# Don't write .DS_Store files to network drives and external storage media
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write com.apple.ImageCapture disableHotPlug -bool true
# Save screenshots in PNG format
defaults write com.apple.screencapture type -string "png"
# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write com.apple.menuextra.battery ShowPercent -bool true
# Crash reports as notifications
defaults write com.apple.CrashReporter UseUNC 1
# Disable MissionControl
defaults write com.apple.dashboard mcx-disabled -boolean true
# Use plain text in TextEdit
defaults write com.apple.TextEdit RichText -int 0

# Finder
defaults write com.apple.finder ShowPathbar -bool true
# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Safari
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Time Machine
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 50

# HyperDock
defaults write de.bahoom.HyperDock disclaimer_accepted -int 1
defaults write de.bahoom.HyperDock itunes_preview_ratings -int 0
defaults write de.bahoom.HyperDock move_windows -int 0
defaults write de.bahoom.HyperDock license_accepted -int 1
defaults write de.bahoom.HyperDock keyboard_arrange -int 0
defaults write de.bahoom.HyperDock resize_windows -int 0
defaults write de.bahoom.HyperDock window_snapping_delay_near -float 0.2
defaults write de.bahoom.HyperDock titlebar_scroll_arrange -int 0

# Spotify Notifications
defaults write io.citruspi.Spotify-Notifications iconSelection -int 2
defaults write io.citruspi.Spotify-Notifications playpausenotifs -int 1

# Spotlight
defaults write com.apple.Spotlight showedLearnMore -int 1

# iTerm2
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "${HOME}/Developer/setup/content/mac-os/iterm2"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -int 1
