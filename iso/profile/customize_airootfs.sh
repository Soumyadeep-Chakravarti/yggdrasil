#!/usr/bin/env bash

set -euo pipefail

dracut \
    --force \
    --no-hostonly \
    --add "dmsquash-live systemd udev-rules squash-erofs" \
    /boot/initramfs-linux.img \
    "$(pacman -Q linux | awk '{print $2}')"
