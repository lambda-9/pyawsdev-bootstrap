binaries=(
  python
  sshfs
  trash
  git
  mosh
  tmux
  screen
  zsh
  mackup
  pyenv
)

# Apps
apps=(
  dropbox
  google-drive
  google-chrome
  firefox
  mailbox
  slack
  telegram
  skype
  spotify
  vlc
  flash
  transmission
  alfred
  iterm2
  totalterminal
  appcleaner
  qlprettypatch
  qlstephen
  quicklook-json
  qlmarkdown
  rescuetime
  teamviewer
  ghc
  1password
  cyberduck
  psequel
  mamp
  vmware-fusion
  monodraw
  mendeley-desktop
  textmate
  atom
  league-of-legends
  battle-net
  minecraft
)


# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

echo "installing binaries..."
brew install ${binaries[@]}

brew cleanup

brew install caskroom/cask/brew-cask

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# Install python versions
eval "$(pyenv init -)"
pyenv install 2.7.9
pyenv install 3.4.2
pyenv rehash
pyenv global 2.7.9

sudo easy_install pip

# Disable hold key giving char accent menu
defaults write -g ApplePressAndHoldEnabled -bool false
# Disable the dashboard (not necessary after disabled in Mission Control?)
defaults write com.apple.dashboard mcx-disabled -boolean YES
# Enable the locate command/database
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist