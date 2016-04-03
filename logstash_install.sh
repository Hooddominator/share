#!/bin/bash
## installs logstash on RPi
## 
LGSTVER="2.3.0";

aptitude install -y git openjdk-8-jdk ant;
mkdir /usr/share/logstash;
cd /usr/share/logstash;
wget https://download.elastic.co/logstash/logstash/logstash-${LGSTVER}.tar.gz;
sleep 1;
tar -zxvf logstash-${LGSTVER}.tar.gz;
sleep 1;
mv ./logstash-${LGSTVER}/* .;
sleep 1;
rm -rf logstash-${LGSTVER}*;
mkdir /usr/share/logstash/logs;
mkdir /usr/share/logstash/config;
cd /usr/share/logstash/config;
wget https://raw.githubusercontent.com/Hooddominator/share/master/logstash.conf;
cd /tmp/
git clone https://github.com/jnr/jffi.git
cd jffi/
ant jar
chown -R elasticsearch:elasticsearch /usr/share/logstash/;
cd /etc/supervisor/conf.d/;
wget https://raw.githubusercontent.com/Hooddominator/share/master/supervisor_logstash.conf;
supervisorctl reread;
supervisorctl update;
