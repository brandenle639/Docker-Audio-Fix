#!/bin/bash
pulseaudio -k
sudo rm -r /tmp/pulseaudio.client.conf
sudo rm -r /tmp/pulseaudio.socket
echo "default-server = unix:/tmp/pulseaudio.socket" > /tmp/pulseaudio.client.conf
echo "# Prevent a server running in the container" >> /tmp/pulseaudio.client.conf
echo "autospawn = no" >> /tmp/pulseaudio.client.conf
echo "daemon-binary = /bin/true" >> /tmp/pulseaudio.client.conf
echo "# Prevent the use of shared memory" >> /tmp/pulseaudio.client.conf
echo "enable-shm = false" >> /tmp/pulseaudio.client.conf
pulseaudio --start
pactl load-module module-native-protocol-unix socket=/tmp/pulseaudio.socket
