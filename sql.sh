#!/bin/bash

echo "REMOVE SQL USER AND PASSWORD"

sudo /etc/init.d/mysql stop
sudo mkdir /var/run/mysqld
sudo chown mysql /var/run/mysqld
sudo mysqld_safe --skip-grant-tables&