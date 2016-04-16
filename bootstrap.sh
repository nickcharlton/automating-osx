#!/bin/bash

echo "Installing Xcode Command Line Tools..."
xcode-select --install

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing basic dependencies..."
brew tap homebrew/services
brew tap homebrew/cask
brew install tmux vim git tree htop-osx nmap
