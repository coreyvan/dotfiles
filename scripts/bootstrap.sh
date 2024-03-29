#!/bin/sh

###############################################################################
# bootstrap
#
# A shell script to automate system tool setup for Mac OS X.
###############################################################################


###############################################################################
# Install Xcode command line tools
###############################################################################
echo "Installing Xcode Command Line Tools..."
xcode-select --install


###############################################################################
# Check for Homebrew, else install
###############################################################################
echo "Checking for, or Installing Homebrew..."
if [ -z "$(command -v brew)" ]; then
    echo "Brew is missing! Installing it..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi;

###############################################################################
# Make sure we're on latest Homebrew
###############################################################################
echo "Homebrew: updating..."
brew update


###############################################################################
# Upgrade any already-installed formulae
###############################################################################
echo "Homebrew: upgrading..."
brew upgrade


###############################################################################
# Install utilities
###############################################################################
echo "Homebrew: updating unix tools..."
brew install zsh
brew install homebrew/cask-fonts/font-fira-mono-for-powerline
brew install homebrew/cask-fonts/font-jetbrains-mono

###############################################################################
# Install binaries and other packages
###############################################################################
echo "Homebrew: installing binaries and other packages..."
brew install git
brew install httpie
#brew install mackup
brew install mas
brew install nginx
#brew install node
#brew install nvm
brew install rename
brew install tree
brew install protobuf
brew install azure-cli
#brew install yarn
#brew install go

###############################################################################
# Run Homebrew cleanup to remove installation/cached files
###############################################################################
echo "Homebrew: cleaning up..."
brew cleanup

###############################################################################
# Install applications with Homebrew Cask
###############################################################################
echo "Homebrew Cask: installing apps..."
brew cask install 1password
brew cask install docker
brew cask install firefox
brew cask install iterm2
brew cask install insomnia
brew cask install slack
brew cask install spotify
brew cask install visual-studio-code
brew cask install whatsapp
brew cask install bloomrpc
brew cask install wireshark


###############################################################################
# Cleanup
###############################################################################
brew cask cleanup

echo "macOS Config, Dev Tools, Apps are Done Setup!"
