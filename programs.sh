echo "Install programs..."

# Install basics
sudo dnf install -y wget curl git zsh

# Install editors
sudo dnf install -y neovim vim

# Install cli utilities
sudo dnf install -y alacritty kitty eza bat htop btop screenfetch neofetch

# Install zellij
sudo dnf copr enable -y varlad/zellij 
sudo dnf install -y zellij

# Install user programs
sudo dnf install -y nextcloud-client nextcloud-client-nautilus keepassxc
