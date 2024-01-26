FROM wordpress:fpm

RUN apt-get update && apt-get install -y tidy csstidy

# Installation ZIP
RUN apt-get install -y libzip-dev \
  zip \
  && docker-php-ext-install zip

# Installation PhpRedis
RUN pecl install --force redis \
&& rm -rf /tmp/pear \
&& docker-php-ext-enable redis

# Give WP permissions to update
RUN if [ ! -d "/var/www/html/wp-content" ]; then mkdir /var/www/html/wp-content ; chown -R www-data:www-data /var/www/html/wp-content; fi