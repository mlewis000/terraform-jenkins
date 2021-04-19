#!/usr/bin/env bash

# Now  install puppet agent - give the EC2 a chance to install properly.
sleep 120

sudo rpm -ivh http://yum.puppet.com/puppet6/puppet6-release-el-7.noarch.rpm && sudo yum install puppet-agent -y
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo /opt/puppetlabs/puppet/bin/puppet module install puppet-jenkins --version 2.0.0
sudo cp /tmp/site.pp /etc/puppetlabs/code/environments/production/manifests/

sleep 120

# Now apply the module
sudo /opt/puppetlabs/puppet/bin/puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp


echo "==========================================="
echo "==========================================="
echo " "
echo " "
echo " "
echo "Now please copy the aws_instance_public_dns output (Below) into your browser."
echo "Test jenkinks via http, as in."
echo "http://ec2-ip-ip-ip-ip.eu-west-2.compute.amazonaws.com:8000"
echo " "
echo " "
echo " "
echo "==========================================="
echo "==========================================="


