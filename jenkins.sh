#!/bin/bash

#Author: Carolle Matchum
#Date: March 1st, 2022

##This script is to automate the installing Jenkins on a CentOS 7 system using the official Jenkins repository.
sudo yum install java-1.8.0-openjdk-devel -y
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo yum install wget -y
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo
sudo yum install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
echo -e "\n Now we can open the ports necessary for Jenkins to work\n "
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp

sudo firewall-cmd --reload
