#!/bin/bash

DISTRO=$(lsb_release -is)
PACKAGE=$1
PACKAGE_VERSION=$2

if [[ "$DISTRO" == "Ubuntu" ]]; then

    /vagrant/resources/shell_provisioners/ubuntu/init.sh $PACKAGE $PACKAGE_VERSION

elif [[ "$DISTRO" == "CentOS" || "$DISTRO" == "RedHat" ]]; then

    /vagrant/resources/shell_provisioners/redhat/init.sh $PACKAGE $PACKAGE_VERSION

fi

