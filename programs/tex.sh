echo "Install LaTeX and some packages..."

# Install texlive as LaTex-distro
sudo dnf install -y texlive

# Install additional texlive packages
sudo dnf install -y texlive-moderncv texlive-fontawesome5 texlive-multirow texlive-arydshln lastpage texlive-luatex texlive-fontspec

# Install texstudio for easy editing
sudo dnf install -y texstudio