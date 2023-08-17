# Prepare additional packages for Keycloak
# Source: https://www.keycloak.org/server/containers#_installing_additional_rpm_packages

FROM registry.access.redhat.com/ubi9 AS ubi-micro-build

ARG PACKAGES="util-linux shadow-utils gawk"

RUN mkdir -p /mnt/rootfs
RUN dnf install --installroot /mnt/rootfs ${PACKAGES} --releasever 9 --setopt install_weak_deps=false --nodocs -y; dnf --installroot /mnt/rootfs clean all

# Save original keycloak image as stage 

FROM quay.io/keycloak/keycloak:21.0.1 AS keycloak

# Modify keycloak image

FROM keycloak

COPY --from=ubi-micro-build /mnt/rootfs /

USER root

# Riptide tries to execute the debian-specific command addgroup
RUN ln -s /usr/sbin/groupadd /usr/sbin/addgroup

# Restore original /etc/group and /etc/passwd file
COPY --from=keycloak /etc/passwd /etc/group /etc/

USER keycloak
