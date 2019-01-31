#!/usr/bin/env bash

# Installations

composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition luma

echo "CREATE DATABASE luma" | mysql -u root -p

php bin/magento setup:install \
--base-url="http://luma.softhem.se/" \
--db-host="localhost" \
--db-name="luma" \
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

# Sample data
php bin/magento sampledata:deploy
php bin/magento setup:upgrade


# Change base url
php bin/magento setup:store-config:set --base-url="http://luma.softhem.se"
php bin/magento setup:store-config:set --base-url-secure="https://luma.softhem.se"
# Then clear cache
php bin/magento cache:flush


