#!/bin/bash

POLICY_FILE="/vagrant/resources/shell_provisioners/policy_server_config.cf"
echo Activating agent run to speed convergence
chmod 600 $POLICY_FILE
/var/cfengine/bin/cf-agent -KIf $POLICY_FILE
/var/cfengine/bin/cf-agent -KIf $POLICY_FILE
/var/cfengine/bin/cf-agent -KIf $POLICY_FILE
