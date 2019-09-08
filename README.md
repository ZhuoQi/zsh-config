# zsh-config
This repo manages the configs for `zsh` through `oh-my-zsh` based on `Powerlevel10k` theme. Some of the installation steps can be automated, they will be handled progressively.

## Pre-setup Zsh and Theme
1. Install zsh
	1. install zsh `sudo apt install zsh` for Linux systems, `brew install zsh` for Mac systems
	2. switch default shell to zsh. For linux, `chsh -s /usr/bin/zsh user_name_here`.
2. Get `oh-my-zsh` (more comprehensive guide at https://www.howtoforge.com/tutorial/how-to-setup-zsh-and-oh-my-zsh-on-linux/)
	1. Either: execute `install.sh` from `https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh`
	2. Or: wget piped to zsh `wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh`
3. Get `powerlevel10k` at https://github.com/romkatv/powerlevel10k through the `Oh My Zsh` method.
	1. Copy theme files `git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k`
	2. Install `Meslo Nerd Font`
	3. [Optional] Reset the configurations through `p10k configure`

## Usage
1. Place actual configuration files to the correct places
	1. `.zshrc`
	2. `.profile`
	3. `.p10k.zsh`
 
