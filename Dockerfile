FROM php:8.3

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl git libgmp-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    && docker-php-ext-install -j$(nproc) gd bcmath gmp pdo pdo_mysql \
    && rm -rf /var/lib/apt/lists/*

COPY . .
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN rm -f core/.env && printf '%s\n' 'APP_NAME=GREEN' 'APP_ENV=production' 'APP_KEY=base64:abcdefghijklmnopqrstuvwxyz1234567890=' 'APP_DEBUG=false' 'APP_TIMEZONE=UTC' 'APP_URL=https://casino-green.fly.dev' 'DB_CONNECTION=mysql' 'DB_HOST=' 'DB_DATABASE=' 'DB_USERNAME=' 'DB_PASSWORD=' > core/.env

RUN cd core && composer install --no-dev --no-scripts

EXPOSE 8000
CMD ["sh", "-c", "cd core && php artisan serve --host=0.0.0.0 --port=8000"]
