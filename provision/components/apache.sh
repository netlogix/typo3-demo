#!/bin/bash

apt-get update
apt-get install -y apache2

a2enmod rewrite

touch /etc/apache2/sites-available/typo3.local.conf
echo "<VirtualHost *:80>
    ServerName typo3.local
    ServerAlias www.typo3.local

    DocumentRoot /var/www/public

    <Directory /var/www/public>
        # Allow .htaccess rewrite rules
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>" > /etc/apache2/sites-available/typo3.local.conf

a2dissite 000-default
a2ensite typo3.local.conf

sudo service apache2 restart
