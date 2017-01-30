# import public key

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

# create list file

echo "deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list

# install mongodb

apt-get update

apt-get install -y mongodb-org
