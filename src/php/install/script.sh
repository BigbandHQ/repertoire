apt-get update

apt-get install -y php5

if [ {{ params.install_libapache2_mod_php5 }} -eq 1 ]
then
  apt-get install -y libapache2-mod-php5
fi

if [ {{ params.install_php5_mcrypt }} -eq 1 ]
then
  apt-get install -y php5-mcrypt
fi