#!/bin/bash

# Sets Pi hostname to the model, revision, and serial number
# Run as root

echo $(cat /proc/cpuinfo | grep Model | cut -d\: -f2 | sed -e 's/ Raspberry //' | sed -e 's/[\ \.]/\-/g' | tr '[:upper:]' '[:lower:]')-$(cat /proc/cpuinfo | grep Serial | cut -d\: -f2 | sed -e 's/^ //') > /etc/hostname
echo Setting hostname to $(cat /etc/hostname)
hostname $(cat /etc/hostname)
(cat /etc/hosts | grep -v 127.0.1.1 && echo 127.0.1.1 $(cat /etc/hostname)) > /etc/hosts.new && mv /etc/hosts /etc/hosts.old && mv /etc/hosts.new /etc/hosts
echo "Exit shell or reboot to fully activate."
