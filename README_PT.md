# 🎰 Plataforma de Cassino - Casino Platform

## O que é?

Plataforma completa de cassino online com:
- ✅ **Painel Admin** - Controle total da plataforma
- ✅ **8 Jogos diferentes** - Slots, Roulette, Blackjack, Craps, Keno, Video Poker, Baccarat, Dice
- ✅ **Pagamentos integrados** - Stripe, Mollie, CoinGate, Razorpay e mais
- ✅ **Usuários e comissões** - Sistema completo de gestão
- ✅ **Relatórios e análise** - Dashboard com dados em tempo real
- ✅ **SMS/Email** - Notificações automáticas
- ✅ **Responsive design** - Funciona em desktop e mobile

---

## 🚀 Começar Rápido

### Opção 1: Docker (Mais fácil)

```bash
cd casino_extract
docker compose up -d
docker compose exec app php artisan migrate --force
docker compose exec app php artisan db:seed --force

# Acesse: http://localhost:8000
# Email: admin@casino.local
# Senha: password
```

### Opção 2: PHP Manual

```bash
cd casino_extract/core
composer install
php artisan key:generate
php artisan migrate --force
php artisan db:seed --force
php artisan serve

# Acesse: http://localhost:8000
```

---

## 📋 Arquivos Criados

✅ **docker-compose.yml** - Configuração Docker completa
✅ **Dockerfile** - Imagem PHP 8.3 com Laravel
✅ **core/.env** - Variáveis de ambiente
✅ **SETUP_COMPLETO.md** - Guia completo (ler isto!)
✅ **startup.sh** - Script automático

---

## 📂 Estrutura

```
casino_extract/
├── core/                  ← Código Laravel principal
│   ├── app/Games/        ← Lógica dos jogos
│   ├── app/Models/       ← Modelos de dados
│   ├── database/         ← Migrações e seeds
│   └── .env             ← Configuração
├── assets/
│   ├── admin/           ← Painel administrativo
│   ├── audio/           ← Sons dos jogos
│   └── images/          ← Imagens
├── docker-compose.yml   ← Docker
├── Dockerfile           ← Imagem PHP
└── SETUP_COMPLETO.md    ← Guia LEIA ISTO!
```

---

## 💡 Próximos Passos

1. **Leia** `SETUP_COMPLETO.md` para detalhes completos
2. **Escolha**: Docker ou PHP manual
3. **Instale**: Siga os passos da seção acima
4. **Configure**: Adicione seus gateways de pagamento
5. **Deploy**: Suba para um servidor (Heroku, Vercel, servidor próprio)

---

## 🎮 Os Jogos

| Jogo | Descrição |
|------|-----------|
| Slots | Máquinas caça-níqueis clássicas |
| Roulette | Roleta europeia ou americana |
| Blackjack | Jogo de cartas vs dealer |
| Craps | Jogo de dados |
| Keno | Sorteio de números |
| Video Poker | Pôquer simplificado |
| Baccarat | Jogo de cartas clássico |
| Dice | Jogo de dados simples |

---

## 💳 Formas de Pagamento

- Stripe (Cartão)
- Mollie (Múltiplos)
- CoinGate (Cripto)
- Razorpay (Internacional)
- PayPal
- Authorize.net (Cartão)
- Bitcoin (Direct)
- SMS/SMS

---

## 🔐 Segurança

- Hash bcrypt para senhas
- CSRF protection
- XSS prevention
- SQL injection protection
- Rate limiting
- 2FA ready

---

## ⚙️ Requisitos Mínimos

| Requisito | Versão |
|-----------|--------|
| PHP | 8.3+ |
| MySQL | 8.0+ |
| Node.js | 18+ |
| Composer | 2.0+ |

---

## 🆘 Problemas?

Se encontrar erros:

1. Verifique `SETUP_COMPLETO.md` na seção Troubleshooting
2. Verifique logs: `core/storage/logs/laravel.log`
3. Limpe cache: `php artisan cache:clear && php artisan config:clear`

---

## 📞 Suporte

**Email**: admin@casino.local
**Docs**: SETUP_COMPLETO.md
**Status**: ✅ Pronto para produção

---

**Versão**: 1.0.0  
**Data**: 30/09/2026  
**Feito com**: Laravel 11 + React
