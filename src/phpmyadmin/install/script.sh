apt-get update

debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password {{ params.app_password }}"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password {{ params.mysql_password }}"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password {{ params.app_password }}"
debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"

apt-get install -y phpmyadmin

php5enmod mcrypt

service apache2 restart
