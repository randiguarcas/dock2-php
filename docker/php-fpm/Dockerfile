FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    procps \
    build-essential \
    libgmp-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libmcrypt-dev \
    libzip-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    jpegoptim optipng pngquant gifsicle \
    apt-utils \
    locales \
    git \
    curl \
    zip \
    unzip \
    vim

RUN docker-php-ext-configure gmp
RUN docker-php-ext-install gmp \
    pdo_mysql \
    mbstring \
    zip \
    exif \
    pcntl \
    bcmath \
    gd \
    tokenizer \
    json

#RUN docker-php-ext-enable gmp

WORKDIR /var/www
# COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY ./laravel .

RUN chown -R www-data:www-data .

USER $user

EXPOSE 9000

CMD ["php-fpm"]