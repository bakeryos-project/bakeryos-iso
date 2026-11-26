#!/usr/bin/env bash
set -euo pipefail

if getent group bakeryos >/dev/null; then
    exit 0
fi

if getent group 1000 >/dev/null; then
    exit 1
fi

groupadd -g 1000 bakeryos
