#!/bin/bash

sudo yum install make autoconf automake libnl3-devel openssl-devel iptables-devel ipset-devel file-devel net-snmp-devel glib2-devel pcre2-devel libnftnl-devel libmnl-devel libsystemd-devel -y
sudo wget https://keepalived.org/software/keepalived-2.2.0.tar.gz -O /tmp/keepalived.tar.gz
sudo tar xvzf /tmp/keepalived.tar.gz -C /tmp
sudo /tmp/keepalived-2.2.0/configure
sudo make
sudo make install
sudo mkdir /etc/keepalived
sudo cp /tmp/keepalived.conf /etc/keepalived/keepalived.conf
sudo systemctl daemon-reload
sudo systemctl enable keepalived
sudo systemctl start keepalived