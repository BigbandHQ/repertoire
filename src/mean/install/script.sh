apt-get update

# install deps

apt-get install -y git build-essential openssl libssl-dev pkg-config

source ~/.profile

npm install -g bower grunt-cli

git clone https://github.com/meanjs/mean.git {{ params.path }}

cd {{ params.path }}

npm install

# bower --allow-root --config.interactive=false install
