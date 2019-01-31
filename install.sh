#!/usr/bin/env bash


composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition m2ce

echo "CREATE DATABASE m2ce" | mysql -u root -p

php bin/magento setup:install \
--base-url="http://m2ce.loc/" \
--db-host="localhost" \
--db-name="m2ce" \
--db-user="root" \
--db-password="root" \
--admin-firstname="admin" \
--admin-lastname="admin" \
--admin-email="ali.dev.se@gmail.com" \
--admin-user="admin" \
--admin-password="admin123" \
--language="en_US" \
--currency="USD" \
--timezone="Europe/Stockholm" \
--use-rewrites="1" \
--backend-frontname="admin"


php bin/magento sampledata:deploy
php bin/magento setup:upgrade

