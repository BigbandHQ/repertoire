apt-get update

debconf-set-selections <<< "postfix postfix/mailname string localhost"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Test'"

apt-get install -y ca-certificates openssh-server postfix

cd /tmp

curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh

bash /tmp/script.deb.sh

apt-get install -y gitlab-ce
