#!/bin/bash

set -ouex pipefail

utility=(
  "flameshot"
  "nextcloud-client"
  "nextcloud-client-nautilus"
  "sg3_utils"
)

extensions=(
  "gnome-shell-extension-just-perfection.noarch"
)

packages=(
  ${utility[@]}
  ${extensions[@]}
)

rpm-ostree install ${packages[@]} 