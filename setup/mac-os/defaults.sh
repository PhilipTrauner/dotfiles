#!/bin/bash

set -e

# Don't write .DS_Store files to network drives and external storage media
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -bool true

# Crash reports as notifications
defaults write com.apple.CrashReporter UseUNC 1

# Disable MissionControl
defaults write com.apple.dashboard mcx-disabled -boolean true

# Use plain text in TextEdit
defaults write com.apple.TextEdit RichText -int 0

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true
# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Don't show anything on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -int 0
defaults write com.apple.finder ShowHardDrivesOnDesktop -int 0
defaults write com.apple.finder ShowRemovableMediaOnDesktop -int 0
defaults write com.apple.finder ShowMountedServersOnDesktop -int 0
# Don't open folders in tabs instead of new windows
defaults write com.apple.finder FinderSpawnTab -int 0
# Keep folders when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -int 1
# Don't show warning when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -int 0

defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Turn on dock auto-hide
defaults write com.apple.dock autohide -bool true
# Dock size
defaults write com.apple.dock tilesize -int 50
# Use scale effect when minimizing windows
defaults write com.apple.dock mineffect -string "scale"

# Don't ask for image import
defaults write com.apple.ImageCapture disableHotPlug -bool true

# Enable three finger drag
defaults write com.apple.AppleMultitouchTrackPad TrackpadThreeFingerDrag -int 1

# Spotify Notifications
defaults write io.citruspi.Spotify-Notifications iconSelection -int 2
defaults write io.citruspi.Spotify-Notifications playpausenotifs -int 1

# Skip Spotlight on-boarding
defaults write com.apple.Spotlight showedLearnMore -int 1
