#!/bin/bash
cd /home/container

# Wine Versie
wine --version

# Als .wine niet bestaat, kopieer de backup
if [ ! -d /home/container/.wine ];
then echo "Wineprefix is not found, initializing wine" && winecfg && /usr/sbin/winetricks
echo "Configured Succesfully"

fi;

# Vervangt de startip variabelen
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":home/container$ ${MODIDIEF_STARTUP}"

# Start de server
${MODIDIEF_STARTUP}