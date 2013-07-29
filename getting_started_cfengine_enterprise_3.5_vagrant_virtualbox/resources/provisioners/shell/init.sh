#!/bin/bash

DISTRO=$(lsb_release -is)
PACKAGE=$1
PACKAGE_VERSION=$2

if [[ "$DISTRO" == "Ubuntu" ]]; then

    /vagrant/resources/provisioners/shell/ubuntu/init.sh $PACKAGE $PACKAGE_VERSION

elif [[ "$DISTRO" == "CentOS" || "$DISTRO" == "RedHat" ]]; then

    /vagrant/resources/provisioners/shell/redhat/init.sh $PACKAGE $PACKAGE_VERSION

fi

