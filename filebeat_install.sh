#!/bin/bash
## installs filebeat
FILEBEATVER=${1-"4.6.3"}
ARCH="amd64"

wget https://download.elastic.co/beats/filebeat/filebeat_${FILEBEATVER}_${ARCH}.deb
sudo dpkg -i filebeat_${FILEBEATVER}_${ARCH}.deb
