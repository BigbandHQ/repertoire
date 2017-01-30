echo "deb http://www.rabbitmq.com/debian/ testing main" | tee /etc/apt/sources.list.d/rabbitmq.list

apt-get update

apt-get install -y wget

wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add -

apt-key add rabbitmq-signing-key-public.asc

apt-get update

apt-get install -y rabbitmq-server

service rabbitmq-server start