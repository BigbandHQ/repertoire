apt-get update

# install dependencies

apt-get install -y php5-fpm php5-cli php5-mcrypt

sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/fpm/php.ini

php5enmod mcrypt

service php5-fpm restart

mkdir -p {{ params.path }}

# copy nginx conf

echo "{{ files.nginx_conf }}" > /etc/nginx/sites-available/default

service nginx restart

# install composer

cd ~
curl -sS https://getcomposer.org/installer | php

mv composer.phar /usr/local/bin/composer

# create project

composer create-project laravel/laravel {{ params.path }}

chown -R :www-data {{ params.path }}

mkdir -p {{ params.path }}/app/storage

chmod -R 775 {{ params.path }}/storage/app
