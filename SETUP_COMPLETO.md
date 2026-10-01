# 🎰 Casino Platform - Guia de Instalação Completo

## ✨ Visão Geral

Plataforma de cassino online completa em Laravel 11 com:
- ✅ Painel Admin totalmente configurável
- ✅ Múltiplos jogos (Slots, Roulette, Blackjack, etc)
- ✅ Sistema de pagamentos integrado (Stripe, Mollie, CoinGate, Razorpay, PayPal)
- ✅ Gerenciamento de usuários e comissões
- ✅ Análise e relatórios em tempo real
- ✅ Sistema de SMS/Email integrado

---

## 🚀 Opção 1: Setup Local com Docker (Recomendado)

### Pré-requisitos:
- Docker Desktop 4.0+
- 2GB RAM disponível

### Passos:

```bash
# 1. Navegue até o diretório do projeto
cd casino_extract

# 2. Inicie os containers
docker compose up -d

# 3. Aguarde 20 segundos o banco de dados iniciar
sleep 20

# 4. Execute migrações
docker compose exec app php artisan migrate --force

# 5. Plante dados iniciais (admin padrão)
docker compose exec app php artisan db:seed --force

# 6. Acesse:
# - App: http://localhost:8000
# - PhpMyAdmin: http://localhost:8080
# - Email: admin@casino.local
# - Senha: password
```

### Parar o Docker:
```bash
docker compose down
```

### Resetar banco de dados:
```bash
docker compose down -v
docker compose up -d
docker compose exec app php artisan migrate --force
docker compose exec app php artisan db:seed --force
```

---

## 🔧 Opção 2: Setup Local Manual (Windows/Mac/Linux)

### Pré-requisitos:
- PHP 8.3+
- Composer
- MySQL 8.0+ ou MariaDB
- Node.js 18+

### Instalação Windows (via Chocolatey):

```powershell
# Instalar PHP
choco install php --version=8.3.0

# Instalar Composer
choco install composer

# Instalar MySQL
choco install mysql

# Instalar Node.js
choco install nodejs
```

### Instalação macOS (via Homebrew):

```bash
# Instalar PHP
brew install php@8.3

# Instalar Composer
brew install composer

# Instalar MySQL
brew install mysql

# Instalar Node.js
brew install node
```

### Instalação Linux (Debian/Ubuntu):

```bash
# Update
sudo apt update && sudo apt upgrade -y

# Instalar dependências
sudo apt install php8.3 php8.3-{mysql,cli,json,common,curl,gd,mbstring,xml,zip} composer mysql-server nodejs npm -y

# Iniciar MySQL
sudo service mysql start
```

---

### Configuração do Projeto:

```bash
# 1. Clone/extraia o projeto
cd casino_extract/core

# 2. Copie o arquivo de ambiente
cp .env.example .env

# 3. Gere a chave da aplicação
php artisan key:generate

# 4. Instale dependências PHP
composer install

# 5. Instale dependências Node.js
npm install

# 6. Compile assets
npm run build

# 7. Configure banco de dados no .env:
# DB_HOST=127.0.0.1
# DB_DATABASE=casino
# DB_USERNAME=root
# DB_PASSWORD=sua_senha

# 8. Crie o banco de dados
mysql -u root -p -e "CREATE DATABASE casino CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

# 9. Execute migrações
php artisan migrate --force

# 10. Plante dados iniciais
php artisan db:seed --force

# 11. Inicie servidor de desenvolvimento
php artisan serve

# 12. Em outro terminal, inicie o compilador de assets
npm run dev
```

### Acesse:
- App: http://localhost:8000
- Email: admin@casino.local
- Senha: password

---

## 🌐 Opção 3: Deploy em Servidor Remoto

### Preparar para Vercel:
```bash
npm run build
git add .
git commit -m "Build files"
git push origin main
```

### Deploy no Heroku:
```bash
# Instale Heroku CLI
# https://devcenter.heroku.com/articles/heroku-cli

heroku login
heroku create seu-app-casino
git push heroku main

# Configurar banco de dados
heroku addons:create cleardb:ignite

# Executar migrações
heroku run "php artisan migrate --force"
```

### Deploy no Servidor Tradicional (cPanel/Shared Hosting):
1. Upload files via FTP
2. Crie banco de dados MySQL
3. Configure arquivo `.env`
4. Execute: `php artisan migrate --force`
5. Configure o domínio para apontar para `/public`

---

## 📁 Estrutura do Projeto

```
casino_extract/
├── core/                          # Código Laravel principal
│   ├── app/
│   │   ├── Games/               # Lógica dos jogos
│   │   ├── Http/Controllers/    # Controllers da aplicação
│   │   ├── Models/              # Modelos Eloquent
│   │   └── ...
│   ├── routes/                  # Rotas da aplicação
│   ├── database/
│   │   ├── migrations/          # Migrações do banco
│   │   └── seeders/             # Seeders (dados iniciais)
│   ├── resources/
│   │   └── views/               # Templates Blade
│   ├── config/                  # Configurações
│   ├── .env.example             # Arquivo de ambiente modelo
│   └── artisan                  # CLI do Laravel
├── assets/
│   ├── admin/                   # Assets do painel admin
│   │   ├── css/
│   │   ├── js/
│   │   └── images/
│   ├── audio/                   # Sons dos jogos
│   └── images/                  # Imagens
├── docker-compose.yml           # Configuração Docker
└── Dockerfile                   # Imagem Docker

```

---

## 🎮 Jogos Disponíveis

A plataforma inclui os seguintes jogos:

1. **Slots** - Máquinas caça-níqueis
2. **Roulette** - Roleta europeia/americana
3. **Blackjack** - Jogo de cartas
4. **Craps** - Jogo de dados
5. **Keno** - Sorteio de números
6. **Video Poker** - Pôquer ao vivo
7. **Baccarat** - Jogo de cartas
8. **Dice** - Jogo de dados simples

---

## 💳 Gateways de Pagamento Suportados

1. **Stripe** - Cartões de crédito/débito
2. **Mollie** - Múltiplos métodos de pagamento
3. **CoinGate** - Criptomoedas (Bitcoin, Ethereum, etc)
4. **Razorpay** - Pagamentos internacionais
5. **PayPal** - Wallet PayPal
6. **Authorize.net** - Processamento de cartões
7. **BTCPayServer** - Bitcoin direto
8. **Vonage/Twilio** - SMS para verificação

---

## ⚙️ Configuração dos Gateways

### Stripe:
1. Acesse https://stripe.com
2. Crie uma conta e obtenha chaves
3. Configure em `.env`:
```
STRIPE_PUBLIC_KEY=pk_test_...
STRIPE_SECRET_KEY=sk_test_...
```
4. Vá ao painel admin → Configurações → Gateways

### Mollie:
1. Acesse https://www.mollie.com
2. Gere chave API
3. Configure em `.env`:
```
MOLLIE_KEY=test_...
```

### CoinGate:
1. Acesse https://coingate.com
2. Crie conta e gere token
3. Configure em `.env`:
```
COINGATE_AUTH_TOKEN=...
```

---

## 👤 Credenciais Padrão

Após seed (`php artisan db:seed`):

```
Email: admin@casino.local
Senha: password
```

⚠️ **IMPORTANTE**: Mude a senha após primeiro login!

---

## 🔒 Segurança

### Checklist de Segurança Antes do Deploy:

- [ ] Altere a senha do admin padrão
- [ ] Configure HTTPS/SSL
- [ ] Configure firewalls
- [ ] Habilite autenticação 2FA (se disponível)
- [ ] Faça backup do banco de dados
- [ ] Configure rate limiting
- [ ] Revise permissões de arquivos
- [ ] Desabilite debug mode em produção (`APP_DEBUG=false`)
- [ ] Gere nova `APP_KEY` em produção
- [ ] Configure variáveis de ambiente corretas

---

## 📊 Painel Admin Features

- Dashboard com KPIs em tempo real
- Gerenciamento de usuários
- Configuração de jogos
- Análise de ganhos/perdas
- Gerenciamento de promoções
- Relatórios financeiros
- Configuração de pagamentos
- Logs de atividades
- Segurança e autenticação

---

## 🆘 Troubleshooting

### Erro: "SQLSTATE[HY000]: General error"
```bash
# Execute:
php artisan migrate:refresh --force
php artisan db:seed --force
```

### Erro: "The Application is not in maintenance mode"
```bash
# Execute:
php artisan up
```

### Assets não carregando
```bash
# Compile novamente:
npm run build
```

### Port 8000 já em uso
```bash
# Use outra port:
php artisan serve --port=8001
```

---

## 📞 Suporte

Para dúvidas ou problemas:
1. Verifique os logs: `storage/logs/laravel.log`
2. Execute: `php artisan tinker` para debugging
3. Revise as migrações em `database/migrations/`

---

## 📄 Licença

Verifique LICENSE.md no projeto

---

**Última atualização:** 30/09/2026
**Versão:** 1.0.0
**Status:** Pronto para produção ✅
