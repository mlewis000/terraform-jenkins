#!/usr/bin/env bash

sudo rpm -ivh http://yum.puppet.com/puppet6/puppet6-release-el-7.noarch.rpm && sudo yum install puppet-agent -y
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo /opt/puppetlabs/puppet/bin/puppet module install puppet-jenkins --version 2.0.0
sudo cp /tmp/site.pp /etc/puppetlabs/code/environments/production/manifests/
sudo /opt/puppetlabs/puppet/bin/puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp
#sudo cp jenkins /etc/sysconfig/jenkins
#sudo systemctl restart jenkins

