#!/usr/bin/env bash

# Installs the KDE Desktop environment

# Update database
apt-get update

# Install KDE
apt-get install -y kde-standard

# Create sddm config directory
SDDM_CONF=/etc/sddm.conf.d
if [ ! -d $SDDM_CONF ]; then
    echo "Creating /etc/sddm.conf.d"
    mkdir $SDDM_CONF
fi

# Enable auto-login
AUTOLOGIN="$SDDM_CONF/autologin.conf"
if [ ! -f $AUTOLOGIN ]; then
    echo "Enabling auto-login"
    echo "[Autologin]
User=vagrant
Session=plasma.desktop" > $AUTOLOGIN
fi