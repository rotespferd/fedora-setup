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
sudo dnf install -y nextcloud-client nextcloud-client-nautilus keepassxc libreoffice-langpack-de

# Install media programs
sudo dnf install -y ffmpeg-free yt-dlp vlc

# run other program scripts
./programs/flatpak.sh
./programs/vscode.sh
./programs/asdf.sh
./programs/programming-languages.sh
./programs/docker.sh
./programs/ulauncher.sh
./programs/tailscale.sh
./programs/ollama.sh