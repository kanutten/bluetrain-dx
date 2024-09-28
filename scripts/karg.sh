#!/bin/bash

set -ouex pipefail

rpm-ostree kargs --append=i915.enable_psr=0
rpm-ostree kargs --append=psmouse.synaptics_intertouch=1