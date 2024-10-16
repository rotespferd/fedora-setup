#!/bin/bash

echo "Create pre snapshot..."
timestamp=$(date +%Y%m%d%H%M%S)
pre_snapshot_number=$(sudo snapper -c root create --description pre-update-${timestamp} --type pre --cleanup number --print-number)

# Update the system
echo "--- Updating the system ---"
sudo dnf update -y

# Update flatpaks
echo ""
echo "--- Updating flatpaks ---"
flatpak update -y

# Update VS Code Extensions
echo ""
echo "--- Updating VS Code Extensions ---"
code --update-extensions

# Update OhMyZSH
echo ""
echo "--- Updating OhMyZSH ---"
/usr/bin/zsh -c "source /home/marian/.zshrc && omz update && exit"

echo "Create post snapshot..."
sudo snapper -c root create --description post-update-${timestamp} --type post --cleanup number --pre-number $pre_snapshot_number
