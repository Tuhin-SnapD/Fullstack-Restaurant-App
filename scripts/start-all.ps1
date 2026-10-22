# Starts MongoDB, the API and both frontends, each in its own window.
# Usage: powershell -ExecutionPolicy Bypass -File .\scripts\start-all.ps1
$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot

& (Join-Path $PSScriptRoot 'start-mongodb.ps1')

# Seed the database the first time (when no dishes exist yet).
Push-Location (Join-Path $repo 'Server-Restaurant')
$count = node -e "const m=require('mongoose');const c=require('./config');m.connect(c.mongoUrl,{useNewUrlParser:true,useUnifiedTopology:true}).then(async()=>{const n=await m.connection.db.collection('dishes').countDocuments();console.log(n);process.exit(0)}).catch(()=>{console.log(0);process.exit(0)})"
if ([int]$count -eq 0) {
    Write-Host 'Seeding database from db.json...'
    npm run populate
}
Pop-Location

$apps = @(
    @{ Name = 'Backend  (http://localhost:8002)'; Script = 'start-backend.ps1' },
    @{ Name = 'React    (http://localhost:3001)'; Script = 'start-react.ps1' },
    @{ Name = 'Angular  (http://localhost:4200)'; Script = 'start-angular.ps1' }
)

foreach ($app in $apps) {
    Start-Process powershell -ArgumentList @(
        '-NoExit',
        '-ExecutionPolicy', 'Bypass',
        '-Command', "`$Host.UI.RawUI.WindowTitle = '$($app.Name)'; & '$PSScriptRoot\$($app.Script)'"
    ) | Out-Null
}

Write-Host ''
Write-Host 'Started:'
Write-Host '  API      http://localhost:8002'
Write-Host '  React    http://localhost:3001'
Write-Host '  Angular  http://localhost:4200'
