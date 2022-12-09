#!/bin/bash
sudo yum install gcc-c++ openssl-devel pcre-static pcre-devel systemd-devel vim socat -y
sudo wget http://www.haproxy.org/download/2.3/src/haproxy-2.3.4.tar.gz -O /tmp/haproxy.tar.gz
sudo tar xvzf /tmp/haproxy.tar.gz -C /tmp
sudo make TARGET=linux-glibc USE_PCRE=1 USE_OPENSSL=1 USE_ZLIB=1 USE_CRYPT_H=1 USE_LIBCRYPT=1 USE_SYSTEMD=1 -C /tmp/haproxy-2.3.4/
sudo make install -C /tmp/haproxy-2.3.4/