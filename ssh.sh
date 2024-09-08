my_hostname="$(hostname)"

echo "Create new default SSH key..."
ssh-keygen -t ed25519 -a 100 -C "${my_hostname} - ${USER}" -f $HOME/.ssh/id_$my_hostname

ssh-add $HOME/.ssh/id_$my_hostname
