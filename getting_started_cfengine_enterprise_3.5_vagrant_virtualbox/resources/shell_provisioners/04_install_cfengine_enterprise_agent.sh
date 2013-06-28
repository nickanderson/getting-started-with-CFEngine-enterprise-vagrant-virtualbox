#!/bin/bash
PACKAGE="cfengine-nova"
PACKAGE_VER="3.5.0-1"
PACKAGE_ARCH="x86_64"
PATH="/vagrant/resources/repositories/cfengine_enterprise/EL6/x86_64"

echo Checking $PACKAGE
#yum -y install cfengine-nova-hub
if $(/bin/rpm --query --quiet $PACKAGE); then
    echo $PACKAGE already installed
else
    echo Installing $PACKAGE
    if [[ -f $PATH/$PACKAGE-$PACKAGE_VER.$PACKAGE_ARCH.rpm ]]; then
        echo Installing from local RPM
        /bin/rpm -i /$PATH/$PACKAGE-$PACKAGE_VER.$PACKAGE_ARCH.rpm
    fi
fi
