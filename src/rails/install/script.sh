apt-get update

# install rbenv and ruby dependencies

apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev

cd ~ && git clone git://github.com/sstephenson/rbenv.git .rbenv

echo 'export PATH="\$HOME/.rbenv/bin:\$PATH"' >> ~/.bash_profile

echo 'eval "\$(rbenv init -)"' >> ~/.bash_profile

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

echo 'export PATH="\$HOME/.rbenv/plugins/ruby-build/bin:\$PATH"' >> ~/.bash_profile

source ~/.bash_profile

# install ruby

rbenv install -v 2.2.3

rbenv global 2.2.3

echo "gem: --no-document" > ~/.gemrc

## install bundler

gem install bundler

# install rails

gem install rails

rbenv rehash

## install javascript runtime

add-apt-repository -y ppa:chris-lea/node.js

apt-get update

apt-get install -y nodejs

# create test app (optional)

if [ {{ params.create_app }} -eq 1 ]
then
  cd ~ && rails new {{ params.app_name }}
fi
