#Base Image
FROM appcontainers/centos

#File Aurthor
MAINTAINER Anuj_Agarwal a_anuj@yahoo.in

#Pre-reqs
RUN yum clean all && \
yum -y install wget && \
yum -y update && \
yum -y install httpd mod_rewrite mod_ssl mod_env php php-commom php-cli php-mysql mysql-server unzip && \
rm -fr /var/cache/*

# Files that need to be added
ADD mysql_setup.sql /tmp/
ADD wp.conf /etc/https/conf.d/


#Application Install
Run mkdir -p /var/www/html && \ 
wget -P /var/www/html/ https://wordpress.org/latest.zip && \
unzip /var/www/html/latest.zip -d /var/www/html/ && \
rm -fr /var/www/html/latest.zip

RUN service mysqld start && \
mysql < /tmp/mysql_setup.sql && \
rm -fr /tmp/mysql_setup.sql* && \
service mysqld stop

#Setting up wp-config file
RUN cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

RUN sed -ie 's/database_name_here/wp_test/g' /var/www/html/wordpress/wp-config.php && \
sed -ie 's/username_here/root/g' /var/www/html/wordpress/wp-config.php && \
sed -ie 's/password_here/xyz@1A/g' /var/www/html/wordpress/wp-config.php 

RUN chown -R apache:apache /var/www/html/wordpress && \
chmod -R 775 /var/www/html/wordpress

RUN echo "service mysqld start" >> ~/.bashrc && \
echo "service httpd start" >> ~/.bashrc 

#Expose Necessary Ports
EXPOSE 80

