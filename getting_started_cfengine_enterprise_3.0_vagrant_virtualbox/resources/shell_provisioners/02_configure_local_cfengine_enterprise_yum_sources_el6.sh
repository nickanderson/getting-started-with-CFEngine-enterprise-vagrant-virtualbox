#!/bin/bash
REPO="/vagrant/resources/repositories/cfengine_enterprise/el6"

cat >/etc/yum.repos.d/cfengine_enterprise.repo<<EOF
[cfengine_enterprise]
name=CFEngine Enterprise Local Package Repository
baseurl=file://$REPO/\$basearch
enabled=1
gpgcheck=0
EOF
