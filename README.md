Magento 2 Community Edition Installation via Composer
====================================================


This is an app for coding challenges. The admin can create a challenge and invite others to complete it. The code is tested against the results and performance automatically.

![Screenshot](https://i.ytimg.com/vi/vdBQrHwF4Po/maxresdefault.jpg)

# [Demo](http://m2ce.softhem.se/)

INSTALLATIONS
---------------
  * Create project using composer `composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition m2ce`.
  * Create database `echo "CREATE DATABASE m2ce" | mysql -u root -p`.
  * Install and create database tables
   ``` 
   php bin/magento setup:install \
   --base-url="http://m2ce.loc/" \
   --db-host="localhost" \
   --db-name="m2ce" \
   --db-user="root" \
   --db-password="root" \
   --admin-firstname="admin" \
   --admin-lastname="admin" \
   --admin-email="admin@example.com" \
   --admin-user="admin" \
   --admin-password="admin123" \
   --language="en_US" \
   --currency="USD" \
   --timezone="America/Chicago" \
   --use-rewrites="1" \
   --backend-frontname="admin"  
   
   ```
  * Deploy sample data `php bin/magento sampledata:deploy`.
  * For first time sample data run the command `php bin/magento setup:upgrade`.
  * Point web browser to m2ce/ directory or Create a virtual host using [vh](https://github.com/iloveyii/vh) `vh new m2ce -p ~/m2ce`
  * Browse to [http://m2ce.loc](http://m2ce.loc) 

DIRECTORY STRUCTURE
-------------------

```
common
    config/              contains shared configurations
    mail/                contains view files for e-mails
    models/              contains model classes used in both backend and frontend
console
    config/              contains console configurations
    controllers/         contains console controllers (commands)
    migrations/          contains database migrations
    models/              contains console-specific model classes
    runtime/             contains files generated during runtime
frontend
    assets/              contains application assets such as JavaScript and CSS
    config/              contains frontend configurations
    controllers/         contains Web controller classes
    models/              contains frontend-specific model classes
    runtime/             contains files generated during runtime
    views/               contains view files for the Web application
    web/                 contains the entry script and Web resources
    widgets/             contains frontend widgets
vendor/                  contains dependent 3rd-party packages
environments/            contains environment-based overrides
```

## Sample data
php bin/magento sampledata:deploy
php bin/magento setup:upgrade


## Change base url
php bin/magento setup:store-config:set --base-url="http://luma.softhem.se"
php bin/magento setup:store-config:set --base-url-secure="https://luma.softhem.se"

## Then clear cache
php bin/magento cache:flush

## Change currency
php bin/magento setup:store-config:set --currency="SEK"


# Make magento 2 faster
## Use PHP-FPM
apt-get install php7.1-fpm
a2enmod proxy_fcgi setenvif
a2enconf php7.1-fpm
sudo service php7.1-fpm restart
sudo service apache2 restart

## Enable opcache in PHP
sudo nano /etc/php/7.1/apache2/php.ini find opcache.enable
opcache.enable=1

## Enable production mode
sudo php -f bin/magento deploy:mode:set production

## Use Redis
sudo apt-get update
sudo apt-get install build-essential tcl8.5
sudo apt-get install make
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
sudo make install
cd utils/
sudo ./install_server.sh
## Edit app/etc/env.php add
: '
'cache' =>
  array (
    'frontend' =>
    array (
      'default' =>
      array (
        'backend' => 'Cm_Cache_Backend_Redis',
        'backend_options' =>
        array (
          'server' => '127.0.0.1',
          'database' => '0',
          'port' => '6379',
        ),
      ),
      'page_cache' =>
      array (
        'backend' => 'Cm_Cache_Backend_Redis',
        'backend_options' =>
        array (
          'server' => '127.0.0.1',
          'port' => '6379',
          'database' => '1',
          'compress_data' => '0',
        ),
      ),
    ),
  ),
'

## Use Varnish cache
[Use varnish](https://devdocs.magento.com/guides/v2.3/config-guide/varnish/config-varnish-magento.html)

