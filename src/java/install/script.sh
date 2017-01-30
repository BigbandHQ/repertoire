apt-get update

# Installing default JRE/JDK

if [ {{ params.java_type }} = "jdk" ]
then
  apt-get install -y default-jdk

  # Install OpenJDK 7

  if [ {{ params.install_openjdk }} -eq 1 ]
  then
    apt-get install -y openjdk-7-jdk
  fi
else
  apt-get install -y default-jre

  # Install OpenJDK 7

  if [ {{ params.install_openjdk }} -eq 1 ]
  then
    apt-get install -y openjdk-7-jre
  fi
fi

# Install Oracle JDK

if [ {{ params.install_oraclejdk }} -eq 1 ]
then
  apt-get install -y software-properties-common

  add-apt-repository -y ppa:webupd8team/java

  apt-get update

  echo "oracle-java7-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections

  apt-get install -y oracle-java7-installer
fi
