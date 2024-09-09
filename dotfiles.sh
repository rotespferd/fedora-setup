echo "Add my dotfiles..."

# add ohmyzsh and powerline10k
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# download and add nerdfont of monaspace
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Monaspace.zip -O /tmp/Monaspace.zip
unzip /tmp/Monaspace.zip -d /tmp/Monaspace
mkdir -p ~/.local/share/fonts
mv /tmp/Monaspace/* ~/.local/share/fonts/
fc-cache -fv

# install chezmoi
cd $HOME && curl -sfL https://git.io/chezmoi | sh

# clone my dotfiles
$HOME/bin/chezmoi init --apply git@codeberg.org:rotespferd/dotfiles.git

touch $HOME/.local.zsh