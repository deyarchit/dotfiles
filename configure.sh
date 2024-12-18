#!/bin/bash

# # Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Updating package lists..."
brew update
# zsh install
echo ''
echo "Now installing zsh..."
echo ''
brew install zsh zsh-completions

# Installing git completion
echo ''
echo "Now installing bash-completion..."
brew install bash-completion

echo ''
echo "Now configuring git-completion..."
GIT_VERSION=`git --version | awk '{print $3}'`
URL="https://raw.github.com/git/git/v$GIT_VERSION/contrib/completion/git-completion.bash"
echo ''
echo "Downloading git-completion for git version: $GIT_VERSION..."
if ! curl "$URL" --silent --output "$HOME/.git-completion.bash"; then
	echo "ERROR: Couldn't download completion script. Make sure you have a working internet connection." && exit 1
fi

# oh-my-zsh install
echo ''
echo "Now installing oh-my-zsh..."
echo ''
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# oh-my-zsh plugin install
echo ''
echo "Now installing oh-my-zsh plugins..."
echo ''
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# # powerlevel9k install
# echo ''
# echo "Now installing powerlevel9k..."
# echo ''
# git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# # vimrc vundle install
# echo ''
# echo "Now installing vundle..."
# echo ''
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# # Pathogen install
# echo ''
# echo "Now installing Pathogen..."
# echo ''
# mkdir -p ~/.vim/autoload ~/.vim/bundle && \
# 	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# # Nerdtree for vim install
# echo ''
# echo "Now installing Nerdtree for Vim..."
# echo ''
# git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

# Vim color scheme install
# echo ''
# echo "Now installing vim wombat color scheme..."
# echo ''
# git clone https://github.com/sheerun/vim-wombat-scheme.git ~/.vim/colors/wombat 
# mv ~/.vim/colors/wombat/colors/* ~/.vim/colors/

# # Midnight commander install
# echo ''
# echo "Now installing Midnight commander..."
# echo ''
# brew install mc

# # Speedtest-cli and jq install
# brew install jq speedtest-cli

# # Pull down personal dotfiles
# echo ''
# read -p "Do you want to use jldeen's dotfiles? y/n" -n 1 -r
# echo    # (optional) move to a new line
# if [[ $REPLY =~ ^[Yy]$ ]]
# then
#     echo ''
# 	echo "Now pulling down jldeen dotfiles..."
# 	git clone https://github.com/jldeen/dotfiles.git ~/.dotfiles
# 	echo ''
# 	cd $HOME/.dotfiles && echo "switched to .dotfiles dir..."
# 	echo ''
# 	echo "Checking out macOS branch..." && git checkout mac
# 	echo ''
# 	echo "Now configuring symlinks..." && $HOME/.dotfiles/script/bootstrap
#     if [[ $? -eq 0 ]]
#     then
#         echo "Successfully configured your environment with jldeen's macOS dotfiles..."
#     else
#         echo "jldeen's macOS dotfiles were not applied successfully..." >&2
# fi
# else 
# 	echo ''
#     echo "You chose not to apply jldeen's macOS dotfiles. You will need to configure your environment manually..."
# 	echo ''
# 	echo "Setting defaults for .zshrc and .bashrc..."
# 	echo ''
# 	echo "source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc && echo "added zsh-syntax-highlighting to .zshrc..."
# 	echo ''
# 	echo "source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc && echo "added zsh-autosuggestions to .zshrc..."
# 	echo ''
# 	echo "source $HOME/.git-completion.bash" >> ${ZDOTDIR:-$HOME}/.bashrc && echo "added git-completion to .bashrc..."
	
# fi

# Set default shell to zsh
echo ''
read -p "Do you want to change your default shell? y/n" -n 1 -r
echo ''
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Now setting default shell..."
    chsh -s $(which zsh); exit 0
    if [[ $? -eq 0 ]]
    then
        echo "Successfully set your default shell to zsh..."
    else
        echo "Default shell not set successfully..." >&2
fi
else 
    echo "You chose not to set your default shell to zsh. Exiting now..."
fi
echo ''
echo '	Badass macOS terminal installed!'
