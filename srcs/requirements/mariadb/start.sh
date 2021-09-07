openrc default
/etc/init.d/mariadb setup
rc-service mariadb start

echo "CREATE DATABASE wordpress" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES" | mysql -u root --skip-password
mysql -u root wordpress < mysql-service.sql

rc-service mariadb stop

/usr/bin/mysqld_safe --datadir='/var/lib/mysql'