apt-get update

export DEBIAN_FRONTEND=noninteractive
debconf-set-selections <<< "mariadb-server mysql-server/root_password password {{ params.password }}"
debconf-set-selections <<< "mariadb-server mysql-server/root_password_again password {{ params.password }}"

apt-get install -y mariadb-server
