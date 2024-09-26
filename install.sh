echo "Setup Fedora client"

./hostname.sh
./ssh.sh

./programs/programs.sh
# only run gnome script if gnome is running
if [ "$XDG_CURRENT_DESKTOP" = "GNOME" ]; then
    ./gnome/gnome.sh
fi
./framework.sh
./backup/backup.sh

# last but not least
./dotfiles.sh