#!/bin/bash
set -e

pacman-key --init
pacman-key --add /usr/share/pacman/keyrings/bakeryos.gpg
pacman-key --lsign-key CA84BBC8E84F588C2C7F01FEE3A76FC537D6E842
