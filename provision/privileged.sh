#!/bin/bash

OS=$(/bin/bash /vagrant/provision/os-detect.sh ID)
CODENAME=$(/bin/bash /vagrant/provision/os-detect.sh CODENAME)

cat /vagrant/provision/banner.txt

if [[ ! -d /.unindented ]]; then
  mkdir /.unindented
  echo "Created directory /.unindented"
fi

if [[ ! -f /.unindented/setup-apt ]]; then
  echo "Running initial apt-get update"
  apt-get update > /dev/null
  echo "Finished running initial apt-get update"

  touch /.unindented/setup-apt
fi

if [[ ! -f /.unindented/setup-base ]]; then
  echo "Installing basic libraries"
  apt-get install -y build-essential > /dev/null
  apt-get install -y curl > /dev/null
  apt-get install -y git > /dev/null
  apt-get install -y vim > /dev/null
  apt-get install -y htop > /dev/null
  apt-get install -y sqlite3 > /dev/null
  echo "Finished installing basic libraries"

  touch /.unindented/setup-base
fi

if [[ ! -f /.unindented/setup-python ]]; then
  echo "Installing Python"
  apt-get install -y python-dev python-setuptools python-software-properties > /dev/null
  echo "Finished installing Python"

  echo "Installing Pygments"
  easy_install Pygments
  echo "Finished installing Pygments"

  touch /.unindented/setup-python
fi

if [[ ! -f /.unindented/setup-node ]]; then
  echo "Installing Node"
  add-apt-repository -y ppa:chris-lea/node.js > /dev/null
  apt-get update > /dev/null
  apt-get install -y nodejs > /dev/null
  echo "Finished installing Node"

  touch /.unindented/setup-node
fi

if [[ ! -f /.unindented/setup-phantomjs ]]; then
  echo "Installing fontconfig"
  apt-get install fontconfig > /dev/null
  echo "Finished installing fontconfig"

  echo "Installing PhantomJS"
  cd /usr/local/share
  tar jx < <(wget -q -O - http://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-x86_64.tar.bz2)
  mv /usr/local/share/phantomjs-1.9.2-linux-x86_64 /usr/local/share/phantomjs
  sudo ln -s /usr/local/share/phantomjs/bin/phantomjs /usr/local/bin/phantomjs
  echo "Finished installing PhantomJS"

  touch /.unindented/setup-phantomjs
fi

if [[ ! -f /.unindented/setup-ruby ]]; then
  echo "Creating .gemrc"
  echo 'gem: --no-ri --no-rdoc' >> /root/.gemrc
  echo 'gem: --no-ri --no-rdoc' >> /home/vagrant/.gemrc
  echo "Finished creating .gemrc"

  echo "Installing RVM"
  curl -L https://get.rvm.io | bash -s stable --ruby=2.0.0
  echo "Finished installing RVM"

  echo "Adding 'vagrant' to 'rvm' group"
  usermod -a -G rvm vagrant
  echo "Finished adding 'vagrant' to 'rvm' group"

  touch /.unindented/setup-ruby

  pkill -KILL -u vagrant
fi
