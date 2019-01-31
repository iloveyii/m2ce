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