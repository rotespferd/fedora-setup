echo "Install and configure restic..."

sudo dnf install -y restic

# Add SSH key to NAS
echo "Type in hostname of NAS:"
read nas

my_hostname="$(hostname)"

ssh-copy-id -i $HOME/.ssh/id_$my_hostname $USER@$nas

echo "Type in password for repo:"
read repopw

echo "Type in path to repo:"
read repopath

# Create restic backup service
cat >$HOME/.config/restic_excluded_files.txt <<EOF
/home/${USER}/.cache
/home/${USER}/.local/share/Trash
/home/${USER}/.local/share/gnome-boxes
/home/${USER}/Downloads
/home/${USER}/Nextcloud
/home/${USER}/.var/app/com.google.AndroidStudio
/home/${USER}/.local/share/waydroid
EOF


#
# restic backup service
#
cat >/tmp/restic_backup_nas.service <<EOF
[Unit]
Description=Restic backup service to NAS

[Service]
Type=simple
ExecStart=/bin/bash -c 'export RESTIC_PASSWORD=${repopw}; restic -r ${repopath} backup --host ${my_hostname} --tag home --tag ${USER} --exclude-file /home/${USER}/.config/restic_excluded_files.txt /home/${USER}; unset RESTIC_PASSWORD'

[Install]
WantedBy=multi-user.target
EOF

sudo mv /tmp/restic_backup_nas.service /etc/systemd/user/restic_backup_nas.service
systemctl --user daemon-reload

# Create restic backup timer to run backup every 3 hours
cat >/tmp/restic_backup_nas.timer <<EOF
[Unit]
Description=Restic backup timer to NAS

[Timer]
OnCalendar=00/3:30
Persistent=true

[Install]
WantedBy=timers.target
EOF

sudo mv /tmp/restic_backup_nas.timer /etc/systemd/user/restic_backup_nas.timer
systemctl --user daemon-reload

systemctl --user enable --now restic_backup_nas.timer

#
# restic forget service
#
cat >/tmp/restic_forget_nas.service <<EOF
[Unit]
Description=Restic forget service to NAS

[Service]
Type=simple
ExecStart=/bin/bash -c 'export RESTIC_PASSWORD=${repopw}; restic -r ${repopath} forget --host ${my_hostname} --tag home --tag ${USER} --prune --keep-hourly 10 --keep-daily 10 --keep-weekly 5 --keep-monthly 12 --keep-yearly 10; unset RESTIC_PASSWORD'

[Install]
WantedBy=multi-user.target
EOF

sudo mv /tmp/restic_forget_nas.service /etc/systemd/user/restic_forget_nas.service
systemctl --user daemon-reload

# Create restic forget timer to run forget every day
cat >/tmp/restic_forget_nas.timer <<EOF
[Unit]
Description=Restic forget timer to NAS

[Timer]
OnCalendar=*-*-* 18:00:00
Persistent=true

[Install]
WantedBy=timers.target
EOF

sudo mv /tmp/restic_forget_nas.timer /etc/systemd/user/restic_forget_nas.timer
systemctl --user daemon-reload

systemctl --user enable --now restic_forget_nas.timer

echo "Restic backup and forget service configured"
echo "Restic backup and forget service will run every 3 hours and every day at 18:00"
echo "Restic backup will keep 7 daily, 4 weekly and 6 monthly snapshots"
echo "Restic backup will exclude the following files:"
cat $HOME/.config/restic_excluded_files.txt
echo "Restic backup and forget service can be controlled with systemctl --user start/stop/status restic_backup_nas.service and restic_forget_nas.service"