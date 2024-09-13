echo "Install and config Gnome Theme..."

# Add Nord icon theme
sudo dnf copr enable -y alvatip/Nordzy-icon
sudo dnf install -y Nordzy-icon
# Set icon theme in Gnome
gsettings set org.gnome.desktop.interface icon-theme 'Nordzy'

# Add Nord theme
mkdir -p ~/.themes
wget -O /tmp/Nordic.tar.xz https://github.com/EliverLara/Nordic/releases/download/v2.2.0/Nordic.tar.xz
tar -xf /tmp/Nordic.tar.xz -C ~/.themes

# Set Gnome theme
gsettings set org.gnome.desktop.interface gtk-theme "Nordic"
gsettings set org.gnome.desktop.wm.preferences theme "Nordic"