FROM ubuntu:16.04

RUN \
  apt-get -y update && \
  apt-get -y install wget openjdk-8-jre openjdk-8-jdk apt-transport-https

RUN \
  wget http://www.scala-lang.org/files/archive/scala-2.11.11.deb && \
  dpkg -i scala-2.11.11.deb && \
  apt-get install -y scala python python-dev python-pip python-virtualenv

RUN \
  echo "deb https://dl.bintray.com/sbt/debian /" >> /etc/apt/sources.list.d/sbt.list

RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

RUN \
  apt-get -y update && \
  apt-get -y install sbt && \
  rm -rf /var/lib/apt/lists/*

RUN pip install awsebcli

CMD ["bash"]