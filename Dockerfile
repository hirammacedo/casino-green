FROM php:8.3

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl git libgmp-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    && docker-php-ext-install -j$(nproc) gd bcmath gmp pdo pdo_mysql \
    && rm -rf /var/lib/apt/lists/*

COPY . .
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Remove ALL .env files recursively to avoid conflicts
RUN find /app -name ".env*" -type f -delete

RUN cd core && composer install --no-dev --no-scripts 2>&1 || true

EXPOSE 8000
# Clear any development bootstrap cache that may cause issues
RUN rm -rf /app/core/bootstrap/cache/*.php

CMD ["sh", "-c", "cd core && php artisan serve --host=0.0.0.0 --port=8000"]
