#!/bin/bash

chown -R www-data:www-data /var/www/html/var/cache
chown -R www-data:www-data /var/www/html/var/logs

exec apache2-foreground
