#!/bin/bash
REPO="/vagrant/resources/repositories/localcache"

cat >/etc/yum.repos.d/local_cache.repo<<EOF
[localcache]
name=Local Package Repository
baseurl=file://$REPO/
enabled=1
gpgcheck=0
EOF
