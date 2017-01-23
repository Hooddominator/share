#!/bin/bash
## installs logstash on RPi
## 
LGSTVER="2.3.3";
ALLPLUG="all-plugins-"


aptitude install -y openjdk-8-jre-headless;
mkdir /usr/share/logstash;
cd /usr/share/logstash;
## install plugins manually is ultra slow, so fuckoff and gotta catch'em all by load a 'all-plugins' package
wget https://download.elastic.co/logstash/logstash/logstash-${ALLPLUG}${LGSTVER}.tar.gz
sleep 1;
tar -zxvf logstash-${ALLPLUG}${LGSTVER}.tar.gz;
sleep 1;
mv ./logstash-${LGSTVER}/* .;
sleep 1;
rm -rf logstash-${LGSTVER}*;
mkdir /usr/share/logstash/logs;
mkdir /usr/share/logstash/config;
cd /usr/share/logstash/config;
wget https://raw.githubusercontent.com/Hooddominator/share/master/logstash.conf;
cd /tmp/;
wget https://raw.githubusercontent.com/Hooddominator/share/master/libjffi-1.2.so;
mv /usr/share/logstash/vendor/jruby/lib/jni/arm-Linux/libjffi-1.2.so /usr/share/logstash/vendor/jruby/lib/jni/arm-Linux/libjffi-1.2.so.x;
mv /tmp/libjffi-1.2.so /usr/share/logstash/vendor/jruby/lib/jni/arm-Linux/
chown -R elasticsearch:elasticsearch /usr/share/logstash/
## using systemd instead supervisor
#cd /etc/supervisor/conf.d/
#wget https://raw.githubusercontent.com/Hooddominator/share/master/supervisor_logstash.conf;
#supervisorctl reread;
#supervisorctl update;
cd /etc/systemd/system/
wget https://raw.githubusercontent.com/Hooddominator/share/master/logstash.service
systemctl daemon-reload
systemctl start logstash.service
