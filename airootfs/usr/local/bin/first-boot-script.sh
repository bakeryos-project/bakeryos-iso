#!/bin/bash

bakeryos-update

systemctl disable first-boot.service

rm -f /etc/systemd/system/first-boot.service
rm -f /etc/systemd/system/multi-user.target.wants/first-boot.service
systemctl daemon-reload

