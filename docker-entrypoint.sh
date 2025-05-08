#!/bin/sh

# 启动 cron 服务
crond

# 启动 Redis 服务
redis-server --daemonize yes

# 启动 php-fpm 服务
php-fpm

# 启动 supervisor
#supervisord -c /run/supervisor/supervisord.conf -n
#wget https://getcomposer.org/download/1.9.0/composer.phar
#php composer.phar global require hirak/prestissimo
#php -d memory_limit=-1 composer.phar install
#php artisan v2board:install
#php artisan horizon &