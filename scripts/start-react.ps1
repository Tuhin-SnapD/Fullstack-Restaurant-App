# Starts the React app on http://localhost:3001
# (3000 is avoided because other local projects on this machine use it.)
$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot

Push-Location (Join-Path $repo 'React-Restaurant-App')
try {
    $env:PORT = '3001'
    $env:HOST = '127.0.0.1'   # bind IPv4 so localhost always resolves here
    $env:BROWSER = 'none'
    npm start
} finally {
    Pop-Location
}
