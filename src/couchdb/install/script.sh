apt-get update

apt-get install -y couchdb

mkdir -p /var/run/couchdb

echo "" > /var/run/couchdb/couch.uri
