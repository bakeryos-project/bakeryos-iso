#!/usr/bin/env bash
#
# Install local testing packages staged by mkiso.sh from testing/pacman/.
# The host directory is copied to /tmp/testing-pkg inside the chroot before
# hooks run, so this hook can install it with pacman -U.
set -euo pipefail

shopt -s nullglob

packages=(/tmp/testing-pkg/*.pkg.tar.zst)

if (( ${#packages[@]} == 0 )); then
    echo "No local testing packages to install."
    exit 0
fi

echo "Installing local testing packages:"
printf '  %s\n' "${packages[@]##*/}"

# libalpm's CheckSpace option needs /proc to resolve mount points, but hooks
# run in a plain chroot where /proc is not mounted. Drop the option in a
# temporary copy of the config instead of mounting /proc.
pacman_conf=/tmp/pacman-testing.conf
trap 'rm -f -- "${pacman_conf}"' EXIT
grep -vE '^[[:space:]]*CheckSpace([[:space:]]|$)' /etc/pacman.conf >"${pacman_conf}" || true

pacman -U --noconfirm --config "${pacman_conf}" "${packages[@]}"
