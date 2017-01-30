apt-get update

apt-get install -y build-essential libssl-dev

curl https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | sh

source ~/.profile

nvm install {{ params.version }}
