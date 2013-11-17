#!/bin/bash

# Upgrade the guest
apt-get update
apt-get -y upgrade

# Add the freelan repository
grep "freelan" || echo "deb http://debian.freelan.org/ wheezy-backports main" | tee -a /etc/apt/sources.list
wget -q http://debian.freelan.org/debian.freelan.org.key -O- | apt-key add -

# Copy the certificate files
mkdir -p /etc/freelan
cp /vagrant_config/ca.crt /etc/freelan/
cp /vagrant_config/alice.crt /etc/freelan/
cp /vagrant_config/alice.key /etc/freelan/
cp /vagrant_config/bob.crt /etc/freelan/
cp /vagrant_config/chris.crt /etc/freelan/

# Install freelan
apt-get update
apt-get -y install freelan

# Copy the configuration file
cp /vagrant_config/alice.conf /etc/freelan/freelan.conf

# Enable the configuration
sed -i 's/^#CONFIGURATIONS/CONFIGURATIONS/g' /etc/default/freelan

# Restart the service
service freelan start
