#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="yggdrasil"
iso_label="YGGDRASIL"
iso_publisher="Yggdrasil Project"
iso_application="Yggdrasil Arch-based Linux"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="arch"

bootmodes=('uefi.grub')

pacman_conf="pacman.conf"

airootfs_image_type="erofs"
airootfs_image_tool_options=('-zlzma,109' -E 'ztailpacking')

file_permissions=(
    ["/etc/shadow"]="0:0:400"
)
