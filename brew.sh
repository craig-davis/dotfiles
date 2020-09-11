#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget`.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install gmp

# Install other useful binaries.
brew install ack
brew install git
brew install git-lfs
brew install imagemagick
brew install pv
brew install rename
brew install ssh-copy-id
brew install tree

# Craig Davis
brew install figlet
brew install grc
brew install htop
brew install speedtest-cli
brew install pngcrush
brew install diff-so-fancy
brew install ffmpeg
brew install Z

# Web Development Dependencies
brew install node
brew install yarn
brew tap mongodb/brew
brew install mongodb-community@3.6

brew cask install sublime-text
brew cask install zoomus
brew cask install webstorm
brew cask install slack
brew cask install dropbox
brew cask install 1password
brew cask install firefox

# Remove outdated versions from the cellar.
brew cleanup
