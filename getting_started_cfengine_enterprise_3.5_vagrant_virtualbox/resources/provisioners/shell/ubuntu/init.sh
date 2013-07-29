#!/bin/bash
PACKAGE=$1
PACKAGE_VER=$2
ARCH=$(uname -i)
if [[  "$ARCH" == "x86_64" ]]; then
    PACKAGE_ARCH="amd64"
else
    PACKAGE_ARCH="$ARCH"
fi

REPO_PATH="/vagrant/resources/repositories/cfengine_enterprise/Ubuntu/$PACKAGE_ARCH"

echo Checking $PACKAGE

if $(/usr/bin/dpkg --status $PACKAGE 2> /dev/null); then
    echo $PACKAGE already installed
else
    PKG_PATH="${REPO_PATH}/${PACKAGE}_${PACKAGE_VER}_${PACKAGE_ARCH}.deb"

    echo Installing $PACKAGE from $PKG_PATH

    if [[ -f $PKG_PATH ]]; then
        echo Installing from local DEB
        /usr/bin/dpkg -i $PKG_PATH
    fi
fi

#/bin/chmod 600 /vagrant/resources/design_center_config.cf
#for i in $(/usr/bin/seq 3); do
#    /var/cfengine/bin/cf-agent -KI /vagrant/resources/design_center_config.cf
#done
