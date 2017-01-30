apt-get update

apt-get install -y nodejs

if [ {{ params.install_npm }} -eq 1 ]
then
  apt-get install -y npm
fi