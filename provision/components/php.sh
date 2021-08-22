#!/bin/bash

sudo apt-get install software-properties-common
sudo apt-get update
sudo apt-get install -y php \
                        php-bcmath \
                        php-bz2 \
                        php-cli \
                        php-curl \
                        php-exif \
                        php-gd \
                        php-imagick \
                        php-intl \
                        php-json \
                        php-mbstring \
                        php-mysqli \
                        php-opcache \
                        php-soap \
                        php-xml \
                        php-xdebug \
                        php-xsl \
                        php-zip \
                        libapache2-mod-php \

sed -i 's/max_execution_time = .*/max_execution_time = 240/' /etc/php/7.4/apache2/php.ini
sed -i 's/post_max_size = .*/post_max_size = 512M/' /etc/php/7.4/apache2/php.ini
sed -i 's/upload_max_filesize = .*/upload_max_filesize = 512M/' /etc/php/7.4/apache2/php.ini
sed -i 's/memory_limit = .*/memory_limit = 512M/' /etc/php/7.4/apache2/php.ini
sed -i 's/;max_input_vars = .*/max_input_vars = 1500/' /etc/php/7.4/apache2/php.ini
sed -i 's/max_input_vars = .*/max_input_vars = 1500/' /etc/php/7.4/apache2/php.ini

echo "zend_extension=xdebug.so
xdebug.remote_connect_back=1
xdebug.remote_enable=1
xdebug.profiler_enable=0
xdebug.profiler_enable_trigger=0
xdebug.auto_trace=0
xdebug.trace_enable_trigger=0
xdebug.max_nesting_level=1000
xdebug.idekey=PHPSTORM" > /etc/php/7.4/mods-available/xdebug.ini

sudo service apache2 restart
