echo "Elasticsearch-Clustername: ";
read escluster;
echo "Elasticsearch-Nodename: ";
read esnode;
echo "Masternode? [true/false]: ";
read esismaster;
echo "Datanode? [true/false]: ";
read esisdata;

cd /usr/share/elasticsearch/config;
mv elasticsearch.yml elasticsearch.yml.orig;

wget https://raw.githubusercontent.com/Hooddominator/share/master/elasticsearch.yml;
