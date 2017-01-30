apt-get update

debconf-set-selections <<< "mysql-server mysql-server/root_password password {{ params.password }}"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password {{ params.password }}"

apt-get install -y mysql-server php5-mysql

mysql_install_db

service mysql start
