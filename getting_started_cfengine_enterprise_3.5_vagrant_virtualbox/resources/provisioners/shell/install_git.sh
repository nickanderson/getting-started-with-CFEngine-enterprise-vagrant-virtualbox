#!/bin/bash
echo Installing git so we can host our own git server
yum --disablerepo * --enablerepo localcache -y install git
