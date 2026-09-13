FROM php:8.5-cli

LABEL maintainer="haessal@mizutamauki.net"

ENV DEBIAN_FRONTEND=noninteractive

# Upgrade packages and install common tools
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
            ca-certificates \
            curl \
            unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Node.js 24 (LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash - \
        && apt-get install -y nodejs \
        && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
        && npm install -g npm-check-updates

# Install libraries required by Composer/Laravel
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
            libonig-dev \
            libzip-dev \
        && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
        && docker-php-ext-install bcmath mbstring zip pcntl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# Install Laravel installer
RUN composer global require laravel/installer \
        && ln -s /root/.composer/vendor/bin/laravel /usr/bin/laravel
