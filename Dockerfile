FROM php:8.3-fpm

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    git curl zip unzip \
    libgmp-dev libmagick++-dev \
    && docker-php-ext-install bcmath gmp

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY . .

RUN cd core && composer install --optimize-autoloader --no-dev

EXPOSE 8000

CMD ["sh", "-c", "cd core && php artisan serve --host=0.0.0.0 --port=8000"]
