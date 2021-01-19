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
    inotify-tools \
    language-pack-en-base \
    libxml2 \
    phing \
    libxml2-dev \
    apache2 \
    php8.0 \
    php8.0-zip \
    php8.0-mysql \
    php8.0-soap \
    php8.0-common \
    php8.0-sockets \
    php8.0-intl \
    php8.0-gd \
    php8.0-mbstring \
    php8.0-curl \
    php8.0-xml \
    php8.0-mbstring \
    php-xdebug

WORKDIR /app
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN phpenmod mysqli
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod env
RUN a2enmod vhost_alias
RUN ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
RUN echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
RUN sed -i '/IncludeOptional sites-enabled/a \\n# Novum Innovation app addition\nIncludeOptional \/app\/assets\/server\/http\/server\.conf' /etc/apache2/apache2.conf
RUN rm -fr /etc/apache2/sites-available/000-default.conf
RUN rm -fr /etc/apache2/sites-enabled/000-default.conf
RUN umask 0000
# RUN composer self-update --1
