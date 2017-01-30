apt-get update

apt-get install -y apt-transport-https

curl https://repo.varnish-cache.org/ubuntu/GPG-key.txt | apt-key add -

echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-4.0" >> /etc/apt/sources.list.d/varnish-cache.list

apt-get install -y varnish

sed -i "s/.host = \"127.0.0.1\";/.host = \"{{ params.host }}\";/" /etc/varnish/default.vcl

sed -i "s/.port = \"8080\";/.port = \"{{ params.port }}\";/" /etc/varnish/default.vcl

sed -i "s/sub vcl_backend_response {/sub vcl_backend_response { set beresp.ttl = {{ params.ttl }}; set beresp.grace = {{ params.grace }};/" /etc/varnish/default.vcl

sed -i "s/DAEMON_OPTS\"-a :6081/DAEMON_OPTS=\"-a :{{ params.port }}/" /etc/default/varnish

