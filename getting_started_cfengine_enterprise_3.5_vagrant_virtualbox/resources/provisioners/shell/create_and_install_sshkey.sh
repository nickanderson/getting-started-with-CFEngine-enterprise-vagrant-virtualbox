#!/bin/bash
#ssh_key=/vagrant/policyserver.id_rsa
#SSH_USER=git
#masterfiles_git="/opt/cfengine/masterfiles.git"
#SSH_DIR=$(grep $SSH_USER /etc/passwd | cut -d ":" -f6)/.ssh
#AUTHORIZED_KEYS=$SSH_DIR/authorized_keys
#git_user=git
#
#ssh_key=/vagrant/policyserver.id_rsa
#SSH_USER=git
#masterfiles_git="masterfiles.git"
#
#AUTHORIZED_KEYS=$SSH_DIR/authorized_keys
echo Generating and Installing SSH Key for Design Center 


SSH_USER=git
if [[ ! $(id $SSH_USER &> /dev/null) ]]; then
    echo Creating git user: $SSH_USER
    /usr/sbin/useradd $SSH_USER &> /dev/null
fi

source /vagrant/resources/shell_provisioners/common_vars
SSH_DIR="$(grep $SSH_USER /etc/passwd | cut -d ":" -f6)/.ssh"
# Generate passwordless ssh key if it does not exist
if [[ ! -f $ssh_key ]]; then
    ssh-keygen -C "Mission Portal Git User" -N "" -f $ssh_key
    echo Created $ssh_key for use with Design Center
fi

# Create ssh directory if it does not exist
if [[ ! -d $SSH_DIR ]]; then
   echo Creating $SSH_DIR
   mkdir -p $SSH_DIR
   chmod 700 $SSH_DIR
fi

# Create the authorized keys file if it does not exist
if [[ ! -f $AUTHORIZED_KEYS ]]; then
    echo Creating $AUTHORIZED_KEYS
    touch $AUTHORIZED_KEYS
    chmod 600 $AUTHORIZED_KEYS
fi

# Append key to authorized keys if its not already there
if [[ ! $(grep "$(cat $ssh_key.pub)" $AUTHORIZED_KEYS) ]]; then
    echo Authorizing $ssh_key.pub in $AUTHORIZED_KEYS
    cat "$ssh_key.pub" > $AUTHORIZED_KEYS
fi

chown -R $SSH_USER:$SSH_USER $SSH_DIR

