#!/bin/bash

# Description:
# This script sets certain parameters in /etc/ssh/sshd_config.
# It's not production-ready and is intended for training purposes.

# What should it do?
# * Check whether an /etc/ssh/sshd_config file exists
# * Create a backup of this file
# * Edit the file to set certain parameters
# * Reload the sshd configuration

# To enable debugging mode, remove '#' from the following line
# set -x

file="$1"
param[1]="PermitRootLogin"
param[2]="PubkeyAuthentication"
param[3]="AuthorizedKeysFile"
param[4]="PasswordAuthentication"

usage() {
    cat << EOF
usage: $0 ARG1
ARG1: Name of the sshd_config file to edit. If empty, /etc/ssh/sshd_config will be used as default.
EOF
}

# Check if the file argument is empty
if [ -z "$file" ]; then
    file="/etc/ssh/sshd_config"
fi

# Ensure the file exists
if [ ! -f "$file" ]; then
    echo "Error: $file does not exist."
    usage
    exit 1
fi

# Create a backup
cp "$file" "$file.bak"

# Edit the file with desired parameters
for p in "${param[@]}"; do
    sed -i "s/^$p.*/$p yes/" "$file"
done

# Reload SSH daemon configuration
systemctl reload sshd

echo "Configuration updated successfully!"