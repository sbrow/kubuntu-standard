#!/usr/bin/env bash

# Installs the KDE Desktop environment

# Update database
sudo apt-get update

# Install KDE
sudo apt-get install -y kde-standard puppet

# Create sddm config directory
SDDM_CONF=/etc/sddm.conf.d
if [ ! -d $SDDM_CONF ]; then
    echo "Creating /etc/sddm.conf.d"
    sudo mkdir $SDDM_CONF
fi

# Enable auto-login
AUTOLOGIN="$SDDM_CONF/autologin.conf"
if [ ! -f $AUTOLOGIN ]; then
    echo "Enabling auto-login"
    echo "[Autologin]
User=vagrant
Session=plasma.desktop" > /tmp/autologin.conf
    sudo mv /tmp/autologin.conf $SDDM_CONF
fi

# Upgrade packages
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade

sudo reboot