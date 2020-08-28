FROM php:7.4-fpm

ARG WEB_USER
ARG WEB_GROUP
ARG PHP_ROOT_DIR
ARG PHP_APP_DIR

COPY www.conf ${PHP_ROOT_DIR}/php-fpm.d/www.conf

RUN apt-get update -y \
    && apt-get install -y \
    apt-utils \
    libxml2-dev \
    zlib1g-dev \
    libpng-dev \
    gosu \
    zip \
    unzip \
    libonig-dev \
    git \
    libcurl4-openssl-dev \
    && apt-get clean -y

RUN docker-php-ext-install mysqli sockets gd

# Install and run composer
# ENV DEBIAN_FRONTEND noninteractive
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

RUN /usr/local/bin/docker-entrypoint.sh

RUN usermod -u 1000 ${WEB_USER} \
 && groupmod -g 1000 ${WEB_GROUP} \
 && chgrp -R staff ${PHP_ROOT_DIR}/php-fpm.d/www.conf


