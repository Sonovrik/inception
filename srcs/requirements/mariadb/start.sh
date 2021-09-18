# Set default auth and start service
openrc default
/etc/init.d/mariadb setup
rc-service mariadb start


# Set user, password and flush privileges
echo "ALTER USER '${MARIADB_ROOT_LOGIN}'@'localhost' IDENTIFIED VIA mysql_native_password;" | mariadb
echo "SET PASSWORD = PASSWORD('${MARIADB_ROOT_PASS}');" | mariadb
echo "FLUSH PRIVILEGES;" | mariadb
echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mariadb -p" ${MARIADB_ROOT_PASS}"
echo "CREATE USER '${MARIADB_MY_LOGIN}'@'localhost' IDENTIFIED BY '${MARIADB_MY_PASS}';" | mariadb -p"${MARIADB_ROOT_PASS}"
echo "GRANT ALL PRIVILEGES ON wordpress.* TO '${MARIADB_MY_LOGIN}'@'%' IDENTIFIED BY '${MARIADB_MY_PASS}' WITH GRANT OPTION;" | mariadb -p"${MARIADB_ROOT_PASS}"
echo "FLUSH PRIVILEGES;" | mariadb -p "${MARIADB_ROOT_PASS}"

# load sql
# mariadb -p "${MARIADB_ROOT_PASS}" < wordpress.sql

rc-service mariadb stop

# saving
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'