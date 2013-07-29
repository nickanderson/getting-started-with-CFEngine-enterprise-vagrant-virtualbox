#!/bin/bash

POLICY_FILE="/vagrant/resources/provisioners/CFEngine/config.cf"
echo Activating agent run to speed convergence
chmod 600 $POLICY_FILE
/var/cfengine/bin/cf-agent -KIf $POLICY_FILE
/var/cfengine/bin/cf-agent -KIf $POLICY_FILE
/var/cfengine/bin/cf-agent -KIf $POLICY_FILE
