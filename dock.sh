#!/bin/bash

# Set the Dock for the current user (and all future users) to be:
# Finder, Safari, App Store, System Preferences, Activity Monitor, Console,
# Terminal, |, Applications, Downloads, Trash

cp contrib/com.apple.dock.plist ~/Library/Preferences/com.apple.dock.plist
plutil -convert binary1 ~/Library/Preferences/com.apple.dock.plist
sudo cp ~/Library/Preferences/com.apple.dock.plist /System/Library/User\ Template/English.lproj/Preferences/

killall Dock
