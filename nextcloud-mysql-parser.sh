#!/bin/sh

# Set nextcloud user MySQL user and password

echo -n "Nextcloud MySQL User:"
read user
echo "The MySQL user name will be: $user"
echo "The MySQL user name will be: $user" > nextcloud.db.parser.log

echo -n "Nextcloud MySQL Password: "
read password

# Set nextcloud MySQL database

echo -n "Nextcloud MySQL database name:"
read dbname
echo "The MySQL database name will be: $dbname"
echo "The MySQL database name will be: $dbname" >> nextcloud.db.parser.log

# Run MySQL queries
mysql -u root -e "CREATE DATABASE $dbname;"
mysql -u root -e "CREATE USER '$user'@'localhost' IDENTIFIED BY '$password';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $dbname.* TO '$user'@'localhost';"
mysql -u root -e "FLUSH PRIVILEGES;"

# Finish

echo "All tasks are done."
