#!/bin/bash

#
# Install Jenkins using a local user.
# From: https://nickcharlton.net/posts/installing-jenkins-osx-yosemite.html
#

echo "Installing Java..."
brew install Caskroom/cask/java

echo "Creating an Applications group..."
dseditgroup -o create -n . -u $(whoami) -p -r "Applications" applications
group_id=$(sudo dscl . -read /Groups/applications |
    awk '/PrimaryGroupID/ {print $2}')
top_user_id=$(sudo dscl . -list /Users UniqueID |
    awk '{print $2}' | sort -nr | head -n 1)
user_id=$(($top_user_id+1))

echo "Creating a user for Jenkins with ID: ${user_id}..."
sudo dscl . -create /Users/jenkins
sudo dscl . -create /Users/jenkins PrimaryGroupID $group_id
sudo dscl . -create /Users/jenkins UniqueID $user_id
sudo dscl . -create /Users/jenkins UserShell /bin/bash
sudo dscl . -create /Users/jenkins RealName "Jenkins"
sudo dscl . -create /Users/jenkins NFSHomeDirectory /Users/jenkins

echo "Setting the password for Jenkins..."
sudo dscl . -passwd /Users/jenkins

echo "Creating Jenkins' home directory..."
sudo mkdir /Users/jenkins
sudo chown -R jenkins /Users/jenkins

echo "Installing Jenkins..."
brew install jenkins

echo "Configuring and loading the launch daemon..."
sudo cp contrib/jenkins.plist /Library/LaunchDaemons/homebrew.mxcl.jenkins.plist
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.jenkins.plist
