#!/bin/bash
PACKAGE=$1
PACKAGE_VER=$2
PACKAGE_ARCH="$(uname -i)"
EL_VER=$(lsb_release -rs | cut -b1)
LOCALPATH="/vagrant/resources/repositories/cfengine_enterprise/EL$EL_VER/$PACKAGE_ARCH"

echo Checking $PACKAGE

if $(/bin/rpm --query --quiet $PACKAGE); then
    echo $PACKAGE already installed
else
    echo Installing $PACKAGE
    if [[ -f $LOCALPATH/$PACKAGE-$PACKAGE_VER.$PACKAGE_ARCH.rpm ]]; then
        echo Installing from local RPM
        /bin/rpm -i $LOCALPATH/$PACKAGE-$PACKAGE_VER.$PACKAGE_ARCH.rpm
    fi
fi

#/bin/chmod 600 /vagrant/resources/design_center_config.cf
#for i in $(/usr/bin/seq 3); do
#    /var/cfengine/bin/cf-agent -KI /vagrant/resources/design_center_config.cf
#done
