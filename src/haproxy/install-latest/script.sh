apt-get update

apt-get install -y software-properties-common

add-apt-repository -y ppa:vbernat/haproxy-1.7

apt-get update

apt-get install -y haproxy

echo "{{ files.haproxy_cfg }}" > /etc/haproxy/haproxy.cfg

