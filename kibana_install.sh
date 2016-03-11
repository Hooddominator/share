#!/bin/bash
## installs kibana on RPi

KIBANAVER="4.4.1"

curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
apt-get install -y nodejs
mkdir /usr/share/kibana
mkdir /usr/share/kibana/logs
cd /usr/share/kibana
wget https://download.elastic.co/kibana/kibana/kibana-${KIBANAVER}-linux-x86.tar.gz
tar -zxvf kibana-${KIBANAVER}-linux-x86.tar.gz
mv kibana-${KIBANAVER}-linux-x86/* .
rm -rf kibana-${KIBANAVER}-linux-x86*
mv node/bin/node node/bin/xnode
mv node/bin/npm node/bin/xnpm
ln -s /usr/bin/node node/bin/node
ln -s /usr/bin/npm node/bin/npm
chown -R elasticsearch:elasticsearch /usr/share/kibana
