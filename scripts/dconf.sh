#!/bin/bash

set -ouex pipefail

echo "import \"/usr/etc/dconf/db/local.d/01-ublue-custom\"" >> /usr/etc/dconf/db/local.d/01-ublue
