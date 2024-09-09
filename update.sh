#!/bin/bash

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