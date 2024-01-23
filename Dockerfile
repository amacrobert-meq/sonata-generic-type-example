FROM php:8.2-fpm as base
WORKDIR /var/task

RUN apt-get update -y \
    && apt-get install -y \
    git vim zip unzip curl libwebp-dev libfreetype6-dev acl procps jq

# PHP extensions
RUN apt-get install -y \
    libjpeg-dev libpng-dev zlib1g-dev \
    libzip-dev \
    libtidy-dev \
    libicu-dev

RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp
RUN docker-php-ext-install gd zip tidy pdo pdo_mysql opcache
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-enable intl
RUN docker-php-ext-enable tidy

COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer
RUN echo 'alias ll="ls -lAh"' >> ~/.bashrc

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash
RUN apt install symfony-cli
