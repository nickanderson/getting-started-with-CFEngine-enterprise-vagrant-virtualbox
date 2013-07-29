#!/bin/bash
REPO="/vagrant/resources/repositories/cfengine_enterprise/EL6"
EPEL_VER="6-8"

rpm -q epel-release || (wget http://epel.mirror.constant.com/6/i386/epel-release-$EPEL_VER.noarch.rpm && rpm -i epel-release-$EPEL_VER.noarch.rpm && rm epel-release-$EPEL_VER.noarch.rpm)

yum -y install yum-utils createrepo

echo "Creating local package repo structure, you may still need to place packages"
for arch in x86_64 i386; do
    if [ ! -d "$REPO/$arch" ]; then
        mkdir -p $REPO/$arch
    fi
done

echo "Updating package metadata"
for arch in x86_64 i386; do
    createrepo $REPO/$arch
done
