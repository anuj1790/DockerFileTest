SET PASSWORD FOR 'root'@'localhost' = PASSWORD('xyz');

#DROP DATABASE wp_test;
CREATE DATABASE wp_test;


GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'xyz!1A' WITH GRANT OPTION;
#GRANT ALL PRIVILEGES ON wp_test TO 'wp_test'@'localhost' IDENTIFIED BY 'xyz!1A';
#GRANT ALL PRIVILEGES ON wp_test.* TO 'wpuser'@'localhost' INDENTIFIED BY 'xyz';
#DROP DATABASE wp_test;

