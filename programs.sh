echo "Install programs..."

# Install basics
sudo dnf install -y wget curl git zsh

# Install editors
sudo dnf install -y neovim vim

# Install user programs
sudo dnf install -y nextcloud-client nextcloud-client-nautilus keepassxc
