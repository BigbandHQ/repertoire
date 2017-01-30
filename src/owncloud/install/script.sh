apt-get update

apt-get install -y wget

wget -qO - https://download.owncloud.org/download/repositories/stable/xUbuntu_14.04/Release.key | apt-key add -

echo "deb http://download.owncloud.org/download/repositories/stable/xUbuntu_14.04/ /" | tee /etc/apt/sources.list.d/owncloud.list

apt-get update

apt-get install -y owncloud
