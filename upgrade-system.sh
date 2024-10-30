#!/bin/sh

# get version to upgrade to from argument
version=$1

# ask if the user wants to update the system
echo "Do you want to update the system? (y/n)"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Updating the system to version ${version}..."

    echo "Create snapshot..."
    sudo snapper -c root create --description system-upgrade-${version} 

    sudo dnf upgrade --refresh -y

    sudo dnf system-upgrade download --releasever=${version}
    
    echo "Upgrade done. Reboot to apply changes."

    # send desktop notification
    notify-send -i dialog-information -t 10000 "System upgraded" "System has been upgraded. Reboot to apply changes."
else
    echo "System not updated."
fi