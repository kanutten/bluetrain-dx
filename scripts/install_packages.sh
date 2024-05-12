#!/bin/bash

set -ouex pipefail

utility_packages=(
  "flameshot"
)

packages=(
  ${utility_packages[@]}
)

rpm-ostree install ${packages[@]} 