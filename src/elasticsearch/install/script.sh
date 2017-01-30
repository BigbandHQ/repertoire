# install Java 8

apt-get update

apt-get install -y software-properties-common

add-apt-repository -y ppa:webupd8team/java

apt-get update

echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections

apt-get install -y oracle-java8-installer

# install ES

apt-get install -y wget

wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -

echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list

apt-get update

apt-get install -y elasticsearch

sed -i "s/# network.host: 192.168.0.1/network.host: {{ params.network_host }}/" /etc/elasticsearch/elasticsearch.yml

service elasticsearch restart

# start ES on boot up

update-rc.d elasticsearch defaults 95 10
