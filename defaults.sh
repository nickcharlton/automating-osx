#
# Sets OS X defaults.
#
# This is a cutdown version of:
#   https://github.com/nickcharlton/dotfiles/blob/master/osx/defaults.sh

#
# General
#

# remove shadows from screenshots
defaults write com.apple.screencapture disable-shadow -bool true
# disable menu bar transparency
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false
# always expand save dialog
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# save to disk, not iCloud by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
# set the help viewer windows to be non-floating
defaults write com.apple.helpviewer DevMode -bool true
# show IP, hostname, OS version, etc in the lock window
defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
# toggle dark mode with Ctrl+Opt+Cmd+t
defaults write /Library/Preferences/.GlobalPreferences.plist _HIEnableThemeSwitchHotKey -bool true

#
# Trackpad, Mouse, Keyboard and other input devices
#

# trackpad: enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# enable UI scroll with ctrl
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
# follow the keyboard focus when zoomed
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

#
# Finder
#

# show ~/Library
chflags nohidden ~/Library

# AirDrop over every interface
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# show hard drives and removable media on the desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# show path bar
defaults write com.apple.finder ShowPathbar -bool true

# enable text selection in QuickLook
defaults write com.apple.finder QLEnableTextSelection -bool true

# when searching, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# disable file extension warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# enable spring loading for directories, remove the delay
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# don't create .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# arrange by kind
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy kind" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy kind" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy kind" ~/Library/Preferences/com.apple.finder.plist

# set grid spacing
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 54" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 54" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 30" ~/Library/Preferences/com.apple.finder.plist

# set the size of icons on the desktop and elsewhere
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 48" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist

# use icon view by default
defaults write com.apple.finder FXPreferredViewStyle -string "icnv"

#
# Dock, Exposé, Dashboard and Hot Corners
#

# set the size of dock icons to 30 points
defaults write com.apple.dock tilesize -int 40

# show indicator lights for open applications
defaults write com.apple.dock show-process-indicators -bool true

# don't group windows by applications
defaults write com.apple.dock expose-group-by-app -bool false

# don't automatically rearrange spaces
defaults write com.apple.dock mru-spaces -bool false

#
# Safari & WebKit
#

# don't open 'safe' files by default
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# set Safari's page search to 'contains' not 'starts with'
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# enable Develop menu and Web Inspector
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# show web inspector in all other web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

#
# Terminal
#

# only use uft-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

#
# Time Machine
#

# don't prompt on new drives
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

#
# Disk Utility
#

# enable debug mode and advanced options
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

#
# Kill Affected Applications
#

for app in "Dock" "Finder" "Safari" "SystemUIServer" "Terminal"; do
    killall "${app}" > /dev/null 2>&1
done

echo "Completed setting OS X defaults. Some might require a logout/restart."
