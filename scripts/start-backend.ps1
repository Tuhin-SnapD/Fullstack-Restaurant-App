# Starts the Express API on http://localhost:8002
$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot

Push-Location (Join-Path $repo 'Server-Restaurant')
try {
    if (-not (Test-Path '.env')) {
        Copy-Item 'env.example' '.env'
    }
    New-Item -ItemType Directory -Force -Path 'uploads', 'sessions' | Out-Null
    npm run dev
} finally {
    Pop-Location
}
