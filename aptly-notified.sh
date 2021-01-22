#!/bin/bash

#Environment Variables
FROM="from@example.com"
TO="to@example.com"

apt update &> /dev/null

UPGRADABLE="$(apt list --upgradable | sed 's/Listing...//g' | sed '/^$/d')" &> /dev/null

echo "$UPGRADABLE" > /tmp/upgrade.items
HS="$(cat /proc/sys/kernel/hostname)"

#Empty output still puts an empty line in the file. sed'ing out.
sed -i '/^$/d' /tmp/upgrade.items

if [ -s /tmp/upgrade.items ]
then
    mail -a "Subject: ${HS}: Updates Available" -a "From: APT Updates <${FROM}>" ${TO} < /tmp/upgrade.items
    exit 0
else
    echo "Have a good day!" | mail -a "Subject: ${HS}: No Updates" -a "From: No APT Updates <${FROM}>" ${TO}
    exit 0
fi
