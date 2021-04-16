#!/bin/bash

# Reset and check whassup.
cd ~/
ls -lh

# Make sure everything’s up to date.
apt-get -y update

# `make` is needed for building stuff.
apt-get -y install make

# Install ruby-install.
wget -O ruby-install-0.7.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.7.0.tar.gz
tar -xzvf ruby-install-0.7.0.tar.gz
cd ruby-install-0.7.0/
make install
cd ~/ # Reset because of `cd` above.

ruby-install ruby 2.6.6

# Install chruby.
wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
make install
cd ~/ # Reset because of `cd` above.

cp ~/config/chruby.sh /etc/profile.d/chruby.sh # So chruby works with other scripts.
source /usr/local/share/chruby/chruby.sh # So we can use chruby.
chruby ruby-2.6.6 # So we can use Ruby.
ruby -v # Check it’s worked.

gem install rack

# Install Nginx and Passenger
sudo apt-get install -y dirmngr gnupg
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo apt-get install -y apt-transport-https ca-certificates
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger focal main > /etc/apt/sources.list.d/passenger.list'
sudo apt-get update
sudo apt-get install -y libnginx-mod-http-passenger

sudo apt-get install -y nginx

if [ ! -f /etc/nginx/modules-enabled/50-mod-http-passenger.conf ]; then sudo ln -s /usr/share/nginx/modules-available/mod-http-passenger.load /etc/nginx/modules-enabled/50-mod-http-passenger.conf ; fi

# Overwrite the default site config.
cp ~/config/nginx_default /etc/nginx/sites-available/default

sudo service nginx restart
