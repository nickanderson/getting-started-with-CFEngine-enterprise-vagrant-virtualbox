#!/bin/bash

chmod 600 /vagrant/resources/config.cf
/var/cfengine/bin/cf-agent -KIf /vagrant/resources/shell_provisioners/policy_server_config.cf
/var/cfengine/bin/cf-agent -KIf /vagrant/resources/shell_provisioners/policy_server_config.cf
/var/cfengine/bin/cf-agent -KIf /vagrant/resources/shell_provisioners/policy_server_config.cf
