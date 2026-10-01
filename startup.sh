#!/bin/bash

# Script para iniciar o Casino Platform

set -e

echo "🎰 Iniciando Casino Platform..."

# Cores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}[1/4]${NC} Iniciando containers Docker..."
docker compose up -d

echo -e "${BLUE}[2/4]${NC} Aguardando banco de dados estar pronto..."
sleep 10

echo -e "${BLUE}[3/4]${NC} Executando migrações..."
docker compose exec -T app php artisan migrate --force

echo -e "${BLUE}[4/4]${NC} Plantando dados iniciais..."
docker compose exec -T app php artisan db:seed --force 2>/dev/null || true

echo ""
echo -e "${GREEN}✓ Casino Platform iniciado com sucesso!${NC}"
echo ""
echo "📍 URLs disponíveis:"
echo "   App:      http://localhost:8000"
echo "   PhpMyAdmin: http://localhost:8080"
echo ""
echo "📝 Credenciais padrão:"
echo "   Email: admin@casino.local"
echo "   Senha: password"
echo ""
echo "🔧 Comandos úteis:"
echo "   - Ver logs:       docker compose logs -f app"
echo "   - Parar:          docker compose down"
echo "   - Resetar DB:     docker compose down -v && docker compose up -d"
echo ""
