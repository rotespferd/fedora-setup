echo "Install and config snapper..."

sudo dnf install -y snapper

sudo cp ./backup/templates/snapper-root /etc/snapper/configs/root

sudo systemctl enable snapper-boot.timer
sudo systemctl start snapper-boot.timer
sudo systemctl enable snapper-timeline.timer
sudo systemctl start snapper-timeline.timer
sudo systemctl enable snapper-cleanup.timer
sudo systemctl start snapper-cleanup.timer