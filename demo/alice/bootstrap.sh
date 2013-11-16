#!/bin/bash

apt-get update
apt-get -y upgrade
grep "freelan" || echo "deb http://debian.freelan.org/ wheezy-backports main" | tee -a /etc/apt/sources.list
wget -q http://debian.freelan.org/debian.freelan.org.key -O- | apt-key add -
apt-get update
apt-get -y upgrade
apt-get -y install freelan
