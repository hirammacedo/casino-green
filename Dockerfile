FROM php:8.3

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl git libgmp-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    && docker-php-ext-install -j$(nproc) gd bcmath gmp pdo pdo_mysql \
    && rm -rf /var/lib/apt/lists/*

COPY . .
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN cd core && composer install --no-dev --no-scripts

EXPOSE 8000
CMD ["sh", "-c", "cd core && php artisan serve --host=0.0.0.0 --port=8000"]
