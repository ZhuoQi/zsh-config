# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install wget
brew install autojump

# make a temp directory for storing all intermediate files
echo "Created a temporary folder at ~/tmp"
cd ~
mkdir tmp
cd tmp
touch env.sh
chmod 755 env.sh

# setup iterm profile

# setup vim
cp .vimrc ~/.vimrc
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle
git clone https://github.com/preservim/nerdtree.git
git clone https://github.com/universal-ctags/ctags.git
git clone https://github.com/ludovicchabant/vim-gutentags.git
git clone https://github.com/dense-analysis/ale.git

# setup zsh and fix permissions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo 'export ZSH_THEME="powerlevel10k/powerlevel10k"' >> env.sh
git -C $ZSH_CUSTOM/themes/powerlevel10k pull
compaudit | xargs chmod g-w,o-w

# add zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# setup conda
wget -O install_conda.sh https://repo.anaconda.com/miniconda/Miniconda3-py39_4.9.2-MacOSX-x86_64.sh
chmod 755 install_conda.sh
./install_conda.sh -b
echo 'export CONDA_PATH=$HOME/miniconda3/bin' >> env.sh
echo 'export PATH=$PATH:$CONDA_PATH' >> env.sh
source env.sh

# finish all zshrc changes
conda init zsh
mv env.sh ~/env.sh
brew install zsh-syntax-highlighting
brew install tree
echo 'source ~/env.sh'"\n$(cat ~/.zshrc)" > ~/.zshrc
echo 'source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc
echo '[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh' >> ~/.zshrc

# clean up
rm -r ~/tmp
