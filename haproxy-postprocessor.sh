#!/bin/bash
sudo mkdir /etc/haproxy
sudo mkdir -p /var/lib/haproxy/dev
sudo cp /tmp/haproxy.service /usr/lib/systemd/system/haproxy.service
sudo cp /tmp/haproxy.cfg /etc/haproxy/haproxy.cfg
sudo touch /etc/sysconfig/haproxy
# sudo groupadd haproxy
# sudo useradd -g haproxy haproxy
sudo systemctl daemon-reload
sudo systemctl enable haproxy
sudo systemctl start haproxy
sudo cat <<- EOF > /etc/rsyslog.d/haproxy.conf
\$AddUnixListenSocket /dev/log

# Send HAProxy messages to a dedicated logfile
:programname, startswith, "haproxy" {
  /var/log/haproxy.log
  stop
}

EOF
sudo systemctl restart rsyslog
sudo systemctl restart haproxy
