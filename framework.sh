COMPUTER_MAKER=$(sudo dmidecode -t system | grep 'Manufacturer:' | awk '{print $2}')

if [ "$COMPUTER_MAKER" == "Framework" ]; then
	echo "Config Framework Laptop..."

	gsettings set org.gnome.desktop.interface text-scaling-factor 1
	gsettings set org.gnome.desktop.interface cursor-size 16

	gsettings set org.gnome.desktop.interface show-battery-percentage true
fi
