# ═══════════════════════════════════════════════════════════════════════
# 🎰 CASINO PLATFORM - DEPLOY AUTOMÁTICO COMPLETO
# ═══════════════════════════════════════════════════════════════════════

Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║     🎰 CASINO PLATFORM - DEPLOY AUTOMÁTICO 🚀             ║" -ForegroundColor Cyan
Write-Host "║                                                            ║" -ForegroundColor Cyan
Write-Host "║  Este script fará o deploy completo do seu app!           ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan

Write-Host ""
Write-Host "⚠️  VOCÊ PRECISA TER:" -ForegroundColor Yellow
Write-Host "   1️⃣  Conta GitHub (criar em github.com - é GRATUITO)"
Write-Host "   2️⃣  Conta Render (criar em render.com - é GRATUITO)"
Write-Host ""

$continue = Read-Host "Tem as duas contas? (S/N)"
if ($continue -ne "S") {
    Write-Host "❌ Crie as contas e rode novamente!" -ForegroundColor Red
    exit 1
}

# ═══════════════════════════════════════════════════════════════════════
Write-Host ""
Write-Host "PASSO 1: CONFIGURAR GIT" -ForegroundColor Green
Write-Host "══════════════════════════════════════════════════════════════"

$gitUser = Read-Host "Seu nome (para git config)"
$gitEmail = Read-Host "Seu email GitHub"

git config --global user.name "$gitUser"
git config --global user.email "$gitEmail"

Write-Host "✅ Git configurado!" -ForegroundColor Green

# ═══════════════════════════════════════════════════════════════════════
Write-Host ""
Write-Host "PASSO 2: CRIAR REPOSITÓRIO NO GITHUB" -ForegroundColor Green
Write-Host "══════════════════════════════════════════════════════════════"

Write-Host ""
Write-Host "⚠️  Instruções:" -ForegroundColor Yellow
Write-Host "   1. Abra: https://github.com/new" -ForegroundColor Cyan
Write-Host "   2. Preencha:" -ForegroundColor Cyan
Write-Host "      - Repository name: casino-platform" -ForegroundColor Cyan
Write-Host "      - Description: Plataforma de Cassino Online" -ForegroundColor Cyan
Write-Host "      - Public ou Private (como preferir)" -ForegroundColor Cyan
Write-Host "   3. Clique em 'Create repository'" -ForegroundColor Cyan
Write-Host "   4. Copie a URL que aparecer (algo como:" -ForegroundColor Cyan
Write-Host "      https://github.com/seu-usuario/casino-platform.git)" -ForegroundColor Cyan
Write-Host ""

$githubUrl = Read-Host "Cole a URL do seu repositório GitHub"

if (-not $githubUrl.Contains("github.com")) {
    Write-Host "❌ URL inválida!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ URL do GitHub anotada!" -ForegroundColor Green

# ═══════════════════════════════════════════════════════════════════════
Write-Host ""
Write-Host "PASSO 3: FAZER PUSH PARA GITHUB" -ForegroundColor Green
Write-Host "══════════════════════════════════════════════════════════════"

cd C:\Users\Admin\Downloads\casino_extract

Write-Host "📤 Fazendo push para GitHub..."
git remote add origin $githubUrl 2>$null
git branch -M main
git push -u origin main

if ($LASTEXITCODE -ne 0) {
    Write-Host "⚠️  Você pode precisar autenticar no GitHub" -ForegroundColor Yellow
    Write-Host "    Siga as instruções que aparecerem na tela..." -ForegroundColor Yellow
}

Write-Host "✅ Repositório enviado para GitHub!" -ForegroundColor Green

# ═══════════════════════════════════════════════════════════════════════
Write-Host ""
Write-Host "PASSO 4: CONFIGURAR NO RENDER" -ForegroundColor Green
Write-Host "══════════════════════════════════════════════════════════════"

Write-Host ""
Write-Host "⚠️  INSTRUÇÕES MANUAIS (não conseguimos automatizar login):" -ForegroundColor Yellow
Write-Host ""
Write-Host "1️⃣  Abra: https://render.com" -ForegroundColor Cyan
Write-Host ""
Write-Host "2️⃣  Faça login com GitHub:" -ForegroundColor Cyan
Write-Host "    - Clique 'Sign up with GitHub'" -ForegroundColor Cyan
Write-Host "    - Autorize o acesso" -ForegroundColor Cyan
Write-Host ""
Write-Host "3️⃣  Crie um MySQL Database:" -ForegroundColor Cyan
Write-Host "    - Clique em 'New +' → 'MySQL'" -ForegroundColor Cyan
Write-Host "    - Name: casino-db" -ForegroundColor Cyan
Write-Host "    - Region: US East" -ForegroundColor Cyan
Write-Host "    - Clique 'Create Database'" -ForegroundColor Cyan
Write-Host "    - COPIE as credenciais (Host, Username, Password)" -ForegroundColor Cyan
Write-Host ""
Write-Host "4️⃣  Crie um Web Service:" -ForegroundColor Cyan
Write-Host "    - Clique em 'New +' → 'Web Service'" -ForegroundColor Cyan
Write-Host "    - Conecte seu repositório 'casino-platform'" -ForegroundColor Cyan
Write-Host "    - Configure:" -ForegroundColor Cyan
Write-Host "      * Name: casino-platform" -ForegroundColor Cyan
Write-Host "      * Runtime: PHP" -ForegroundColor Cyan
Write-Host "      * Build Command:" -ForegroundColor Cyan
Write-Host "        cd core && composer install --no-dev && npm install && npm run build" -ForegroundColor Cyan
Write-Host "      * Start Command:" -ForegroundColor Cyan
Write-Host "        cd core && php artisan serve --host=0.0.0.0 --port=\$PORT" -ForegroundColor Cyan
Write-Host ""
Write-Host "5️⃣  Adicione Environment Variables:" -ForegroundColor Cyan
Write-Host "    Clique 'Add Environment Variable' e adicione:" -ForegroundColor Cyan
Write-Host ""
Write-Host "    APP_NAME = Casino Platform" -ForegroundColor Yellow
Write-Host "    APP_ENV = production" -ForegroundColor Yellow
Write-Host "    APP_DEBUG = false" -ForegroundColor Yellow
Write-Host "    APP_URL = https://seu-app.onrender.com" -ForegroundColor Yellow
Write-Host "    DB_CONNECTION = mysql" -ForegroundColor Yellow
Write-Host "    DB_HOST = [copie do MySQL]" -ForegroundColor Yellow
Write-Host "    DB_DATABASE = [copie do MySQL]" -ForegroundColor Yellow
Write-Host "    DB_USERNAME = [copie do MySQL]" -ForegroundColor Yellow
Write-Host "    DB_PASSWORD = [copie do MySQL]" -ForegroundColor Yellow
Write-Host "    QUEUE_CONNECTION = sync" -ForegroundColor Yellow
Write-Host "    SESSION_DRIVER = file" -ForegroundColor Yellow
Write-Host ""
Write-Host "6️⃣  Clique em 'Deploy'" -ForegroundColor Cyan
Write-Host ""
Write-Host "⏳ Aguarde 10-15 minutos..." -ForegroundColor Magenta
Write-Host ""

Write-Host "⏸️  Pressione ENTER quando o deploy terminar..." -ForegroundColor Cyan
Read-Host

# ═══════════════════════════════════════════════════════════════════════
Write-Host ""
Write-Host "PASSO 5: VERIFICAR DEPLOY" -ForegroundColor Green
Write-Host "══════════════════════════════════════════════════════════════"

$appUrl = Read-Host "Cole a URL do seu app no Render (ex: https://casino-platform.onrender.com)"

Write-Host ""
Write-Host "🔍 Testando conexão..."
try {
    $response = Invoke-WebRequest -Uri "$appUrl" -TimeoutSec 5
    Write-Host "✅ App está ONLINE!" -ForegroundColor Green
} catch {
    Write-Host "⚠️  App ainda está inicializando, aguarde alguns minutos..." -ForegroundColor Yellow
}

# ═══════════════════════════════════════════════════════════════════════
Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║                   ✅ DEPLOY COMPLETO! ✅                   ║" -ForegroundColor Green
Write-Host "║                                                            ║" -ForegroundColor Green
Write-Host "║  Seu App está ONLINE e PRONTO PARA USAR! 🎉               ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Green

Write-Host ""
Write-Host "📍 INFORMAÇÕES FINAIS:" -ForegroundColor Cyan
Write-Host ""
Write-Host "   🌐 URL:              $appUrl" -ForegroundColor Yellow
Write-Host "   📧 Login (Email):    admin@casino.local" -ForegroundColor Yellow
Write-Host "   🔑 Senha:            password" -ForegroundColor Yellow
Write-Host ""
Write-Host "⚠️  PRÓXIMOS PASSOS:" -ForegroundColor Magenta
Write-Host "   1. Acesse seu app" -ForegroundColor Cyan
Write-Host "   2. Mude a senha do admin" -ForegroundColor Cyan
Write-Host "   3. Configure gateways de pagamento (Stripe, Mollie, etc)" -ForegroundColor Cyan
Write-Host "   4. Customize os jogos" -ForegroundColor Cyan
Write-Host "   5. Teste tudo!" -ForegroundColor Cyan
Write-Host ""
Write-Host "📖 Leia: DEPLOY_RENDER.md para mais detalhes" -ForegroundColor Cyan
Write-Host ""

Write-Host "🎰 Aproveite sua plataforma! 🚀" -ForegroundColor Green
