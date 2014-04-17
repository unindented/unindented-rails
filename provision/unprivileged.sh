# We may not be running a login shell.
source /etc/profile

if [[ ! -f /.unindented/setup-app ]]; then
  echo "Installing app"
  cd /vagrant
  bundle install
  bundle exec rake contents
  rvmsudo_secure_path=1 rvmsudo bundle exec foreman export upstart /etc/init -a unindented-website -u vagrant -l /vagrant/log -t /vagrant/provision/foreman
  echo "Finished installing app"

  echo "Starting app"
  sudo start unindented-website
  echo "Finished starting app"
fi
