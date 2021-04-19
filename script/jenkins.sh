#!/usr/bin/env bash

sleep 120
sudo rpm -ivh http://yum.puppet.com/puppet6/puppet6-release-el-7.noarch.rpm && sudo yum install puppet-agent -y
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo /opt/puppetlabs/puppet/bin/puppet module install puppet-jenkins --version 2.0.0
sudo cp /tmp/site.pp /etc/puppetlabs/code/environments/production/manifests/
sleep 60
sudo /opt/puppetlabs/puppet/bin/puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp

