#!/bin/bash

# Sets Pi hostname to the model, revision, and serial number

echo $(cat /proc/cpuinfo | grep Model | cut -d\: -f2 | sed -e 's/ Raspberry //' | sed -e 's/[\ \.]/\-/g' | tr '[:upper:]' '[:lower:]')-$(cat /proc/cpuinfo | grep Serial | cut -d\: -f2 | sed -e 's/^ //') > /etc/hostname
echo Setting hostname to $(cat /etc/hostname)
hostname $(cat /etc/hostname)
