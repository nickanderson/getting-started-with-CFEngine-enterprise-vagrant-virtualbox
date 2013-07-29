#!/bin/bash
yum --disablerepo=* --enablerepo=localcache -y install vim-enhanced
rsync -a /vagrant/resources/overlay_git_user_home/ /home/git/
cp /vagrant/policyserver.id_rsa  /home/git/.ssh/id_rsa
echo "git:git" | chpasswd
chown -R git:git /home/git
chmod 700 /home/git

#/home/git
#drwx------  4 git  git  4096 Jun 20 00:18 .
#drwx------  2 git  git  4096 Jun 20 00:17 .ssh
#/home/git/.ssh
#-rw------- 1 git git  405 Jun 20 00:17 authorized_keys
#-rw------- 1 git git 1675 Jun 20 00:17 id_rsa

