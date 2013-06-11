#!/bin/bash
masterfiles_git="/opt/cfengine/masterfiles.git"
base_masterfiles="/var/cfengine/share/NovaBase"
overlay_masterfiles="/vagrant/resources/overlay_var_cfengine/masterfiles"
tmp_masterfiles="/tmp/masterfiles"

# only do this if a git repo doesnt exist already so that subsequent reboots
# dont error or wipe out configs

if [[ ! -d $masterfiles_git ]]; then
    echo Initalizing new GIT repository for use with Design Center
    # Initalize a new bare repository for use with the environment
    mkdir -p $masterfiles_git
    cd $masterfiles_git
    git init --bare
    
    # Checkout to a temporary location (make sure it doesnt exist first) so we
    # can seed the repository with default masterfiles and any overlay
    if [[ -d $tmp_masterfiles ]]; then
        rm -rf $tmp_masterfiles
    fi

    git clone $masterfiles_git $tmp_masterfiles
    cp -Rv $base_masterfiles/* $tmp_masterfiles/
    cp -Rv $overlay_masterfiles/* $tmp_masterfiles/
    cd $tmp_masterfiles

    # We need to set some defaults or we get errors on the commit
    git config user.email "root@policyserver"
    git config user.name "Root"
    git config push.default matching

    git add .
    git commit -m "Initalize masterfiles repository"

    # Since we initilized a new repository we have to specity the branch to
    # create it on the origin
    git push origin master && rm -rf $tmp_masterfiles
fi
