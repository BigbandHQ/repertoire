apt-get update

apt-get install -y software-properties-common

# use ppa for redis

add-apt-repository -y ppa:chris-lea/redis-server

apt-get update

# install dependencies

apt-get install -y redis-server redis-tools python-setuptools python-pip python-dev libxslt1-dev libxml2-dev libz-dev libffi-dev libssl-dev libpq-dev libyaml-dev libjpeg8-dev postgresql nginx-full supervisor

ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib

# start services

service postgresql start

service redis-server start

# install Virtualenv using pip

pip install -U virtualenv

# create a user to run Sentry as

adduser sentry --gecos "" --disabled-password

echo "sentry:sentry" | chpasswd

# config postgres

# su - postgres

# psql -U postgres -c "create user sentry with password 'sentry'"
# psql -U postgres -c "create database sentrydb with owner sentry"

# exit

su -c "psql -U postgres -c \"create user sentry with password \"sentry\"\"" -s /bin/sh postgres
su -c "psql -U postgres -c \"create database sentrydb with owner sentry\"" -s /bin/sh postgres

# switch to user sentry & config Sentry

# su - sentry

# virtualenv ~/sentry_app/

# source ~/sentry_app/bin/activate

# pip install -U sentry

# sentry init

# sed -i "s/'NAME': 'sentry'/'NAME': 'sentrydb'/" ~/.sentry/sentry.conf.py
# sed -i "s/'USER': 'postgres'/'USER': 'sentry'/" ~/.sentry/sentry.conf.py
# sed -i "s/'PASSWORD': ''/'PASSWORD': 'sentry'/" ~/.sentry/sentry.conf.py
# sed -i "s/'HOST': ''/'HOST': 'localhost'/" ~/.sentry/sentry.conf.py
# sed -i "s/'PORT': ''/'PORT': '5432'/" ~/.sentry/sentry.conf.py

# sentry upgrade --noinput

# exit

# create a startup script for supervisord

# echo "{{ files.sentry_conf }}" > /etc/supervisor/conf.d/sentry.conf

# update supervisor

# service supervisor restart
