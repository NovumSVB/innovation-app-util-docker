FROM ubuntu:18.04
RUN apt-get update -y
RUN apt-get upgrade -y
RUN  DEBIAN_FRONTEND=noninteractive TZ="Europe/Amsterdam" apt-get install -y \
        software-properties-common \
        apt-utils \
        language-pack-en-base \
        curl \
        zip \
        git
RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php
RUN DEBIAN_FRONTEND=noninteractive TZ="Europe/Amsterdam" apt-get install -y \
    software-properties-common \
    language-pack-en-base \
    libxml2 \
    phing \
    libxml2-dev \
    apache2 \
    php7.4 \
    php7.4-zip \
    php7.4-mysqli \
    php7.4-pdo \
    php7.4-sockets \
    php7.4-gd \
    php7.4-mbstring \
    php7.4-curl \
    php7.4-simplexml \
    php7.4-mbstring \
    php-xdebug

WORKDIR /app
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod env
RUN a2enmod vhost_alias
RUN ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
RUN echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
RUN sed -i '/IncludeOptional sites-enabled/a \\n# Novum Innovation app addition\nIncludeOptional \/app\/assets\/server\/http\/server\.conf' /etc/apache2/apache2.conf
RUN rm -fr /etc/apache2/sites-available/000-default.conf
RUN rm -fr /etc/apache2/sites-enabled/000-default.conf
RUN mkdir /app/data/CertBot
RUN COPY ./docker/http/options-ssl-apache.conf
RUN umask 0000
RUN composer self-update --1