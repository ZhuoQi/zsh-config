#!/bin/bash
# This script setups the environment for zsh

# Install zsh and oh-my-zsh
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install power10k theme files
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Copy config files
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh
