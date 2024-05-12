ARG SOURCE_IMAGE="bluefin-dx"
#ARG SOURCE_SUFFIX="-main"
ARG SOURCE_TAG="39"
FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}


COPY build.sh /tmp/build.sh
COPY system_files /
COPY scripts /tmp/scripts

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    /tmp/scripts/just.sh && \
    ostree container commit




    ## NOTES:
# - /var/lib/alternatives is required to prevent failure with some RPM installs
# - All RUN commands must end with ostree container commit
#   see: https://coreos.github.io/rpm-ostree/container/#using-ostree-container-commit
