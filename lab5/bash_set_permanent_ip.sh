#!/bin/bash

# Check if script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" >&2
    exit 1
fi

# Define the network configuration
NETPLAN_FILE="/etc/netplan/00-installer-config.yaml"
BACKUP_FILE="/etc/netplan/00-installer-config.yaml.bak"

# Backup the original netplan file
echo "Backing up current Netplan configuration to $BACKUP_FILE"
cp "$NETPLAN_FILE" "$BACKUP_FILE"

# Create the new netplan configuration
cat > "$NETPLAN_FILE" <<EOF
network:
  version: 2
  renderer: networkd
  ethernets:
    ens33:
      addresses:
        - 192.168.0.239/24
      routes:
        - to: default
          via: 192.168.0.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
EOF

# Apply the new network configuration
echo "Applying new network configuration..."
netplan apply

echo "Network configuration updated successfully."
echo "Static IP 192.168.0.239/24 has been set on ens33."
