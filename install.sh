echo "Setup Fedora client"

./hostname.sh
./ssh.sh

./programs/programs.sh
./gnome/gnome.sh
./framework.sh
./backup/backup.sh

# last but not least
./dotfiles.sh