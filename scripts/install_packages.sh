#!/bin/bash

set -ouex pipefail

utility_packages=(
  "flameshot"
  "nextcloud-client"
  "nextcloud-client-nautilus"
)

packages=(
  ${utility_packages[@]}
)

rpm-ostree install ${packages[@]} 