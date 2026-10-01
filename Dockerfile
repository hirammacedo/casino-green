FROM php:8.3

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl git libgmp-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    && docker-php-ext-install -j$(nproc) gd bcmath gmp pdo pdo_mysql \
    && rm -rf /var/lib/apt/lists/*

COPY . .
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN if [ ! -f core/.env ]; then \
    echo 'APP_NAME="GREEN"' > core/.env && \
    echo 'APP_ENV=production' >> core/.env && \
    echo 'APP_KEY=base64:abcdefghijklmnopqrstuvwxyz1234567890=' >> core/.env && \
    echo 'APP_DEBUG=false' >> core/.env && \
    echo 'APP_TIMEZONE=UTC' >> core/.env && \
    echo 'APP_URL=https://casino-green.fly.dev' >> core/.env && \
    echo 'DB_CONNECTION=mysql' >> core/.env && \
    echo 'DB_HOST=' >> core/.env && \
    echo 'DB_DATABASE=' >> core/.env && \
    echo 'DB_USERNAME=' >> core/.env && \
    echo 'DB_PASSWORD=' >> core/.env; \
    fi

RUN cd core && composer install --no-dev --no-scripts

EXPOSE 8000
CMD ["sh", "-c", "cd core && php artisan serve --host=0.0.0.0 --port=8000"]
