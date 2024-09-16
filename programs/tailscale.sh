echo "Install and config Tailscale..."

# Install tailscale
curl -fsSL https://tailscale.com/install.sh | sh

sudo tailscale up