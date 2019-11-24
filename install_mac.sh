#!/bin/bash
# This script setups the environment for zsh
USER_NAME=$(id -un)

# Copy Fonts for system-wide access
sudo cp fonts/* /Library/Fonts/

# Install zsh and oh-my-zsh
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install power10k theme files
zsh -c "git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k"

# Copy config files
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh

# Change default shell
sudo chsh -s /usr/local/bin/zsh $USER_NAME
