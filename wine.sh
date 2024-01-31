#!/bin/bash

# Get the non-root username
current_user=$(logname)

# Enable multilib which is required for the wine repository
sudo sed -i ':a;N;$!ba;s@#\[multilib\]\n#Include = \/etc\/pacman.d\/mirrorlist\n@\[multilib\]\nInclude = \/etc\/pacman.d\/mirrorlist\n@' /etc/pacman.conf

packages=(
  wine
  wine-mono
)
pacman -S "${packages[@]}" --noconfirm
