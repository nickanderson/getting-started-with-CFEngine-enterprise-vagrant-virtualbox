#!/bin/bash
REPO="/vagrant/resources/repositories/localcache"

cat >/etc/yum.repos.d/local_cache.repo<<EOF
[local_cache]
name=Local Package Repository
baseurl=file://$REPO/\$basearch
enabled=1
gpgcheck=0
EOF
