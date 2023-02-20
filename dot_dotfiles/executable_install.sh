# Xcode
xcode-select --install

# Install brew

echo "Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Basic requirements. 
echo "Installing some basic brew packages"
brew install zsh
brew install chezmoi

# Oh MY ZSH
echo "Installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Casks
echo "tapping casks"
tap "homebrew/cask"

