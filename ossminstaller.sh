#!/bin/bash
# OSSN Installer Script created by
# KAKT <xxxxxxx@gmail.com>
# This version intended for Ubuntu Server
# 16.04+ and will not work on non-Ubuntu
# distributions.

# Disclaimer
clear
echo ""
echo -e "\e[1m\e[32mOSSN Installer by KAKT <xxxxx@gmail.com>\e[0m"
echo "https://github.com/KHUNARKERTHEIN/ossminstaller"
echo ""
echo -e "\e[1m\e[31mWARNING:\e[0m THIS SCRIPT WILL OVERWRITE APACHE CONFIGURATION FILES"
echo "AND WILL ONLY WORK ON A FRESH INSTALL OF UBUNTU 16.04 AND HIGHER."
echo ""
echo -e "\e[0mPlease view the \e[1mREADME.md\e[0m on GitHub before continuing. If you feel"
echo "comfortable that all requirements have been met, please proceed."
echo ""
echo "CTRL+C now to abort or press ENTER to continue with the installation."
read -s

# Check system for updates and install required programs
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoremove
sudo apt upgrade -y
sudo apt install unzip -y

# Install LAMP packages and create UFW Firewall rules
sudo apt install apache2 -y
#sudo ufw allow in "Apache full"
sudo ufw allow 'Apache Full'
sudo ufw allow 22/tcp
sudo ufw allow 53/udp
sudo ufw allow 53,80,443,25,587,465,143,993/tcp
sudo ufw logging on
sudo ufw logging medium
sudo ufw enable
sudo apache2ctl -t
sudo systemctl enable ufw
sudo systemctl reload apache2

#Install PHP
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php -y
sudo add-apt-repository ppa:ondrej/apache2
sudo apt update
sudo apt install php8.2-cli
sudo apt install php8.2 libapache2-mod-php8.2 php8.2-mysql php8.2-soap php8.2-bcmath php8.2-xml php8.2-mbstring php8.2-gd php8.2-common php8.2-cli php8.2-curl php8.2-intl php8.2-dev php8.2-zip zip unzip -y
sudo apt install php8.2-{bcmath,common,xml,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,xsl,cgi} -y
sudo apt-get install php8.2-phpdbg
sudo apt-get install libphp8.2-embed
sudo apt install php8.2-imagick
sudo apt install php8.2-sqlite3
sudo apt install php8.2-imap
sudo apache2ctl -t

sudo apt update
sudo apt install php8.3-cli
sudo apt install php8.3 libapache2-mod-php8.3 php8.3-mysql php8.3-soap php8.3-bcmath php8.3-xml php8.3-mbstring php8.3-gd php8.3-common php8.3-cli php8.3-curl php8.3-intl php8.3-dev php8.3-zip zip unzip -y
sudo apt install php8.3-{bcmath,common,xml,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,xsl,cgi} -y
sudo apt-get install php8.3-phpdbg
sudo apt-get install libphp8.3-embed
sudo apt install php8.3-imagick
sudo apt install php8.3-sqlite3
sudo apt install php8.3-imap
sudo apache2ctl -t

sudo apt update
sudo apt install php8.4-cli
sudo apt install php8.4 libapache2-mod-php8.4 php8.4-mysql php8.4-soap php8.4-bcmath php8.4-xml php8.4-mbstring php8.4-gd php8.4-common php8.4-cli php8.4-curl php8.4-intl php8.4-dev php8.4-zip zip unzip -y
sudo apt install php8.4-{bcmath,common,xml,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,xsl,cgi} -y
sudo apt-get install php8.4-phpdbg
sudo apt-get install libphp8.4-embed
sudo apt install php8.4-imagick
sudo apt install php8.4-sqlite3
sudo apt install php8.4-imap
sudo apache2ctl -t

#sudo apt install php8.2-fpm
#sudo systemctl enable php8.2-fpm
#sudo systemctl status php8.2-fpm
#sudo systemctl restart php8.2-fpm
#sudo apt-get remove php8.*
#sudo apt-get purge php8.*
#sudo apt-get autoclean
#sudo apt-get autoremove
#mcrypt is no more supported in php 7.3 Install PHP-FPM
#sudo a2enmod proxy_fcgi setenvif
#sudo systemctl restart apache2
#sudo a2enconf php8.2-fpm
#sudo systemctl reload apache2
#sudo nmap ....
#sudo netstat -lnpu
#sudo ufw status verbose
sudo systemctl reload apache2
#IonCube is not available on Ubuntu 22.04 base repository,The following command below to download the latest
sudo apt update && sudo apt upgrade -y
sudo apt autoremove
#Install PHP Ioncube
sudo apt install wget apt-transport-https gnupg2 software-properties-common
sudo wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
sudo tar -xvzf ioncube_loaders_lin_x86-64.tar.gz
sudo systemctl restart apache2
clear
#cd ioncube 
#ls
#ioncube_loader_lin_8.2.so     ioncube_loader_lin_8.3.so
#php -i | grep extension_dir
#extension_dir => /usr/lib/php/20230831 => /usr/lib/php/20230831
#cd ioncube
#sudo cp ioncube_loader_lin_8.3.so /usr/lib/php/20230831
#php --ini | grep "Loaded Configuration File"
#php -i | grep php.ini
#/etc/php/8.3/cli/php.ini (For PHP CLI)
#/etc/php/8.3/apache2/php.ini (For PHP with Apache2) 
#Now open your php.ini file using the following command below: 
#sudo nano /etc/php/8.3/cli/php.ini				 
#Add the following line at the end of the php.ini file: Ctl+w (;ffi.preload=):
#zend_extension=/usr/lib/php/20230831/ioncube_loader_lin_8.3.so  
#sudo nano /etc/php/8.3/apache2/php.ini
#zend_extension=/usr/lib/php/20230831/ioncube_loader_lin_8.3.so 
#sudo systemctl restart apache2
#php -v | php -m

#If you use php-fpm: ====
#sudo nano /etc/php/8.3/fpm/php.ini				 
#zend_extension=/usr/lib/php/20230831/ioncube_loader_lin_8.3.so
#sudo service php8.3-fpm restart
#sudo systemctl restart php8.3-fpm

#Install IonCube Loader on Ubuntu 22.04 LTS Jammy Jellyfish ====
#First, make sure that all your system packages are up-to-date.
#If you see the extracted files you can see the loaders for each PHP version: PHP8.2
#cd ioncube
#You will see something similar to this: #ls
#ioncube_loader_lin_8.2.so     ioncube_loader_lin_8.3.so
#Once you have downloaded the IonCube Loader, you need to move it to the PHP extension directory.
#php -i | grep extension_dir
#extension_dir => /usr/lib/php/20220829 => /usr/lib/php/20220829
#cd ioncube
#sudo cp ioncube_loader_lin_8.2.so /usr/lib/php/20220829
#Next, we check which PHP configuration is working by typing the following command:
#php --ini | grep "Loaded Configuration File"
#php -i | grep php.ini
#/etc/php/8.2/cli/php.ini (For PHP CLI)
#/etc/php/8.2/apache2/php.ini (For PHP with Apache2) 
#If you have a different version of PHP installed, the location of the file will be different.
#Now open your php.ini file using the following command below: Add the following line at the end of the php.ini file:
#sudo nano /etc/php/8.2/cli/php.ini
#zend_extension=/usr/lib/php/20220829/ioncube_loader_lin_8.2.so
#sudo nano /etc/php/8.2/apache2/php.ini
#zend_extension=/usr/lib/php/20220829/ioncube_loader_lin_8.2.so 
#sudo systemctl restart apache2
#php -v | php -m

#If you use php-fpm:
#sudo nano /etc/php/8.2/fpm/php.ini				
#zend_extension=/usr/lib/php/20220829/ioncube_loader_lin_8.2.so
#sudo service php8.2-fpm restart
#sudo systemctl restart php8.2-fpm

#install Mariadb
sudo apt install mariadb-server mariadb-client -y
sudo systemctl start mariadb
sudo systemctl enable mariadb

#If you want to uninstall, Just run this command to uninstall;
#sudo apt-get purge mariadb-* 
#sudo apt-get purge mariadb-server
#sudo apt autoremove
#You may check which mariadb packages are installed with:
#sudo dpkg -l | grep mariadb 
#systemctl status mariadb.service

# Clear screen and update user
clear
echo "Starting MySQL Secure Installation..."
echo ""

#Set up mysql_secure_installation

sudo mysql_secure_installation
sudo /etc/init.d/apache2 restart

#-sudo mysql -e "show engines"
#If you would like to continue to use the unix_socket method, then edit the 50-server.cnf file.
#sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf
#Add the following line in the [mariadb] unit at the bottom.
#plugin_load_add = auth_socket
#Save and close the file. Then restart MariaDB server for the change to take effect.
#sudo systemctl restart mariadb

# Set up MySQL Database. This can be done by entering the following command
clear
#echo "CREATE DATABASE ossn"
#echo ""
#sudo mysql -e "CREATE DATABASE ossm"
#sudo mysql -e "CREATE USER ossm"
#sudo mysql -e "GRANT ALL PRIVILEGES ON ossm.* TO 'ossm'@'localhost' IDENTIFIED BY 'Development1'"
#sudo mysql -e "FLUSH PRIVILEGES"
#sudo mysql -e "Exit"

# ls /run/php/
# sudo systemctl enable mariadb
# sudo systemctl enable apache2
# sudo systemctl restart apache2
# sudo systemctl restart mariadb
# sudo systemctl status mariadb
# sudo systemctl status apache2

#choose PHP as the default.
#sudo update-alternatives --config php
#sudo systemctl restart apache2

# Create directories for OSSM
DOCROOT=/var/www
#sudo mkdir $DOCROOT/public_html
sudo mkdir $DOCROOT/ossm
sudo mkdir $DOCROOT/ossn_data
#sudo rm -rf $DOCROOT/html
#Change the directory and install OSSM
#cd /var/www/public_html
DOCROOT=/var/www/
cd $DOCROOT
#sudo wget https://github.com/KHUNARKERTHEIN/ossmn/archive/refs/heads/main.zip
sudo wget https://github.com/AUNGSUBWAY/ossm/archive/refs/heads/main.zip
sudo unzip main.zip
sudo mv ossm-main/* ossm/
sudo rm -rf ossm-main main.zip
sudo service apache2 restart

#DOCROOT=/var/www/public_html/
#cd $DOCROOT
#sudo wget https://github.com/KHUNARKERTHEIN/ossm/archive/refs/heads/master.zip
#sudo unzip master.zip
#sudo mv ossm-master/* ossm/
#sudo rm -rf ossm-master master.zip
#sudo service apache2 restart

#Set correct ownership and permissions
DOCROOT=/var/www/
sudo chgrp www-data $DOCROOT/ossm*
sudo chmod g+w $DOCROOT/ossm*
sudo chown -R www-data:www-data $DOCROOT/ossm
sudo chown -R www-data:www-data $DOCROOT/ossm/*
# Restart Apache for changes to take effect
sudo service apache2 restart
# Finished for dir ossn_data.
DOCROOT=/var/www/
sudo chmod -R 755 $DOCROOT/ossn_data/
sudo chown -R www-data:www-data $DOCROOT/ossn_data
sudo service apache2 restart

#Backup old and create new configuration file for Apache2
APACHE=/etc/apache2/sites-available
sudo cp $APACHE/000-default.conf $APACHE/000-default.conf.bak
#sudo rm $APACHE/000-default.conf
cd $APACHE
sudo wget https://raw.githubusercontent.com/KHUNARKERTHEIN/ossminstallerlts/main/ossm.conf
# Enable mcrypt and mod_rewrite
sudo phpenmod curl
sudo phpenmod xml
sudo phpenmod gd
sudo phpenmod zip
sudo phpenmod mbstring
sudo a2enmod rewrite
#sudo phpenmod json
#Restart Apache for changes to take effect
sudo service apache2 restart
sudo a2ensite ossm.conf
sudo systemctl reload apache2
#systemctl status php*-fpm.service
#sudo a2dissite 000-default.conf

sudo apt update
sudo apt install ffmpeg -y
sudo service apache2 restart

sudo apt install openssl -y
sudo apt install nmap -y
sudo apt install net-tools -y
sudo netstat -lnpu

#sudo ufw status verbose
#sudo systemctl enable ufw

# Install phpmyadmin
sudo apt install phpmyadmin -y
sudo apache2ctl configtest && sudo systemctl restart apache2
#fix phpmyadmin-deprecation-notice error /usr/share/phpmyadmin/config.inc.php or
#sudo nano /etc/phpmyadmin/config.inc.php
#should technically correspond to this: add the following line at the bottom;
#$cfg['SendErrorReports'] = 'never';
#sudo systemctl restart apache2
#fix phpmyadmin root log in error
#sudo systemctl status mysql.service
#sudo mysql
#mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'Development1';
#sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'Development1'"
#Exit; or \q
#sudo systemctl restart apache2
#login:ip/phpmyadmin with 
#root and passwd.

#sudo nano /etc/hosts
#127.0.0.1 localhost myan-mar.com www.myan-mar.com
#34.142.231.242 myan-mar.com www.myan-mar.com
#Save the hosts file. Otherwise, you will get an error "MOD_REWRITE REQUIRED".
#sudo systemctl restart apache2

#Open an Apache config file to set the Global ServerName 
#sudo nano /etc/apache2/apache2.conf
#Add this line at the end of the file, then save and exit your server IP
#ServerName 34.142.231.242
#Check for any syntax errors we may have introduced
#sudo apache2ctl configtest
#Enable Apache rewrite (this resolves most post-installation 404 errors) 
#sudo a2enmod rewrite
#Restart Apache for any changes to take effect 
#sudo systemctl restart apache2

clear
echo ""
echo "Installer has completed the following tasks:"
echo "1. Updated the system"
echo "2. Installed the necessary components for running OSSN"
echo "3. Created the Directories required for installing OSSN"
echo "4. Backed up Apache 000-default.conf and downloaded modified version from ossninstaller repo"
echo "5. Enabled mcrypt and mod_rewrite"
echo "6. Installed current OSSN build to directories"
echo "7. Configured MySQL"
echo "8. Set proper permissions required to read/write OSSN from browser"
echo "9. Installed phpmyadmin for ease of use"
echo "10. Printed this fancy list"
echo ""
echo "For issues, please visit https://github.com/KHUNARKERTHEIN/"
echo ""
echo "11.OSSM Installer need to run the following tasks:"
echo " -
#Access OSSN web installer
Open your web browser and type the URL http://example.com or IP .
#Make sure all the requirements are met. and run for dir.

sudo apache2ctl -t
sudo systemctl restart apache2

#MySQL fIX :
sudo mysql
sudo mysql -u root
show engines;
sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf
Add the following line in the [mariadb] unit at the bottom.
plugin_load_add = auth_socket
Save and close the file. Then restart MariaDB server for the change to take effect.
sudo systemctl restart mariadb
sudo mysql -u root
MariaDB [(none)]> CREATE DATABASE ossm;
MariaDB [(none)]> CREATE USER ossm;
MariaDB [(none)]> GRANT ALL PRIVILEGES ON ossm.* TO 'ossm'@'localhost' IDENTIFIED BY 'Development1';
MariaDB [(none)]> FLUSH PRIVILEGES;
MariaDB [(none)]> EXIT;

sudo systemctl status mysql.service

#choose PHP as the default.
sudo update-alternatives --config php
sudo systemctl restart apache2
ls /run/php/
sudo systemctl status php8.2-fpm
systemctl status php*-fpm.service
ls  -1 /etc/php/8.2/fpm
sudo nano /etc/hosts
127.0.0.1 localhost burma.trade www.burma.trade
34.16.21.71 burma.trade www.burma.trade
#Save the hosts file. Otherwise, you will get an error "MOD_REWRITE REQUIRED".
sudo systemctl restart apache2

#Open an Apache config file to set the Global ServerName 
sudo nano /etc/apache2/apache2.conf
#Add this line at the end of the file, then save and exit your server IP
ServerName 34.16.21.71
Check for any syntax errors we may have introduced
sudo apache2ctl configtest
Enable Apache rewrite (this resolves most post-installation 404 errors) 
sudo a2enmod rewrite
Restart Apache for any changes to take effect 
sudo systemctl restart apache2

Enable Apache through the firewall that we enabled earlier
#Enable ufw firewall
sudo ufw allow 'Apache Full'
sudo ufw allow 22/tcp
sudo ufw allow 53
sudo ufw allow 53/udp
sudo ufw allow 80,443,25,587,465,143,993/tcp
sudo ufw logging on
sudo ufw logging medium
sudo ufw enable
sudo apt install nmap -y
sudo nmap 34.16.21.71
sudo apt install net-tools
sudo netstat -lnpu
sudo ufw status verbose
sudo systemctl enable ufw
sudo apache2ctl -t
sudo systemctl reload apache2
#how-to-install-and-use-ffmpeg-in-ubuntu/
sudo apt update
sudo apt install ffmpeg -y
#verify if everything installed correctly, including all the dependency libraries, with the following command.
ffmpeg -version | ffmpeg -encoders | ffmpeg -decoders
#add domain
sudo nano /etc/apache2/sites-available/000-default.conf
add this; dir.
ServerName  burma.trade 
ServerAlias www.burma.trade
save;
sudo service apache2 restart
sudo apt update && sudo apt upgrade -y
#To test that Apache is working, simply visit the IP address of your server. You should see a test page 
php -v | php -m
#You can now increase some PHP variable values to meet Magento’s minimum requirements.
$ sudo sed -i "s/memory_limit = .*/memory_limit = 4G/" /etc/php/8.2/fpm/php.ini
$ sudo sed -i "s/upload_max_filesize = .*/upload_max_filesize = 128M/" /etc/php/8.2/fpm/php.ini
$ sudo sed -i "s/zlib.output_compression = .*/zlib.output_compression = on/" /etc/php/8.2/fpm/php.ini
$ sudo sed -i "s/max_execution_time = .*/max_execution_time = 18000/" /etc/php/8.2/fpm/php.ini
$ sudo sed -i "s/date.timezone = .*/date.timezone = Asia/Yangon/" /etc/php/8.2/fpm/php.ini
###
$ sudo sed -i "s/memory_limit = .*/memory_limit = 4G/" /etc/php/8.2/cli/php.ini
###

sudo nano /etc/php/8.2/apache2/php.ini

sudo sed -i "s/memory_limit = .*/memory_limit = 4G/" /etc/php/8.2/apache2/php.ini
sudo sed -i "s/upload_max_filesize = .*/upload_max_filesize = 256M/" /etc/php/8.2/apache2/php.ini
sudo sed -i "s/post_max_size = .*/post_max_size = 256M/" /etc/php/8.2/apache2/php.ini
sudo sed -i "s/zlib.output_compression = .*/zlib.output_compression = on/" /etc/php/8.2/apache2/php.ini
sudo sed -i "s/max_execution_time = .*/max_execution_time = 36000/" /etc/php/8.2/apache2/php.ini
sudo sed -i "s/max_input_time = .*/max_input_time = 1800/" /etc/php/8.2/apache2/php.ini
### and uncomment ;
sudo sed -i "s/short_open_tag = .*/short_open_tag = On/" /etc/php/8.2/apache2/php.ini
sudo sed -i "s/max_input_vars = .*/max_input_vars = 10000/" /etc/php/8.2/apache2/php.ini
sudo sed -i "s/realpath_cache_size = .*/realpath_cache_size = 10M/" /etc/php/8.2/apache2/php.ini   
sudo sed -i "s/realpath_cache_ttl = .*/realpath_cache_ttl = 7200/" /etc/php/8.2/apache2/php.ini

date.timezone = Asia/Yangon

###
php --ini | grep "Loaded Configuration File"
nano /etc/php/8.2/cli/php.ini

(uncomment ; Delete)
-memory_limit=8G
-realpath_cache_size = 10M
-realpath_cache_ttl = 7200
-date.timezone = Asia/Yangon
-upload_max_filesize = 128M
-zlib.output_compression = on
-max_execution_time = 18000
-max_input_time=1800
-max_input_vars=10000
sudo systemctl restart apache2
-sudo apt install phpmyadmin -y
-phpmyadmin-deprecation-notice error fix=
Edit the following file : config.inc.php. It can be located in /etc/phpmyadmin/config.inc.php or in /usr/share/phpmyadmin/config.inc.php
sudo nano /etc/phpmyadmin/config.inc.php
I though that this should technically correspond to this: add the end:
$cfg['SendErrorReports'] = 'never';
systemctl restart apache2
fix: ===========phpmyadmin root log in error:
systemctl status mysql.service
sudo mysql
mysql> 
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Development1'; 
## or admin@:
Exit; or \q and now run:systemctl restart apache2
login:ip/phpmyadmin:root=pw:
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'Development1'"
##
Install IonCube Loader on Ubuntu 22.04 LTS Jammy Jellyfish
Step 1. First, make sure that all your system packages are up-to-date by running the following apt commands in the terminal.
sudo apt update && sudo apt upgrade -y
sudo apt install wget apt-transport-https gnupg2 software-properties-common
Step 2. By default, IonCube is not available on Ubuntu 22.04 base repository. The following command below to download the latest.
sudo wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
Next, extract the downloaded file using the following command:
sudo tar -xvzf ioncube_loaders_lin_x86-64.tar.gz
If you see the extracted files you can see the loaders for each PHP version:
cd ioncube
ls
You will see something similar to this:
ioncube_loader_lin_7.0.so     ioncube_loader_lin_8.1.so
Step 3. PHP Configuration File.
Once you have downloaded the IonCube Loader, you need to move it to the PHP extension directory.

php -i | grep extension_dir
You should see the following output:
extension_dir => /usr/lib/php/20220829 => /usr/lib/php/20220829
cd ioncube
sudo cp ioncube_loader_lin_8.2.so /usr/lib/php/20220829
Next, we check which PHP configuration is working by typing the following command:
php --ini | grep "Loaded Configuration File"
php -i | grep php.ini
Output:
/etc/php/8.1/cli/php.ini (For PHP CLI)
/etc/php/8.1/apache2/php.ini (For PHP with Apache2)
If you have a different version of PHP installed, the location of the file will be different.
Now open your php.ini file using the following command below:
#sudo nano /etc/php/8.2/cli/php.ini
zend_extension=/usr/lib/php/20220829/ioncube_loader_lin_8.2.so

#sudo nano /etc/php/8.2/apache2/php.ini
zend_extension=/usr/lib/php/20220829/ioncube_loader_lin_8.2.so
Add the following line at the end of the php.ini file

#sudo nano /etc/php/8.2/fpm/php.ini
zend_extension=/usr/lib/php/20220829/ioncube_loader_lin_8.2.so
sudo service php8.2-fpm restart
sudo systemctl restart php8.2-fpm

sudo systemctl restart apache2

Finally, check the installed PHP version.
php -v

#Install SSL

Install SSL:

sudo snap install --classic certbot
#sudo mv /usr/bin/certbot /usr/bin/certbot_old
sudo ln -s /snap/bin/certbot /usr/bin/certbot

sudo certbot --apache --register-unsafely-without-email --redirect
sudo systemctl reload apache2
#===
https://certbot.eff.org/
sudo apt-get remove certbot
sudo snap install --classic certbot
certbot --version
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo certbot --apache
sudo certbot certonly --apache
burma.trade,www.burma.trade
sudo systemctl reload apache2
#==
apachectl -M | grep ssl
sudo a2enmod ssl
sudo systemctl restart apache2
#sudo a2dissite 000-default.conf
or else:
sudo apt install certbot python3-certbot-apache
sudo certbot --apache --agree-tos --redirect --uir --hsts --staple-ocsp --must-staple -d burma.trade,www.burma.trade --email info@burma.trade
sudo systemctl reload apache2
The command to renew certbot is installed in one of the following locations:
###
/etc/crontab/
/etc/cron.*/*
systemctl list-timers
sudo certbot renew --dry-run
###
sudo systemctl status certbot.timer
sudo certbot renew --dry-run --agree-tos
sudo certbot revoke --cert-path /etc/letsencrypt/live/burma.trade/cert.pem
###
sudo apt install ssh
sudo service ssh status
sudo lsof -i -n -P | grep LISTEN
sudo service ssh restart
grep Port /etc/ssh/sshd_config
###
ssh -lroot -p22 35.197.157.247
sudo apt-get install mtr
mtr 35.197.157.247
sudo apt install libcanberra-gtk-module libcanberra-gtk3-module
sudo apt-get install libcanberra-gtk-module
sudo apt-get install --reinstall libcanberra-gtk-module
sudo apt-get install libcanberra-gtk*
###
burma.trade. IN CAA 0 issue "letsencrypt.org"
burma.trade. IN CAA 0 iodef "mailto:your-email-address"
dig burma.trade CAA
APACHE=/etc/apache2/sites-available    or  APACHE=/etc/apache2/sites-enabled
cd $APACHE
sudo nano /etc/apache2/sites-enabled/000-default.conf
sudo nano /etc/apache2/sites-enabled/000-default-le-ssl.conf
cd /etc/apache2/sites-enabled/
sudo nano 000-default.conf
sudo nano 000-default-le-ssl.conf
sudo nano /etc/apache2/sites-available/000-default.conf
sudo nano /etc/apache2/sites-available/default-ssl.conf
cd /etc/apache2/sites-available/
sudo nano 000-default.conf
sudo nano default-ssl.conf
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.bak
sudo cp /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf.bak
sudo cp /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf.bak
sudo cp /etc/apache2/sites-enabled/000-default-le-ssl.conf /etc/apache2/sites-enabled/000-default-le-ssl.conf.bak
sudo mv 000-default.conf.bak 000-default.conf.baks
sudo apt update && sudo apt dist-upgrade
#add domain
sudo nano /etc/apache2/sites-available/000-default.conf
ServerName  burma.trade 
ServerAlias www.burma.trade
sudo service apache2 restart
###
Install SSL:
###
sudo snap install --classic certbot
sudo mv /usr/bin/certbot /usr/bin/certbot_old
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo certbot --apache --register-unsafely-without-email --redirect
###
Certificate Auto Renewal, To automatically renew Let’s Encrypt certificate, simply edit root user’s crontab file.

sudo crontab -e

Then add the following line at the bottom.

@daily certbot renew --quiet && systemctl reload apache2

#--quiet flag will suppress normal messages. If you want to receive error messages, then add the following line at the beginning of crontab file.

MAILTO=your-email-address

sudo /etc/init.d/apache2 restart
sudo systemctl reload apache2

echo "That's it! We're done. Open your browser and navigate"
echo "to http://yourserver/ and finish setup"
# Change http to https in # cd /var/www/ossm/configurations$ sudo nano ossn.config.site.php
-"
echo ""
