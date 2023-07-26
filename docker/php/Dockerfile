FROM php:8.1.20-fpm

RUN apt-get update

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions \
    bcmath \
    gd \
    intl \
    opcache \
    pdo_mysql \
    zip \ 
    pcntl

COPY ./zz-php-fpm.conf /usr/local/etc/php-fpm.d/zz-php-fpm.conf

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY ./start.sh /usr/local/bin/start
RUN chmod u+x /usr/local/bin/start

WORKDIR /var/www/html

EXPOSE 9000
 
CMD ["/usr/local/bin/start"]