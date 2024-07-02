#!/bin/bash

# Description:
# This script sets certain parameters in /etc/ssh/sshd_config.
# It's not production-ready and is intended for training purposes.

# What should it do?
# * Create a backup of the default /etc/ssh/sshd_config file
# * Edit the file to set certain parameters
# * Reload the sshd configuration

# To enable debugging mode, remove '#' from the following line
# set -x

file="/etc/ssh/sshd_config"  # Use the default file path

param[1]="PermitRootLogin"
param[2]="PubkeyAuthentication"
param[3]="AuthorizedKeysFile"
param[4]="PasswordAuthentication"

# Create a backup
cp "$file" "$file.bak"

# Edit the file with desired parameters
for p in "${param[@]}"; do
    sed -i "s/^$p.*/$p yes/" "$file"
done

# Reload SSH daemon configuration
systemctl reload sshd

echo "Configuration updated successfully!"
