apt-get update

apt-get -y install haproxy

echo "{{ files.haproxy_cfg }}" > /etc/haproxy/haproxy.cfg
