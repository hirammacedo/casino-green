# 🚀 Deploy no Render - Guia Completo

## 1️⃣ Criar Conta Render

1. Acesse: https://render.com
2. Clique em **Sign Up**
3. Conecte seu GitHub (ou crie conta manual)

---

## 2️⃣ Conectar Repositório Git

1. Faça push do projeto para GitHub:
```bash
cd C:\Users\Admin\Downloads\casino_extract
git remote add github https://github.com/seu-usuario/casino-platform.git
git push github main
```

2. No Render, clique em **New +** → **Web Service**
3. Selecione **Connect your own repository**
4. Escolha seu repositório `casino-platform`
5. Clique **Connect**

---

## 3️⃣ Configurar Render

### Settings Básicos:
- **Name**: `casino-platform`
- **Root Directory**: `.` (deixar vazio)
- **Runtime**: `PHP`
- **Build Command**:
```bash
cd core && composer install --no-dev --optimize-autoloader && npm install && npm run build
```
- **Start Command**:
```bash
cd core && php artisan serve --host=0.0.0.0 --port=$PORT
```

### Environment Variables:
Clique em **Add Environment Variable** e adicione:

| Chave | Valor |
|-------|-------|
| `APP_NAME` | `Casino Platform` |
| `APP_ENV` | `production` |
| `APP_DEBUG` | `false` |
| `APP_URL` | `https://seu-app.onrender.com` |
| `DB_CONNECTION` | `mysql` |
| `DB_HOST` | *será adicionado pelo Render* |
| `DB_DATABASE` | `casino` |
| `DB_USERNAME` | `casino_user` |
| `DB_PASSWORD` | *gerar senha segura* |

---

## 4️⃣ Adicionar Banco de Dados

1. No Render, clique **New +** → **MySQL**
2. Defina:
   - **Name**: `casino-db`
   - **Plan**: Free
   - **Region**: Mesma do Web Service

3. Após criado, copie as credenciais:
   - Host
   - Username
   - Password
   - Database Name

4. Cole essas credenciais nas **Environment Variables** do Web Service

---

## 5️⃣ Deploy

1. Clique em **Deploy**
2. Aguarde (5-10 minutos)
3. Quando aparecer **Live**, seu app está rodando!

---

## ✅ Verificar Deploy

Acesse: `https://seu-app.onrender.com`

Login:
```
Email: admin@casino.local
Senha: password
```

---

## 🔧 Próximas Etapas

### Configurar Domínio Personalizado:
1. Render → Settings → Domains
2. Adicione seu domínio
3. Configure DNS (instruções no Render)

### Adicionar Gateways de Pagamento:
1. Acesse painel admin
2. Vá para Settings → Payment Gateways
3. Adicione chaves (Stripe, Mollie, etc)
4. Salve as variáveis de ambiente

### Backup do Banco:
1. No Render, vá para MySQL
2. Clique em **Connect**
3. Use PHPMyAdmin ou mysqldump

---

## 🆘 Troubleshooting

### Erro: "Build Failed"
```bash
# Verifique logs:
# Render → Logs (abas)
```

### App não conecta ao banco:
```
Render → Web Service → Environment
Verifique se DB_HOST, DB_USER, DB_PASSWORD estão corretos
```

### Assets não carregam:
```bash
cd core && npm run build
git push github main
# Render fará rebuild automático
```

---

## 📊 Plano Gratuito Render

✅ Hospedagem ilimitada
✅ Rebuild automático no push
✅ MySQL grátis
✅ HTTPS/SSL grátis
⚠️ Web Service hiberna após 15 min sem requisição (acordar em ~30s)

---

## 🎯 Resumo do Deploy

| Etapa | Tempo |
|-------|-------|
| 1. Criar conta | 2 min |
| 2. Conectar GitHub | 3 min |
| 3. Configurar app | 5 min |
| 4. Adicionar banco | 3 min |
| 5. Deploy | 10 min |
| **Total** | **~23 min** |

---

## ✨ Seu App está PRONTO!

```
🌐 URL: https://casino-platform.onrender.com
📊 Admin: admin@casino.local / password
💾 Banco: MySQL no Render
📧 Email: Log-based (configure depois)
💳 Payments: Configure gateways no admin
```

**Aproveite! 🎰**
