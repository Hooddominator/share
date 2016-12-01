#!/bin/bash
## installs kibana on RPi
KIBANAVER=${1-"4.6.3"}
OSARCH="linux-x86_64"

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs supervisor
mkdir /usr/share/kibana
mkdir /usr/share/kibana/logs
cd /usr/share/kibana
##wget https://download.elastic.co/kibana/kibana/kibana-${KIBANAVER}-linux-x86.tar.gz
##wget https://download.elastic.co/kibana/kibana/kibana-4.6.2-linux-x86_64.tar.gz
wget https://download.elastic.co/kibana/kibana/kibana-${KIBANAVER}-${OSARCH}.tar.gz
sleep 1
tar -zxvf kibana-${KIBANAVER}-${OSARCH}.tar.gz
sleep 1
mv kibana-${KIBANAVER}-${OSARCH}/* .
sleep 1
rm -rf kibana-${KIBANAVER}-${OSARCH}*
mv node/bin/node node/bin/xnode
mv node/bin/npm node/bin/xnpm
ln -s /usr/bin/node node/bin/node
ln -s /usr/bin/npm node/bin/npm
useradd elasticsearch
chown -R elasticsearch:elasticsearch /usr/share/kibana
wget https://raw.githubusercontent.com/Hooddominator/share/master/supervisor_kibana.conf
mv supervisor_kibana.conf /etc/supervisor/conf.d/supervisor_kibana.conf
supervisorctl reread
supervisorctl update
