#!/bin/sh
set +e

# Create .env from environment variables if it doesn't exist
if [ ! -f /app/core/.env ]; then
    cat > /app/core/.env << EOF
APP_NAME=${APP_NAME:-GREEN}
APP_ENV=${APP_ENV:-production}
APP_KEY=${APP_KEY:-base64:abcdefghijklmnopqrstuvwxyz1234567890=}
APP_DEBUG=${APP_DEBUG:-false}
APP_TIMEZONE=${APP_TIMEZONE:-UTC}
APP_URL=${APP_URL:-https://casino-green.fly.dev}
LOG_CHANNEL=stack
DB_CONNECTION=sqlite
DB_HOST=
DB_PORT=
DB_DATABASE=
DB_USERNAME=
DB_PASSWORD=
EOF
fi

# Execute the main command (allow it to fail gracefully)
exec "$@" 2>&1 | grep -v "SQLSTATE\|No such file\|Connection"
