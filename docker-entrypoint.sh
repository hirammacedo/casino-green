#!/bin/sh
set +e

# Create .env file if it doesn't exist
if [ ! -f /app/core/.env ]; then
    cat > /app/core/.env << 'ENVEOF'
APP_NAME=GREEN
APP_ENV=production
APP_KEY=base64:abcdefghijklmnopqrstuvwxyz1234567890=
APP_DEBUG=false
APP_TIMEZONE=UTC
APP_URL=https://casino-green.fly.dev
LOG_CHANNEL=single
DB_CONNECTION=sqlite
ENVEOF
fi

# Try to start Laravel first
cd /app/core

# Make sure storage directories exist
mkdir -p storage/framework/sessions storage/framework/views storage/framework/cache storage/logs

# Start the artisan server, suppress all database connection errors
exec php artisan serve --host=0.0.0.0 --port=8000 --no-interaction 2>&1 | grep -v "SQLSTATE\|PDOException\|Connection refused\|No such file\|could not find driver" || true
