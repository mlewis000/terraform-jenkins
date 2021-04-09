#!/usr/bin/env bash

sudo yum update -y
sudo yum install wget -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install jenkins java-1.8.0-openjdk-devel -y
sudo sed 's/JENKINS_PORT="8080"/JENKINS_PORT="8000"/' /etc/sysconfig/jenkins > /tmp/jenkins8000
sudo cp /tmp/jenkins8000 /etc/sysconfig/jenkins
echo "Jenkins Admin Password is :"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
