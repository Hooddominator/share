#!/bin/bash
## installs logstash on RPi
LGSTVER="2.2.0";

mkdir /usr/share/logstash;
cd /usr/share/logstash;
wget https://download.elastic.co/logstash/logstash/logstash-all-plugins-${LGSTVER}.tar.gz;
sleep 1;
tar -zxvf logstash-all-plugins-${LGSTVER}.tar.gz;
mv logstash-${LGSTVER}/* .;
rm -rf logstash-${LGSTVER}*;
mkdir /usr/share/logstash/logs;
mkdir /usr/share/logstash/config;
chown -R elasticsearch:elasticsearch /usr/share/logstash/;
cd /etc/supervisor/conf.d/;
wget https://raw.githubusercontent.com/Hooddominator/share/master/supervisor_logstash.conf;
supervisorctl reread;
supervisorctl update;
