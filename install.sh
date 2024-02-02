#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo."
    exit 1
fi

if ping -c 1 aur.archlinux.org &> /dev/null; then
    echo "aur.archlinux.org is reachable. Proceeding with the script."
else
    echo "Error: Unable to ping aur.archlinux.org. Exiting."
    exit 1
fi

if sudo pacman -Syu --noconfirm; then
    echo "System updated successfully. Proceeding with the script."
else
    echo "Error: Unable to update the system with pacman -Syu. Exiting."
    exit 1
fi

./scripts/setup/setup.sh

./scripts/gnome/gnome.sh

./scripts/theme/theme.sh

pacman -R gnome-console --noconfirm # ew go away
