#!/bin/bash
ssh_key=/vagrant/policyserver.id_rsa
SSH_DIR=~/.ssh
AUTHORIZED_KEYS=$SSH_DIR/authorized_keys

echo Generating and Installing SSH Key for Design Center 

# Generate passwordless ssh key if it does not exist
if [[ ! -f $ssh_key ]]; then
    ssh-keygen -N "" -f $ssh_key
    echo Created $ssh_key for use with Design Center
fi

# Create ssh directory if it does not exist
if [[ ! -d $SSH_DIR ]]; then
   mkdir $SSH_DIR
   chmod 700 $SSH_DIR
fi

# Create the authorized keys file if it does not exist
if [[ ! -f $AUTHORIZED_KEYS ]]; then
    touch $AUTHORIZED_KEYS
    chmod 600 $AUTHORIZED_KEYS
fi

# Append key to authorized keys if its not already there
if [[ ! $(grep "$(cat $ssh_key.pub)" $AUTHORIZED_KEYS) ]]; then
    cat "$ssh_key.pub" > $AUTHORIZED_KEYS
fi



