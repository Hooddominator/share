#!/bin/bash
## installs elasticsearch on RPi
ESVER="2.3.1"

aptitude update;
aptitude install -y openjdk-8-jre-headless;
mkdir /usr/share/elasticsearch;
cd /usr/share/elasticsearch;
wget "https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/${ESVER}/elasticsearch-${ESVER}.tar.gz";
sleep 1;
tar -xvzf elasticsearch-${ESVER}.tar.gz;
sleep 1;
mv ./elasticsearch-${ESVER}/* .;
rm -rf ./elasticsearch-${ESVER}*;
useradd elasticsearch;
mkdir /usr/share/elasticsearch/logs;
mkdir /usr/share/elasticsearch/data;
curl https://raw.githubusercontent.com/Hooddominator/share/master/elasticsearch.yml > /usr/share/elasticsearch/config/elasticsearch.yml;
sleep 1;
sed -i "s/pipipi/$(hostname)/g" /usr/share/elasticsearch/config/elasticsearch.yml;
chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/;
aptitude install -y supervisor;
cd /etc/supervisor/conf.d/;
wget https://raw.githubusercontent.com/Hooddominator/share/master/supervisor_es.conf;
supervisorctl reread;
supervisorctl update;
