#!/bin/bash
# Allow i386 Arch
dpkg --add-architecture i386 && \
apt-get update && \
apt-get install wget gnupg2 software-properties-common -y

apt install -y apt-transport-https

# We configureren nu de winehq key en repository
wget -nc https://dl.winehq.org/wine-builds/winehq.key

apt-key add winekq.key && \
add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'


wget -nv https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_22.04/Release.key -O Release.key &&
apt-key add - < Release.key &&
apt-add-repository 'deb https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_22.04/ ./'

# Update repository
apt-get update

# Install Wine
apt-get install -y --install-recommends winehq-stable winbind
apt-get install -y xvfb

# Clean Key Files
rm winehq.key Release.key

wine --version

#Install Winetricks
wget https://raw.githubusercontent.com/Winetricks/wintetricks/master/src/winetricks -O /usr/sbin/winetricks
chmod a+x /user/sbin/winetricks